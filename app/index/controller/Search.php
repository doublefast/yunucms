<?php
namespace app\index\controller;
use think\Db;

class Search extends Common
{
	public function index(){
		$input = input();

		$this->assign([
			'keyword' => $input['key']
		]);
		return $this->fetch();
	}
}
?>