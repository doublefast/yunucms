<?php
namespace app\wap\controller;
use app\wap\model\AreaModel;
use think\Controller;
use think\Config;

class Common extends Controller{
 	public function _initialize()
    {

    	$lock = 'data/install.lock';
        if(!is_file($lock)){
            $this->redirect('/index.php?s=index/install/index');
        }
        redirecturl();
        error_reporting(config('app_debug') ? -1 : 0);
        
    	$module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
        $this->tpl_file = './template/'.config('sys.theme_style').'/'.$module.'/';

        $area = '';
        $areamodel = new AreaModel();
        if (input('area')) {
        	$area = input('area');
            $areadata = $areamodel->getInfo(['etitle'=>$area]);
            if (!$areadata) {
                abort(404);
            }
        }

        $levelurl = "";
        if ($_SERVER['HTTP_HOST'] != config('sys.site_url')) {
            $levelurl = str_replace(config('sys.site_levelurl'), '', $_SERVER['HTTP_HOST']);
            if ($levelurl != '') {
            	$levelurl = str_replace('.', '', $levelurl);
            	$area = $levelurl != WAP_PRE ? $levelurl : $area;
                if ($levelurl != WAP_PRE) {
                    $areadata = $areamodel->getInfo(['etitle'=>$area,'isurl'=>1]);
                    if (!$areadata) {
                        abort(404);
                    }
                }
            }
        }

        if (config('sys.wap_levelurl') == 1) {
            if ($levelurl == "") {
                abort(404); exit();
            }
        }else{
            if ($levelurl == WAP_PRE) {
                abort(404); exit();
            }
        }
        
        if (!$area && config('sys.seo_default_area')) {
            $defaultarea = $areamodel->getDefArea();
            if ($defaultarea) {
                $area = $defaultarea;
            }
        }

        if ($area) {
            $areainfo = $areamodel->getInfo(['etitle'=>$area]);
            if ($areainfo && !$areainfo['isopen']) {
                abort(404);
            }
            $this->area = $area;
            config('sys.sys_area', $area);
            session('sys_areainfo', $areainfo);
        }else{
            config('sys.sys_area', null);
            session('sys_areainfo', null);
        }
        config('sys.sys_levelurl', $levelurl);
        session('sys_levelurl', $levelurl ? $levelurl : null);
        if (!is_mobile() && config('sys.pc_auto')) {
            $pcurl = get_pcurl($_SERVER['REQUEST_URI']);
            $this->redirect($pcurl);
        }

        if (config('sys.openarea') !== '1') {
            if (is_dir(RUNTIME_PATH.'temp'.DS)) {
                $path = RUNTIME_PATH.'temp'.DS;
                dir_del($path);
            }
        }        
    }
}