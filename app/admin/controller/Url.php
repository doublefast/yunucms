<?php
namespace app\admin\controller;
use think\Config;

class Url extends Common
{
    public function index()
    {
    	$coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            $param = add_slashes_recursive($param);
            
            setConfigfile($coffile, array_merge($conflist, $param));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        return $this->fetch();
    }

}
