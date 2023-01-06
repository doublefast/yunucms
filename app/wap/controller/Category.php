<?php
namespace app\wap\controller;
use app\wap\model\ContentModel;
use app\wap\model\CategoryModel;
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

		$tplstr = $category['tpl_cover'] ? $category['tpl_cover'] : $category['tpl_list'];

		if ($tplstr == '') {
			$this->error('模版不存在'); exit();
		}

		//$category['ys_title'] = $category['title'];//记录原始title

		$catemodel = new CategoryModel();
		$category = $catemodel->getCategoryArea($category);

		$category = update_str_dq($category, session('sys_areainfo'));
		
		$this->assign([
			'category' => $category,
/*			'seo_title' => $category['seo_title'],
			'seo_keywords' => $category['seo_keywords'],
			'seo_description' => $category['seo_desc'],*/
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);

		return $this->fetch($this->tpl_file.$tplstr);
	}
}
?>