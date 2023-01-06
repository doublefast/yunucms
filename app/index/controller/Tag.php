<?php
namespace app\index\controller;
use think\Db;

class Tag extends Common
{
	public function index(){
		$input = input();
		$info['title'] = htmlspecialchars($input['title']);
		$info['title'] = str_replace(".html", "", $info['title']);
		$taginfo = db('tagurl')->where(["tagurl"=>$info['title']])->find();
		$coninfo = db('content')->where(["tag"=>['like','%'.$info['title'].'%']])->find();
		if (empty($taginfo) && empty($coninfo)) {
			abort(404); exit();
		}
		if ($taginfo) {
			$info['title'] = $taginfo['tagname'];
			db('tagurl')->where(['id'=>$taginfo['id']])->setInc('click');
		}
    	$taginfo = update_str_dq($taginfo, session('sys_areainfo'));
		$this->assign($info);
		$this->assign(['tag'=>$taginfo]);
		return $this->fetch();
	}
}
?>