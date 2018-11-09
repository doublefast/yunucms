<?php
namespace app\wap\controller;
use think\Db;

class Search extends Common
{
	public function index(){
		$input = input();
		$this->assign($input);
		return $this->fetch();
	}
}
?>