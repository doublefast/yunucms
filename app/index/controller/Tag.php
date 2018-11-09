<?php
namespace app\index\controller;
use think\Db;

class Tag extends Common
{
	public function index(){
		$input = input();
		$input['title'] = urldecode($input['title']);
		$this->assign($input);
		return $this->fetch();
	}
}
?>