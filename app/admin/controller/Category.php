<?php
namespace app\admin\controller;
use app\admin\model\CategoryModel;
use app\admin\model\DiymodelModel;
use app\admin\model\ContentModel;
use think\Config;
use think\Db;

class Category extends Common
{
    public function index(){
        $category = new CategoryModel();
        $diymodel = new DiymodelModel();
        $nav = new \org\Leftnav;
        $infolist = $category->getAllcategory(); 
        $indexCate = new \app\index\model\CategoryModel();
        foreach ($infolist as $k => $v) {
            $minfo = $diymodel->getOneDiymodel($v['mid']);
            $infolist[$k]['mname'] = $minfo['title'];
            $nname = "";
            switch ($v['nav']) {
                case '0':
                    $tname = "不显示";
                    break;
                case '1':
                    $tname = "主导航";
                    break;
                case '2':
                    $tname = "尾导航";
                    break;
                case '3':
                    $tname = "都显示";
                    break;
            }
            $infolist[$k]['tname'] = $tname;
            $infolist[$k]['preview'] = $indexCate->getCategoryUrl($v);
        }

        $arr = $nav::rule($infolist);

        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));
        $this->assign('infolist', $arr);
        
        runhook('sys_admin_category');
        return $this->fetch();
    }

    public function addcategory(){
        $diymodel = new DiymodelModel();
        $category = new CategoryModel();
        $nav = new \org\Leftnav;
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $category->insertcategory($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);

        //模版文件列表

        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
        return $this->fetch();
    }

    public function batchaddcategory(){
    	$diymodel = new DiymodelModel();
        $category = new CategoryModel();
        $nav = new \org\Leftnav;

        if(request()->isAjax()){
            $param = input();
            $titlelist = explode('***', $param['titlelist']);
            unset($param['titlelist']);
            $datalist = [];
            foreach ($titlelist as $k => $v) {
                if ($v) {
                    $param['title'] = $v;
                    $datalist[] = $param;
                }
            }
            if ($datalist) {
            	$jg = $category->batchinsertcategory($datalist);
            }
            if ($jg['code'] == 1) {
            	return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加栏目：'.$jg['data'].'个']);
            }else{
            	return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加栏目：0个']);
            }
            
        }
        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);
        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
    	return $this->fetch();
    }
    public function editcategory(){
        $category = new CategoryModel();
        $diymodel = new DiymodelModel();
        $content = new ContentModel();
        $nav = new \org\Leftnav;
        $info = $category->getOnecategory(input('param.id'));
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $category->editcategory($param);
            if ($flag['code'] == 1) {
                //判断模型是否变更
                if ($info['mid'] != $param['mid']) {
                    $conlist = $content->moveContentByCid($info['id'], $info['mid'], $param['mid']);
                }
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $this->assign('info', $info);

        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);

        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
        return $this->fetch();
    }
    public function editcategorycon(){
        $category = new CategoryModel();
        if(request()->isAjax()){
            $param = input('post.');
            Db::name('category')->where(['id'=>$param['id']])->setField(['desc'=>$param['desc'],'content'=>$param['content']]);
            return json(['code' => 1, 'data' => "", 'msg' => "编辑栏目成功"]);
        }
    }

    public function delcategory(){
        $id = input('param.ids');
        $category = new CategoryModel();
        $content = new ContentModel();
        

        $catlist = $category->getAllCategory();

        $cidlist = [];
       	if (strstr($id, ',')) {
	    	$pidarr = explode(',', $id);
	    	foreach ($pidarr as $k => $v) {
	    		if ($v) {
	    			$catzj = $category->getChildsId($catlist, $v, 1);
		    		foreach ($catzj as $k1 => $v1) {
		    			array_push($cidlist, $v1); 
		    		}
	    		}
	    	}
	    }else{
	    	$cidlist = $category->getChildsId($catlist, $id, 1);
	    }
        //删除该文章下的内容
        $content->delContentByCid($cidlist);
        //删除分类
        $flag = $category->delcategory($cidlist);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortcategory(){
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('category');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
        
    }

    public function etitlecategory(){
        $id = input('param.id');
        $etitle = input('param.etitle');
        $category = new CategoryModel();
        return json($category->editCategorytitle($id, $etitle));
    }

    public function dotemplate(){
        $ids = input('param.ids');
        $tpl_cover = input('param.tpl_cover') == '选择模板' ? '' : input('param.tpl_cover');
        $tpl_list = input('param.tpl_list') == '选择模板' ? '' : input('param.tpl_list');
        $tpl_show = input('param.tpl_show') == '选择模板' ? '' : input('param.tpl_show');
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['tpl_cover'=>$tpl_cover,'tpl_list'=>$tpl_list,'tpl_show'=>$tpl_show]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function doseo(){
        $ids = input('param.ids');
        $seo_title = input('param.seo_title');
        $seo_keywords = input('param.seo_keywords');
        $seo_desc = input('param.seo_desc');
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->select();
        foreach ($flag as $k => $v) {
            $new_seo_title = str_replace("{栏目名称}", $v['title'], $seo_title);
            $new_seo_keywords = str_replace("{栏目名称}", $v['title'], $seo_keywords);
            $new_seo_desc = str_replace("{栏目名称}", $v['title'], $seo_desc);
            $db->where(['id'=>$v['id']])->setField(['seo_title'=>$new_seo_title,'seo_keywords'=>$new_seo_keywords,'seo_desc'=>$new_seo_desc]);
        }
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
    public function doqita(){
        $ids = input('param.ids');
        $cover = input('param.cover');
        $status = input('param.status');
        $target = input('param.target');
        $nav = input('param.nav');

        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['cover'=>$cover,'status'=>$status,'target'=>$target,'nav'=>$nav]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function doarea(){
        $ids = input('param.ids');
        
        $isarea = input('param.isarea');
        $areatitle = input('param.areatitle');
        $areacontitle = input('param.areacontitle');
        $catmainurl = input('param.catmainurl');
        $conmainurl = input('param.conmainurl');
        
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['isarea'=>$isarea,'areatitle'=>$areatitle,'areacontitle'=>$areacontitle,'catmainurl'=>$catmainurl,'conmainurl'=>$conmainurl]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function statecategory(){
        $id = input('param.id');
        $db = Db::name('category');
        $status =  $db->where(['id'=>$id])->value('status');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>0]);
            return json(['code' => 1, 'data' => '', 'msg' => '已关闭']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => '', 'msg' => '已开启']);
        }
    }

    public function edittitle()
    {
        $id = input('param.id');
        $title = input('param.title');
        $db = Db::name('category');
        $flag = $db->where(['id'=>$id])->setField(['title'=>$title]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
}
