<?php
namespace app\admin\controller;
use think\Controller;
use think\Log;
use think\Config;
///index.php?s=admin/repair/menu112
class Repair extends Controller
{
	public function _initialize()
    {
    	header("Access-Control-Allow-Origin: *");
    	header("Content-type:text/html;charset=utf-8");
    }

    public function menu112()
    {
		echo "YUNUCMS v1.1.2 运营数据 菜单修复<br><br>";
		$menu = db('auth_rule')->where("title = '运营数据'")->find();
		if ($menu) {
			$res = db('auth_rule')->where("title IN ('百度统计','主词监控')")->setField('pid', $menu['id']);
			echo " -- 修复数量：".$res."<br>";
		}else{
			echo " -- 程序非 V1.1.2 版本<br>";
		}
    }
}
