<?php
namespace app\wap\controller;
use think\Db;

class Search extends Common
{
	public function index(){
		$input = input();
		$this->assign([
			'keyword' => htmlspecialchars($input['key']),
			'cid' => isset($input['cid']) ? htmlspecialchars($input['cid']) : 0
		]);
		return $this->fetch($this->tpl_file."search_index.html");
	}
}
?>