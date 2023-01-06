<?php
namespace app\index\controller;
use think\Controller;
use think\Config;
use think\Db;

class Install extends Controller
{
	public function _initialize()
    {
    	$this->lock = 'data/install.lock';
    	
		if(is_file($this->lock)){
			$this->redirect("/");
		}

        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
    	$this->tpl_file = './app/index/view/'.$controller.'_'.$action.'.html';

        $version = include_once(ROOT_PATH.'version.php');
        config($version);

        $root_dir = request()->baseFile();
        $root_dir  = preg_replace(['/index.php$/'], [''], $root_dir);
        define('ROOT_DIR', $root_dir);

        $this->update_path = ROOT_PATH.'data'.DS.'uppack'.DS;
        $this->cloud = new \com\Cloud(config('cloud.identifier'), $this->update_path);
  

    }
	public function index(){
		return $this->fetch($this->tpl_file);
	}

	public function setup1(){
		$this->assign([
			'check_env'=>check_env(),
			'check_func'=>check_func(),
			'check_dirfile'=>check_dirfile()
		]);
		return $this->fetch($this->tpl_file);
	}
	public function setup2(){
		return $this->fetch($this->tpl_file);
	}
	public function setup3(){
		if (request()->isPost()) {
			header('Content-Type: text/html; charset=utf-8');
			$username = input('post.username/s');
            $password = input('post.password/s');

            $vcode = input('post.vcode/s');
            if ($username == '') {
                echo "<script>alert('云平台账号不能为空~');history.go(-1);</script>"; exit();
            }
            if ($password == '') {
                echo "<script>alert('云平台密码不能为空~');history.go(-1);</script>"; exit();
            }

            $this->assign([
				'admpass'=>rand(11111111, 99999999),
			]);

            $data = [];
            $data['username'] = $username;
            $data['password'] = $password;
            $data['timestamp'] = time();
            $data['format'] = 'json';
            $data['domain'] = $_SERVER["HTTP_HOST"];
            $data['site_name'] = "站点安装";
            $data['version'] = config('yunucms.version');
            $res = $this->cloud->data($data)->api('bindapi');
            if (isset($res['code']) && $res['code'] == 1) {
                $coffile = CONF_PATH.DS.'extra'.DS.'cloud.php';
                $condata['identifier'] = $res['data'];
                $condata['grant'] = $res['grant'];
                $condata['agent'] = $res['agent'];
                setConfigfile($coffile, $condata);

            	$this->cloud->record("站点安装", config('yunucms.version'))->api('recordapi');
                // 缓存站点标识
                if (is_file($coffile)) {
                    Config::load($coffile, '', 'cloud');
                    $conflist = Config::get('','cloud');
                    if (isset($conflist['identifier']) && !empty($conflist['identifier'])) {
                        return 	$this->fetch($this->tpl_file);
                    }
                }
                echo "<script>alert('".CONF_PATH.DS.'extra'.DS.'cloud.php写入失败！'."');history.go(-1);</script>"; exit();
            }else{
            	echo "<script>alert('用户名密码验证失败');history.go(-1);</script>"; exit();
            }
		}
	}
	public function setup4(){
		if (request()->isPost()) {
			$this->assign([
				'showstr'=>$this->ste()
			]);
			return 	$this->fetch($this->tpl_file);
		}
	}
	public function ste(){
		$showstr = "";
			//检测信息
	        $data = input('post.');
	        if(!$data['DB_HOST']){
	        	$showstr .= show_msg('请填写数据库地址！',false);
	        	return $showstr;
	        }
	        if(!$data['DB_PORT']){
	        	$showstr .= show_msg('请填写数据库端口！',false);
	        	return $showstr;
	        }
	        if(!$data['DB_NAME']){
	        	$showstr .= show_msg('请填写数据库名称！',false);
	        	return $showstr;
	        }
	        if(!$data['DB_USER']){
	        	$showstr .= show_msg('请填写数据库用户名！',false);
	        	return $showstr;
	        }
	        if(!$data['DB_PREFIX']){
	        	$showstr .= show_msg('请填写数据表前缀！',false);
	        	return $showstr;
	        }
	        if(!$data['ADM_PASS']){
	        	$showstr .= show_msg('请填写管理员密码！',false);
	        	return $showstr;
	        }
	        if(strlen($data['ADM_PASS']) < 8){
	        	$showstr .= show_msg('管理员密码长度不能少于8位！',false);
	        	return $showstr;
	        }

	        $mysqli = !version_compare("6.9", PHP_VERSION, ">");
	        //检查数据库
	        if ($mysqli) {
		        $link = @mysqli_connect($data['DB_HOST'] . ':' . $data['DB_PORT'], $data['DB_USER'], $data['DB_PWD']);
		    }else{
		        $link = @mysql_connect($data['DB_HOST'] . ':' . $data['DB_PORT'], $data['DB_USER'], $data['DB_PWD']);
		    }
	        
	        if(!$link) {
	            $showstr .= show_msg('数据库连接失败，请检查连接信息是否正确！',false);
	            return $showstr;
	        }
	        if ($mysqli) {
	        	$mysqlInfo = mysqli_get_server_info($link);
	        }else{
	        	$mysqlInfo = mysql_get_server_info($link);
	        }
	        
	        if($mysqlInfo < '5.1.0') {
	            $showstr .= show_msg('mysql版本低于5.1，无法继续安装！',false);
	            return $showstr;
	        }
	        if ($mysqli) {
	        	$status = @mysqli_select_db($link, $data['DB_NAME']);
	        }else{
	        	$status = @mysql_select_db($data['DB_NAME'], $link);
	        }
	        
	        if(!$status) {
	            //尝试创建数据库
	            $sql = "CREATE DATABASE IF NOT EXISTS `".$data['DB_NAME']."` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;";
	            if ($mysqli) {
		        	$result = !mysqli_query($link, $sql);
		        }else{
		        	$result = !mysql_query($sql);
		        }
	            if($result){
	                $showstr .= show_msg('数据库'. $data['DB_NAME'].'自动创建失败，请手动建立数据库！',false);
	                return $showstr;
	            }
	            if ($mysqli) {
		        	mysqli_select_db($data['DB_NAME'], $link);
		        }else{
		        	mysql_select_db($data['DB_NAME'], $link);
		        }
	            
	        }
	        $showstr .= show_msg('数据库检查创建完成...');
	        
	        //修改数据库文件
	        $coffile = CONF_PATH.DS.'database.php';
            Config::load($coffile, '', 'database');
            $conflist = Config::get('','database');
            $param = array(
            	'hostname'	=>	$data['DB_HOST'],
            	'hostport'	=>	$data['DB_PORT'],
            	'database'	=>	$data['DB_NAME'],
            	'username'	=>	$data['DB_USER'],
            	'password'	=>	$data['DB_PWD'],
            	'prefix'	=>	$data['DB_PREFIX']
           	);

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
	        $showstr .= show_msg('配置数据库信息完成...');
	

	        //安装数据库
	        $file = 'data/install.sql';
	        if ($mysqli) {
		        mysqli_query($link, "set names utf8");
		    }else{
		       	mysql_query("set names utf8");
		    }
	        
	        $sqlData = mysqlupdate($file, 'yunu_', $data['DB_PREFIX']);
	        foreach ($sqlData as $sql) {
	        	if ($mysqli) {
			        $rst = mysqli_query($link, $sql);
			    }else{
			       	$rst = mysql_query($sql);
			    }
	            if($rst === false){
	            	if ($mysqli) {
				        $showstr .= show_msg(mysqli_error(),false);
				    }else{
				       	$showstr .= show_msg(mysql_error(),false);
				    }
	            }
	        }

	        //重置密码
	        $password = md5(md5($data['ADM_PASS']).config('auth_key'));
	        $sql = "UPDATE yunu_admin SET password='".$password."' WHERE username='admin'";
	        $sql = str_replace('yunu_', $data['DB_PREFIX'], $sql);
	        if ($mysqli) {
			    $rst = mysqli_query($link, $sql);
			}else{
			    $rst = mysql_query($sql);
			}

	        $http_host = $_SERVER['HTTP_HOST'];
	        if (!filter_var($http_host, FILTER_VALIDATE_IP) && !filter_var('http://'.$http_host, FILTER_VALIDATE_URL)) {
	        	$showstr .= show_msg('HTTP_HOST 不是合法信息！',false);
	            return $showstr;
	        }
	        //创建文件锁
	        file_put_contents($this->lock, time());

	        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = array(
            	'site_url'	=>	$_SERVER['HTTP_HOST'],
            	'site_levelurl'	=> $_SERVER['HTTP_HOST']
           	);
            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
	       	$showstr .= show_msg('安装程序执行完毕！后台默认帐号为：admin 密码：'.$data['ADM_PASS']);

	        $homeUrl = '//'.$http_host;
	        $adminUrl = '//'.$http_host.'/'.config('sys.login_url');
	        $showstr .=  "<script type=\"text/javascript\">insok(\"{$homeUrl}\",\"{$adminUrl}\")</script>";
	        runhook('sys_index_install');
	        return $showstr;
	}
}
?>