<?php
namespace app\wap\controller;
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
        return $this->fetch();
    }
    public function search(){
        $search = controller('Search','controller');
        echo $search->index();
    }
    public function show(){
        $show = controller('Show','controller');
        echo $show->index();
    }
    public function category(){
        $category = controller('Category','controller');
        echo $category->index();
    }
}
