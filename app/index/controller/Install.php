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

	        //检查数据库
	        $link = @mysql_connect($data['DB_HOST'] . ':' . $data['DB_PORT'], $data['DB_USER'], $data['DB_PWD']);
	        if(!$link) {
	            $showstr .= show_msg('数据库连接失败，请检查连接信息是否正确！',false);
	            return $showstr;
	        }

	        $mysqlInfo = mysql_get_server_info($link);
	        if($mysqlInfo < '5.1.0') {
	            $showstr .= show_msg('mysql版本低于5.1，无法继续安装！',false);
	            return $showstr;
	        }
	        $status = @mysql_select_db($data['DB_NAME'], $link);
	        if(!$status) {
	            //尝试创建数据库
	            $sql = "CREATE DATABASE IF NOT EXISTS `".$data['DB_NAME']."` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;";
	            if(!mysql_query($sql)){
	                $showstr .= show_msg('数据库'. $data['DB_NAME'].'自动创建失败，请手动建立数据库！',false);
	                return $showstr;
	            }
	            mysql_select_db($data['DB_NAME'], $link);
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

            setConfigfile($coffile, array_merge($conflist, $param));
	        $showstr .= show_msg('配置数据库信息完成...');
	

	        //安装数据库
	        $file = 'data/install.sql';
	        mysql_query("set names utf8");
	        $sqlData = mysqlupdate($file, 'yunu_', $data['DB_PREFIX']);
	        foreach ($sqlData as $sql) {
	            $rst = mysql_query($sql);
	            if($rst === false){
	                $showstr .= show_msg(mysql_error(),false);
	            }
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
            setConfigfile($coffile, array_merge($conflist, $param));
	       	$showstr .= show_msg('安装程序执行完毕！后台默认帐号密码均为：admin');

	        $homeUrl = '//'.$_SERVER['HTTP_HOST'];
	        $adminUrl = '//'.$_SERVER['HTTP_HOST'].'/yunu.php';
	        $showstr .=  "<script type=\"text/javascript\">insok(\"{$homeUrl}\",\"{$adminUrl}\")</script>";

	        return $showstr;
	}
}

?>