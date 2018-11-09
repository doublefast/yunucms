<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Node;
use app\admin\model\UserType;
use app\admin\model\UserModel;

class Common extends Controller{

 	public function _initialize()
    {
        $module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
        $url        = $module."/".$controller."/".$action;

        //不需要验证的
        $noauthurl = [
            'admin/index/login',
            'admin/index/dologin',
            'admin/index/loginout',
            'admin/index/cache',
            'admin/upload/upload',
            'admin/upload/uploadfile',
            'admin/content/sortcontent',
            'admin/category/sortcategory',
        ];
        $version = include_once(ROOT_PATH.'version.php');
        config($version);
        //跳过验证
        if(!in_array($url, $noauthurl)){
            if(!session('admin_uid')){
                $this->redirect('/'.config('sys.login_url'));
            }

            $auth = new \com\Auth();

            //跳过检测以及主页权限
            if(session('admin_uid') != 1){
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

            $this->assign([
                'admintitle' => "云优CMS",
                'username' => $hasUser['username'],
                'menu' => $menu_list,
                'menu_child' => $menu_child,
                'rolename' => $roleinfo['title'],
                'position' => $position,
                'version' => config('yunucms.version')
            ]);
        }else{
            $this->assign([
                'admintitle' => "云优CMS",
                'position' => ['name'=>'管理员登陆'],
                'version' => config('yunucms.version')
            ]);
        }
        foreach (config('sys') as $k => $v) {
            config('sys.'.$k, strip_slashes_recursive($v));
        }
    }

}