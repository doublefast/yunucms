<?php
namespace app\index\controller;
use app\index\model\ContentModel;
use app\index\model\CategoryModel;
use think\Db;

class Show extends Common
{
	public function index(){
		$id = input('id');
		$etitle = input('etitle', '', 'trim');
		$cw = input('cw', '', 'trim');

		if (is_numeric($etitle)) {
			$id = (int)$etitle;
		}
		if (empty($id) && empty($etitle)) {
			$this->error('参数错误');
			exit();
		}
		if ($etitle) {
			$where = ['etitle'=>$etitle];
		}
		if ($id) {
			$where = ['id'=>$id];
		}

		$content = db('content')->where($where)->find();
		//非正常独立内容链接不显示
		
	    if ($content['area'] != '') {
	    	$area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
	    	if ($area) {
	    		if (!strstr($content['area'], ','.$area['id'].',')) {
		    		$this->error('非正常独立内容链接不显示');
					exit();
		    	}
	    	}else{
	    		$this->error('非正常独立内容链接不显示');
				exit();
	    	}
	    }

		if (empty($content)) {
			abort(404);
			exit();
		}
		db('content')->where(['id'=>$content['id']])->setInc('click');//增加浏览

		$catemodel = new CategoryModel();
		$category = $catemodel->getOneCategory($content['cid']);

		if (empty($category)) {
			abort(404);
			exit();
		}

		if ($category['tpl_show'] == '') {
			$this->error('模版不存在');
			exit();
		}
		$conmodel = new ContentModel();
		$content = $conmodel->getContentByCon($content);

		$content['ys_title'] = $content['title'];//记录原始title

		if ($cw !== '') {
			$cwkey = explode(',', config('sys.seo_cwkeyword'));
			$content['title'] = $content['title'].$cwkey[$cw];
		}

		$content = $conmodel->getContentArea($content);

		$prev = $conmodel->getContentPrev($category['id'], $content['id']);
		$next = $conmodel->getContentNext($category['id'], $content['id']);

		$content['prev'] = $prev['infostr'];
		$content['prevurl'] = $prev['infourl'];
		$content['prevtitle'] = $prev['infotitle'];

		$content['next'] = $next['infostr'];
		$content['nexturl'] = $next['infourl'];
		$content['nexttitle'] = $next['infotitle'];


		
		$content = update_str_dq($content, config('sys.sys_area'));
		$this->assign([
			'content' => $content,
			'category' => $category,
/*			'seo_title' => $content['seo_title'],
			'seo_keywords' => $content['seo_keywords'],
			'seo_description' => $content['seo_desc'],*/
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);

		return $this->fetch($this->tpl_file.$category['tpl_show']);
	}
}

?>