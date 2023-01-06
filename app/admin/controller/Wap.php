<?php
namespace app\admin\controller;
use think\Config;

class Wap extends Common
{
    public function index()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.'); 
            if ($param['wap_pre']) { 
                if (db('area')->where(['etitle'=>$param['wap_pre']])->find()) {
                    return json(['code' => 2, 'data' => '', 'msg' => 'WAP域名前缀请不要与地区别名重复']); exit();
                }
            }

            unset($param['file']);
            $param['wap_auto'] = array_key_exists("wap_auto", $param) ? 1 : 0;
            $param['pc_auto'] = array_key_exists("pc_auto", $param) ? 1 : 0;
            $param['pc_mip'] = array_key_exists("pc_mip", $param) ? 1 : 0;
            $param['wap_mip'] = array_key_exists("wap_mip", $param) ? 1 : 0;
            $param['wap_levelurl'] = array_key_exists("wap_levelurl", $param) ? 1 : 0;
            $param = add_slashes_recursive($param);
            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']); exit();
        }
        return $this->fetch();
    }
}
