<?php
namespace app\index\controller;
use app\index\model\ContentModel;
use app\index\model\CategoryModel;
use think\Db;

class Category extends Common
{
	public function index(){
		$id = input('id');
		$ctitle = input('ctitle', '', 'trim');
		
		if (is_numeric($ctitle)) {
			$id = (int)$ctitle;
		}
		if (empty($id) && empty($ctitle)) {
			$this->error('参数错误'); exit();
		}
		if ($ctitle) {
			$where = ['etitle'=>$ctitle];
		}
		if ($id) {
			$where = ['id'=>$id];
		}

		$category = db('category')->where($where)->find();
		if (empty($category)) {
			abort(404); exit();
		}
		if (!$category['isarea'] && !empty(session('sys_areainfo'))) {
			abort(404); exit();
		}

		//显示静态
		$page = input("param.page/d", 0);
		$listfilename = $page > 1 ? $category['id']."_".$page : $category['id'];
		$htmlfilename = session('sys_areainfo') ? $listfilename."_".session('sys_areainfo')['etitle'] : $listfilename;
		$htmlfilestr = "./caches/list/".$htmlfilename.".html";
		if (file_exists($htmlfilestr)) {
	        if ((date('d', filemtime($htmlfilestr)) != date('d', time())) && (config('sys.indexhtml_time') < date('H:i:s',time()))) {
	            unlink($htmlfilestr);
	        }else{
	            return $this->fetch($htmlfilestr); exit();
	        }
		}

		$tplstr = $category['tpl_cover'] ? $category['tpl_cover'] : $category['tpl_list'];

		if ($tplstr == '') {
			$this->error('模版不存在'); exit();
		}
		$category['ys_title'] = $category['title'];

		$catemodel = new CategoryModel();
		$category = $catemodel->getCategoryArea($category);

		$category = update_str_dq($category, session('sys_areainfo'));
		$category['content'] = disablewords($category['content']);
		
		$this->assign([
			'pagenumber' => input('page', 0),
			'category' => $category,
			'seo_title' => $category['seo_title'],
			'seo_keywords' => $category['seo_keywords'],
			'seo_description' => $category['seo_desc'],
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);
		runhook('sys_index_category');
		//静态文件生成
		if (config('sys.indexhtml')) {
			$dir = "./caches/list/";
		    if(!is_dir($dir)){
		        mkdir($dir, 0777, true);
		    }
	       	$info = $this->buildHtml($htmlfilename, $dir, $this->tpl_file.$tplstr);
		}
		return $this->fetch($this->tpl_file.$tplstr);
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
	public function _empty()
    {
    	abort(404);
    }
}
?>