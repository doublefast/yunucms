<?php
namespace app\index\controller;
use think\Db;

class Search extends Common
{
	public function index(){
		$input = input();

		$this->assign([
			'keyword' => htmlspecialchars(isset($input['key']) ? $input['key'] : ""),
			'cid' => isset($input['cid']) ? htmlspecialchars($input['cid']) : 0
		]);
		return $this->fetch();
	}
}
?>