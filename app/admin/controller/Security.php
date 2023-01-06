<?php
namespace app\admin\controller;
use think\Config;

class Security extends Common
{
    public function index()
    {
    	$coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.'); 
            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']); exit();
        }
        return $this->fetch();
    }

    public function checkIndexHtml()
    {
        if (config('cloud.grant') && $this->checkrecordapi()) {
            $data['state'] = 0;
            $data['msg'] = "";
        }else{
            $data['state'] = 1;
            $data['msg'] = "请绑定正确授权域名后再开启";
        }
        return json_encode($data);
    }

}
