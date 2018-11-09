<?php
namespace app\index\controller;
use think\Controller;
use think\Config;
use think\Db;

class Common extends Controller{
 	public function _initialize()
    {
        if (config('app_debug')) {
            error_reporting(E_ALL);
        }else{
        	error_reporting(E_ERROR);
        }
        
        $lock = 'data/install.lock';
        if(!is_file($lock)){
            $this->redirect('/index.php?s=index/install/index');
        }

    	$module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
        $this->tpl_file = './template/'.config('sys.theme_style').'/'.$module.'/';
        $area = '';
        if (input('area')) {
        	$area = input('area');
            $areadata = db('area')->where(['etitle'=>$area,'isurl'=>1])->find();

            if ($areadata) {
                abort(404);
            }
        }

        if ($_SERVER['HTTP_HOST'] != config('sys.site_url')) {
            $levelurl = str_replace(config('sys.site_levelurl'), '', $_SERVER['HTTP_HOST']);
            if ($levelurl != '') {
            	$levelurl = str_replace('.', '', $levelurl);
            	$area = $levelurl != 'www' ? $levelurl : $area;
                    
                $areadata = db('area')->where(['etitle'=>$area,'isurl'=>1])->find();
                if (!$areadata) {
                    abort(404);
                }
            }
        }
        if (!$area && config('sys.seo_default_area')) {
            $defaultarea = db('area')->where(['id'=>config('sys.seo_default_area')])->value('etitle');
            if ($defaultarea) {
                $area = $defaultarea;
            }
        }

        if ($area) {
            $areainfo = db('area')->where(['etitle'=>$area])->find();
            if ($areainfo && !$areainfo['isopen']) {
                abort(404);
            }
           	$this->area = $area;
            session('sys_area', $area);
            session('sys_areainfo', $areainfo);
            config('sys.sys_area', $area);
        }else{
            config('sys.sys_area', null);
            session('sys_area', null);
            session('sys_areainfo', null);
        }
        if (is_mobile() && config('sys.wap_auto')) {
            $wapurl = get_wapurl($_SERVER['REQUEST_URI']);
            $this->redirect($wapurl);
        }
        if (is_dir(RUNTIME_PATH.'temp'.DS)) {//分站开启，自动清除缓存
            $path = RUNTIME_PATH.'temp'.DS;
            dir_del($path);
        }
    }
}