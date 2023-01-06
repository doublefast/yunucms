<?php
namespace app\wap\controller;
use app\wap\model\ContentModel;
use app\wap\model\CategoryModel;
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
			$this->error('参数错误'); exit();
		}
		if ($etitle) {
			$where = ['etitle'=>$etitle];
		}
		if ($id) {
			$where = ['id'=>$id];
		}

		$content = db('content')->where($where)->find();
		if (empty($content)) {
			abort(404); exit();
		}
		db('content')->where(['id'=>$content['id']])->setInc('click');//增加浏览
		$content['ys_title'] = $content['title'];//记录原始title
		$catemodel = new CategoryModel();
		$category = $catemodel->getOneCategory($content['cid']);

		if (empty($category)) {
			abort(404); exit();
		}

		if ($category['tpl_show'] == '') {
			$this->error('模版不存在'); exit();
		}
		$conmodel = new ContentModel();
		$content = $conmodel->getContentByCon($content);
		$content = $conmodel->getContentArea($content);
		
		if ($cw !== '') {
			if (is_numeric($cw)) {
				$cwkey = explode(',', config('sys.seo_cwkeyword'));
				$content['title'] = $content['title'].$cwkey[$cw];
			}else{
				$content['title'] = $cw;
			}
		}

		
		$prev = $conmodel->getContentPrev($category['id'], $content['id']);
		$next = $conmodel->getContentNext($category['id'], $content['id']);

		$content['prev'] = $prev['infostr'];
		$content['prevurl'] = $prev['infourl'];
		$content['prevtitle'] = $prev['infotitle'];

		$content['next'] = $next['infostr'];
		$content['nexturl'] = $next['infourl'];
		$content['nexttitle'] = $next['infotitle'];

		$pccontent = new \app\index\model\ContentModel();

		$content = update_str_dq($content, session('sys_areainfo'));
		$content['pcurl'] = $pccontent->getContentUrl($content, '', []);

		//{标题名称}
		foreach ($content as $k1 => $v1) {
            $content[$k1] = str_replace('{标题名称}', $content['title'], $v1);;
        }
		$this->assign([
			'content' => $content,
			'category' => $category,
			'seo_title' => $content['seo_title'],
			'seo_keywords' => $content['seo_keywords'],
			'seo_description' => $content['seo_desc'],
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);
		$tplfile = !empty($content['tpl_show']) && $content['tpl_show'] != "选择模板" ? $content['tpl_show'] : $category['tpl_show'];
		return $this->fetch($this->tpl_file.$tplfile);
	}
}

?>