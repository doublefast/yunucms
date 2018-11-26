<?php
namespace app\admin\controller;
use app\admin\model\UserType;
use think\Controller;
use think\Db;
use org\Verify;

class Index extends Common
{
    public function index()
    {
        //统计访问量
        $start_cs = date('Y-m-d 00:00:00');
        $end_cs = date('Y-m-d H:i:s');
        $daycount = [];
        for ($i = 6; $i >= 0; $i --) { 
            $start = strtotime(date('Y-m-d 00:00:00', strtotime("-".$i." day")));
            $end = strtotime(date('Y-m-d 23:59:59', strtotime("-".$i." day")));
            $daycount[] = db('browse')->where('time', 'between', $start.','.$end)->count();
        }

        $sys_mysql = db()->query('SELECT VERSION();');
        $sys_mysql = is_array($sys_mysql) ? $sys_mysql[0]['VERSION()'] : '';

	    $this->cloud = new \com\Cloud(config('cloud.identifier'));
	    $html_status = url_get_contents($this->cloud->apiUrl()."/main.html");
        $html_status = $html_status == 'SUCCESS' ? 1 : 0;
        $cloudstr = "<font style='color:#000;'>通信异常</font>";
        if ($html_status) {
        	$issq = false;
            if (config('cloud.identifier')) {
                $issq = config('cloud.grant') ? true : false;
            }
            if (!$issq) {
            	$cloudstr = "<br>温馨提示：您当前域名 <font style='color:#000;'>未认证</font> ，如果已购买授权，请前往 <a href='".url('upgrade/index')."' style='color:#000'>绑定</a>，如果未购买授权，请前往 <a href='http://www.yunucms.com/buy/index.html' target='_blank' style='color:#000'>购买</a>";
            }else{
            	$cloudstr = "<font style='color:#000;'>已认证</font>";
            }
            $version = include_once(ROOT_PATH.'version.php');
        	config($version);
            $this->cloud->record(config('sys.site_title'), config('yunucms.version'))->api('Record');
        }

        //主词排名监控获取
        $mainkeywords = null;
        if (config('sys.api_pmjkhq')) {
            $mainkeywords = send_post($this->cloud->yunapiUrl().'/getMainKeywords', ['domain'=>config('sys.site_levelurl')]);
            $mainkeywords = $mainkeywords ? json_decode($mainkeywords, true) : null;
            if ($mainkeywords) {
                $mainkeywords = $mainkeywords['state'] == 1 ? $mainkeywords['data'][0] : null;
            }
        }
        
        $this->assign([
            'content_count' => DB::name('content')->count(),
            'category_count' => DB::name('category')->count(),
            'diyform_count' => DB::name('formcon')->where(['look'=>0])->count() .' / '. DB::name('formcon')->count(),
            'daycount' => implode(',', $daycount),
            'sys_os' => PHP_OS,//操作系统
            'sys_ser' => $_SERVER["SERVER_SOFTWARE"],//服务器软件
            'sys_mysql' => $sys_mysql,//mysql版本
            'sys_upfile' => ini_get('file_uploads') ? ini_get('upload_max_filesize') : '不支持',//上传文件大小
            'cloudstr' => $cloudstr,
            'mainkeywords' => $mainkeywords,
        ]);
        return $this->fetch();
    }

    public function login()
    {
        return $this->fetch('login');
    }
    //清除缓存
    public function cache()
    {
        $path = RUNTIME_PATH;
        dir_del($path);
        return json(['msg' => '清除缓存成功']);
    }

    //登录操作
    public function doLogin()
    {
        if (request()->isAjax()) {
            $username = input("param.username");
            $password = input("param.password");

            if (config('verify_type') == 1) {
                $code = input("param.code");
            }
            $db = Db::name('admin');
            $result = $this->validate(compact('username', 'password'), 'AdminValidate');
            if(true !== $result){
                return json(['code' => -5, 'data' => '', 'msg' => $result]);
            }

            $hasUser = $db->where(['username'=>$username])->find();
            if(empty($hasUser)){
                return json(['code' => -1, 'data' => '', 'msg' => '管理员不存在']);
            }

            if(md5(md5($password).config('auth_key')) != $hasUser['password']){
                writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：密码错误',2);
                return json(['code' => -2, 'data' => '', 'msg' => '账号或密码错误']);
            }

            if(1 != $hasUser['status']){
                writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：该账号被禁用',2);
                return json(['code' => -6, 'data' => '', 'msg' => '该账号被禁用']);
            }

            //获取该管理员的角色信息
            $user = new UserType();
            $info = $user->getRoleInfo($hasUser['groupid']);
            session('admin_username', $username);
            session('admin_uid', $hasUser['id']);
            session('groupid', $hasUser['groupid']);
            session('rolename', $info['title']);
            session('rule', $info['rules']);
            session('name', $info['name']);

            session('last_login_ip', $hasUser['last_login_ip']);
            session('last_login_time', date('Y-m-d H:i:s', $hasUser['last_login_time']));
      
            //更新管理员状态
            $param = [
                'loginnum' => $hasUser['loginnum'] + 1,
                'last_login_ip' => request()->ip(),
                'last_login_time' => time()
            ];

            $db->where(['id'=>$hasUser['id']])->update($param);
            writelog($hasUser['id'], session('admin_username'), '用户【'.session('admin_username').'】登录成功', 1);
            return json(['code' => 1, 'data' => url('index/index'), 'msg' => '登录成功！']);
        }
    }

    //退出操作
    public function loginOut()
    {
        session(null);
        return json(array('code'=>1));
    }
}
