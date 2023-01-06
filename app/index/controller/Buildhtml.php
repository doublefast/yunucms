<?php
namespace app\index\controller;
use app\index\model\ContentModel;
use app\index\model\CategoryModel;
use think\Db;

class Buildhtml extends Common
{
	public function htmlmcontent(){
		if(request()->isAjax()){
            $fid =  input("param.fid/d", 0);
            $achievepage = input("param.achieve/d", 0);
            $htmltype = input('htmltype');
            //主站栏目
	        if ($htmltype == "mainlist") {
	        	$data = $this->handelBuildCategory($fid, $achievepage);
	        }
	        //主站内容
	        if ($htmltype == "maincontent") {
	            $data = $this->handelBuildArticle($fid, $achievepage);
	        }
	        //分站首页
	        if ($htmltype == "areaindex") {
	        	$data = $this->handelBuildIndex($fid, $achievepage);
	        }
	        //分站栏目
	        if ($htmltype == "arealist") {
	        	$data = $this->handelBuildCategoryArea($fid, $achievepage);
	        }
            return json($data);
        }
	}

	//生成地区首页
	private function handelBuildIndex($fid, $achievepage = 0, $batch = true, $limit = 10){
        function_exists('set_time_limit') && set_time_limit(0);
        $concount = db('area')->where(['isopen'=>1])->count();
        $data['allpagetotal'] = $concount;
        $data['achievepage'] = $achievepage;
        $conlist = db('area')->where(['isopen'=>1])->orderRaw("id asc")->limit($fid*$limit.",".$limit)->select();
        foreach ($conlist as $k => $v) {
            $this->buildIndex($v['etitle']);
            $data['achievepage'] +=  1;
        }
        $data['fid'] = $fid + 1;
        return ['code' => 1, 'data' => $data, 'msg' => ''];
    }
    //生成地区首页
	private function buildIndex($etitle){
		curl(config('sys.site_protocol')."://".config('sys.site_url')."/index.php?s=index/index/index&area=".$etitle);
	}
	//生成地区栏目页
	private function handelBuildCategoryArea($fid, $achievepage = 0, $batch = true, $limit = 1){
        function_exists('set_time_limit') && set_time_limit(0);
        $areacount = db('area')->where(['isopen'=>1])->count();
        $catecount = db('Category')->field('id,jumpurl')->count();
        $data['allpagetotal'] = $areacount * $catecount;
        $data['achievepage'] = $achievepage;


        $arealist = db('area')->where(['isopen'=>1])->orderRaw("id asc")->limit($fid*$limit.",".$limit)->select();
        foreach ($arealist as $k => $v) {
            $this->buildCategoryArea($v['etitle']);
            $data['achievepage'] +=  $catecount;
        }
        $data['fid'] = $fid + 1;
        return ['code' => 1, 'data' => $data, 'msg' => ''];
    }
	//生成地区栏目页
	private function buildCategoryArea($etitle){
		$catelist = db('category')->where(['status'=>1,'isarea'=>1])->field('id,etitle,jumpurl')->select();
		foreach ($catelist as $k => $v) {
			if ($v['jumpurl'] == "") {
				$htmlfilestr = "./caches/list/".$v['id']."_".$etitle.".html";
				@unlink($htmlfilestr);
				switch (config('sys.url_model')) {
		            case '1'://动态
		                curl(config('sys.site_protocol')."://".config('sys.site_url')."/index.php?s=index/category/index&ctitle=".$v['id']."&area=".$etitle);
		                break;
		            case '3'://伪静态
		                curl(config('sys.site_protocol')."://".config('sys.site_url')."/".$etitle."_".$v['etitle']."/");
		               	break;
		        }
			}
		}
	}
	//生成详情页
	private function handelBuildArticle($fid, $achievepage = 0, $batch = true, $limit = 30){
        function_exists('set_time_limit') && set_time_limit(0);
        $concount = db('content')->field('id,jumpurl')->count();
        $data['allpagetotal'] = $concount;
        $data['achievepage'] = $achievepage;
        $conlist = db('content')->field('id,jumpurl')->orderRaw("id asc")->limit($fid*$limit.",".$limit)->select();
        foreach ($conlist as $k => $v) {
            if ($v['jumpurl'] == "") {    
                $this->buildArticle($v['id']);
            }
            $data['achievepage'] +=  1;
        }
        $data['fid'] = $fid + 1;
        return ['code' => 1, 'data' => $data, 'msg' => ''];
    }
    //生成详情页
	private function buildArticle($id){
		$content = db('content')->where(['id'=>$id])->find();
		$content['ys_title'] = $content['title'];
		$conmodel = new ContentModel();
		$content = $conmodel->getContentByCon($content);

		$catemodel = new CategoryModel();
		$category = $catemodel->getOneCategory($content['cid']);
		if (empty($category)) {
			abort(404); exit();
		}

		$prev = $conmodel->getContentPrev($category['id'], $content['id']);
		$next = $conmodel->getContentNext($category['id'], $content['id']);

		$content['prev'] = $prev['infostr'];
		$content['prevurl'] = $prev['infourl'];
		$content['prevtitle'] = $prev['infotitle'];

		$content['next'] = $next['infostr'];
		$content['nexturl'] = $next['infourl'];
		$content['nexttitle'] = $next['infotitle'];
		$content = $conmodel->getContentArea($content);
		$content = update_str_dq($content, session('sys_areainfo'));
		
		foreach ($content as $k1 => $v1) {
            $content[$k1] = str_replace('{标题名称}', $content['title'], $v1);;
        }
		$this->assign([
			'content' => $content,
			'category' => $category,
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);
		$tplfile = !empty($content['tpl_show']) && $content['tpl_show'] != "选择模板" ? $content['tpl_show'] : $category['tpl_show'];
		if ($tplfile != '') {
			//静态文件生成
			$dir = "./caches/content/";
			if(!is_dir($dir)){
			    mkdir($dir, 0777, true);
			}
			$htmlfilename = session('sys_areainfo') ? $content['id']."_".session('sys_areainfo')['etitle'] : $content['id'];
			$htmlfilestr = "./caches/content/".$htmlfilename.".html";
		    $info = $this->buildHtml($htmlfilename, $dir, $this->tpl_file.$tplfile);
		}
	}
	//生成栏目页
	private function handelBuildCategory($fid, $achievepage = 0, $batch = true, $limit = 30){
        function_exists('set_time_limit') && set_time_limit(0);
        $concount = db('Category')->field('id,jumpurl')->count();
        $data['allpagetotal'] = $concount;
        $data['achievepage'] = $achievepage;
        $conlist = db('Category')->field('id,jumpurl')->orderRaw("id asc")->limit($fid*$limit.",".$limit)->select();
        foreach ($conlist as $k => $v) {
            if ($v['jumpurl'] == "") {    
                $this->buildCategory($v['id']);
            }
            $data['achievepage'] +=  1;
        }
        $data['fid'] = $fid + 1;
        return ['code' => 1, 'data' => $data, 'msg' => ''];
    }
    //生成栏目页
	private function buildCategory($id){
		$category = db('category')->where(['id'=>$id])->find();
		switch (config('sys.url_model')) {
            case '1'://动态
                curl(config('sys.site_protocol')."://".config('sys.site_url')."/index.php?s=index/category/index&ctitle=".$category['id']);
                break;
            case '3'://伪静态
                curl(config('sys.site_protocol')."://".config('sys.site_url')."/".$category['etitle']."/");
               	break;
        }

		/*$category = db('category')->where(['id'=>$id])->find();
		if (empty($category)) {
			abort(404); exit();
		}
		$tplstr = $category['tpl_cover'] ? $category['tpl_cover'] : $category['tpl_list'];
		if ($tplstr == '') {
			$this->error('模版不存在'); exit();
		}
		$category['ys_title'] = $category['title'];
		$catemodel = new CategoryModel();
		$category = $catemodel->getCategoryArea($category);
		$category = update_str_dq($category, session('sys_areainfo'));
		$this->assign([
			'category' => $category,
			'seo_title' => $category['seo_title'],
			'seo_keywords' => $category['seo_keywords'],
			'seo_description' => $category['seo_desc'],
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);

		//$page = input("param.page/d", 0);
		//$listfilename = $page > 1 ? $category['id']."_".$page : $category['id'];
		$listfilename = $category['id'];
		$htmlfilename = session('sys_areainfo') ? $listfilename."_".session('sys_areainfo')['etitle'] : $listfilename;

		//静态文件生成
		$dir = "./caches/list/";
		if(!is_dir($dir)){
		    mkdir($dir, 0777, true);
		}
	    $info = $this->buildHtml($htmlfilename, $dir, $this->tpl_file.$tplstr);*/
	}
	private function buildHtml($htmlfile='', $htmlpath='', $templateFile='') {
        $content = $this->fetch($templateFile);
        $htmlpath = !empty($htmlpath) ? $htmlpath : APP_PATH.'/html';
        $htmlfile = $htmlpath.$htmlfile.'.html';
        if(file_put_contents($htmlfile, $content) === false) {
            return false;
        } else {
            return true;
        }
    }
}
?>