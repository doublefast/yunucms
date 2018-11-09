<?php
namespace app\index\controller;
use think\Db;

class Index extends Common
{
    public function index()
    {   	
        //记录浏览
    	$browse = array(
    		'ip' => request()->ip(),
    		'time' => time(),
    		'type' => is_mobile() ? 2 : 1,
    	);
    	db('browse')->insert($browse);
    	if(config('sys.site_guide') == 1 && request()->url() == "/") {
			return $this->fetch($this->tpl_file.'index_default.html');
		}
        return $this->fetch();
    }
}
