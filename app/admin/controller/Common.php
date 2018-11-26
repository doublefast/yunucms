<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Node;
use app\admin\model\UserType;
use app\admin\model\UserModel;

class Common extends Controller{

 	public function _initialize()
    {
    	error_reporting(E_ALL);
    	
        $module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
        $url        = $module."/".$controller."/".$action;

        //无需验证控制器
        $noauthurl = [
            'admin/index/login',
            'admin/index/dologin',
            'admin/index/loginout',
            'admin/index/cache',
            'admin/upload/upload',
            'admin/upload/uploadfile',
            'admin/upload/browsefile',
            'admin/content/sortcontent',
            'admin/content/movecategory',
            'admin/category/sortcategory',
            'admin/category/etitlecategory',
            'admin/diyform/showcode',
            'admin/area/showurl',
            'admin/content/baidu',
            'admin/content/xzh',
            'admin/content/media',
            'admin/content/stateall',
            'admin/content/mainurl',
            'admin/content/getarea',
            'admin/content/baiduqc',
        ];
        $version = include_once(ROOT_PATH.'version.php');
        config($version);
        $assign = [];
        //跳过验证
        if(!in_array($url, $noauthurl)){
            if(!session('admin_uid')){
                $this->redirect('/'.config('sys.login_url'));
            }

            $auth = new \com\Auth();

            //跳过检测以及主页权限
            if(session('groupid') != 1){
                if(!in_array($url, ['admin/index/index'])){
                    if(!$auth->check($url,session('admin_uid'))){
                        $this->error('抱歉，您没有操作权限');
                    }
                }
            }

            $usermod = new UserModel();
            $hasUser = $usermod->getOneUser(session('admin_uid'));
            $user = new UserType();
            $roleinfo = $user->getRoleInfo($hasUser['groupid']);

            $node = new Node();
            $menu_list = $node->getMenu($roleinfo['rules']);
            $menu_child = $node->getMenuchild($url, $roleinfo['rules']);

            $position = $node->getPosition($url);
            $position['name'] = $position['name'] ? $position['name'] : "管理控制台";

            $assign = [
                'username' => $hasUser['username'],
                'menu' => $menu_list,
                'menu_child' => $menu_child,
                'rolename' => $roleinfo['title'],
                'position' => $position,
                'version' => config('yunucms.version'),
            ];
        }else{
            $assign = [
                'position' => ['name'=>'管理员登陆'],
                'version' => config('yunucms.version')
            ];
        }
        
        $assign['isagent'] = config('cloud.agent') != 'cfcd208495d565ef66e7dff9f98764da' && config('cloud.grant') ? true : false;
        $assign['copy_sysname'] = config('sys.copy_sysname') ? config('sys.copy_sysname') : '云优CMS';
        $assign['copy_name'] = config('sys.copy_name') ? config('sys.copy_name') : 'YUNUCMS';
        $assign['copy_url'] = config('sys.copy_url') ? config('sys.copy_url') : 'www.yunucms.com';

        $this->assign($assign);

        foreach (config('sys') as $k => $v) {
            config('sys.'.$k, strip_slashes_recursive($v));
        }
    }

}