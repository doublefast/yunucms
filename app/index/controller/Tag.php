<?php
namespace app\index\controller;
use think\Db;

class Tag extends Common
{
	public function index(){
		$input = input();
		$info['title'] = htmlspecialchars($input['title']);
		$this->assign($info);
		return $this->fetch();
	}
}
?>