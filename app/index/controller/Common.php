<?php
namespace app\index\controller;
use app\index\model\AreaModel;
use think\Controller;
use think\Config;
use think\Db;

class Common extends Controller{
 	public function _initialize()
    {
        $lock = 'data/install.lock';
        if(!is_file($lock)){
            $this->redirect('/index.php?s=index/install/index');
        }
        redirecturl();
        error_reporting(config('app_debug') ? -1 : 0);

    	$module = strtolower(request()->module());
        $this->tpl_file = './template/'.config('sys.theme_style').'/'.$module.'/';
        $area = '';
        $areamodel = new AreaModel();
        if (input('area')) {
        	$area = input('area');
            $areadata = $areamodel->getInfo(['etitle'=>$area]);
            if (!$areadata) {
                abort(404);
            }else{
            	if($areadata['isurl']){
                  	abort(404);
                }
            }
        }

        if ($_SERVER['HTTP_HOST'] != config('sys.site_url')) {
            $levelurl = str_replace(config('sys.site_levelurl'), '', $_SERVER['HTTP_HOST']);
            if ($levelurl != '') {
            	$levelurl = str_replace('.', '', $levelurl);
            	$area = $levelurl != 'www' ? $levelurl : $area;
                    
                $areadata = $areamodel->getInfo(['etitle'=>$area,'isurl'=>1]);
                if (!$areadata) {
                    abort(404);
                }
            }
        }

        if (config('sys.seo_default_area')) {
            $defaultarea = $areamodel->getDefArea();
            if ($defaultarea) {
                if (!$area) {
                    $area = $defaultarea;
                }else{
                    if ($area == $defaultarea) {
                        $this->redirect(config('sys.site_protocol')."://".config('sys.site_url'));
                    }
                }
            }
        }
        if ($area) {
            $areainfo = $areamodel->getInfo(['etitle'=>$area]);
            if ($areainfo && !$areainfo['isopen']) {
                abort(404);
            }
           	$this->area = $area;
            session('sys_areainfo', $areainfo);
            config('sys.sys_area', $area);
        }else{
            session('sys_areainfo', null);
            config('sys.sys_area', null);
        }
        runhook('sys_index_common');
        $pluginc = input('c', '', 'trim');
        if (is_mobile() && config('sys.wap_auto') && !$pluginc) {
            $wapurl = get_wapurl($_SERVER['REQUEST_URI']);
            $this->redirect($wapurl);
        }
        if (config('sys.openarea') !== '1') {//分站开启，自动清除缓存
            if (is_dir(RUNTIME_PATH.'temp'.DS)) {
                $path = RUNTIME_PATH.'temp'.DS;
                dir_del($path);
            }
        }
    }
}