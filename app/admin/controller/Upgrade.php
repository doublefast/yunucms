<?php
namespace app\admin\controller;
use think\Config;
use think\Db;

class Upgrade extends Common
{
    public function _initialize() {
        parent::_initialize();
        $version = include_once(ROOT_PATH.'version.php');
        config($version);

        $root_dir = request()->baseFile();
        $root_dir  = preg_replace(['/index.php$/'], [''], $root_dir);
        define('ROOT_DIR', $root_dir);

        $this->error = "";
        $this->update_path = ROOT_PATH.'data'.DS.'uppack'.DS;
        $this->update_back_path = ROOT_PATH.'data'.DS.'upback'.DS;
        $this->cache_upgrade_list = 'upgrade_version_list'.config('cloud.identifier');
        $this->cloud = new \com\Cloud(config('cloud.identifier'), $this->update_path);
        
    }
    public function index()
    {
        if (request()->isPost()) {
            $username = input('post.username/s');
            $password = input('post.password/s');
            $vcode = input('post.vcode/s');
            if ($username == '') {
                return json(['code' => 2, 'msg' => '<font class="mcolor2">* 云平台登陆帐号不能为空..</font>']);
            }
            if ($password == '') {
                return json(['code' => 2, 'msg' => '<font class="mcolor2">* 云平台登陆密码不能为空..</font>']);
            }
            /* if ($vcode == '') {
                return json(['code' => 2, 'msg' => '<font class="mcolor2">* 验证码不能为空..</font>']);
            }*/
            $data = [];
            $data['username'] = $username;
            $data['password'] = $password;
            //$data['vcode'] = $vcode;
            $data['domain'] = $_SERVER["HTTP_HOST"];
            $data['site_name'] = config('sys.site_title');
            $data['version'] = config('yunucms.version');
            $res = $this->cloud->data($data)->api('Bind');
            if (isset($res['code']) && $res['code'] == 1) {
                $coffile = CONF_PATH.DS.'extra'.DS.'cloud.php';
                $condata['identifier'] = $res['data'];
                $condata['grant'] = $res['grant'];
                setConfigfile($coffile, $condata);
                // 缓存站点标识
                if (is_file($coffile)) {
                    Config::load($coffile, '', 'cloud');
                    $conflist = Config::get('','cloud');
                    if (isset($conflist['identifier']) && !empty($conflist['identifier'])) {
                        return json(['code' => 1, 'msg' => '<font class="mcolor">恭喜您，已成功绑定云平台账号。</font>']);
                    }
                }
                return json(['code' => 2, 'msg' => CONF_PATH.DS.'extra'.DS.'cloud.php写入失败！']);
            }
            return json(['code' => 2, 'msg' => isset($res['msg']) ? $res['msg'] : '云平台绑定失败！']);
        }

        $html_status = file_get_contents($this->cloud->apiUrl()."/main.html");

        $html_status = $html_status == 'SUCCESS' ? 1 : 0;
        $this->assign('api_url', $this->cloud->apiUrl());
        $this->assign('html_status', $html_status);

        return $this->fetch();
    }
    public function lists(){
        if (request()->isPost()) {
            $result = $this->getVersion();
            return json($result);
        }
        return $this->fetch();
    }
    //获取更新版本列表
    private function getVersion(){
        /*$cache = cache($this->cache_upgrade_list);
        if (isset($cache['data']) && !empty($cache['data'])) {
            return $cache;
        }*/
        $result = $this->cloud->data(['version' => config("yunucms.version"), 'app_grant' => config('cloud.grant')])->api('Versions');
        if ($result) {
            if ($result['code'] == 1) {
                foreach ($result['data'] as $k => $v) {
                    $result['data'][$k]['content'] = htmlspecialchars_decode($v['content']);
                }
                //cache($this->cache_upgrade_list, $result, 3600);  
            }
            return $result;
        }else{
            return ['code' => 2, 'msg' => '获取版本列表错误！'];
        }
    } 
    public function tpl(){
        if (request()->isPost()) {
            $result = $this->getTpl();
            $default = [
                'number'=>'default',
            ];
            $result['data'][] = $default;
            foreach ($result['data'] as $k => $v) {
                $exist = 0;
                if (is_dir("./template/".$v['number'])) {
                    $exist = 1;
                    $result['data'][$k]['use'] =  config('sys.theme_style') == $v['number'] ? 1 : 0;
                }
                $result['data'][$k]['exist'] =  $exist;
            }
            return json($result);
        }
        return $this->fetch();
    }
    //获取模版列表
    private function getTpl(){
        $result = $this->cloud->data(['identifier' => config('cloud.identifier'), 'app_grant' => config('cloud.grant')])->api('Tpl');
        if ($result) {
            return $result;
        }else{
            return ['code' => 2, 'msg' => '获取模版列表错误！'];
        }
    } 
    //使用模版
    public function tpluse($number = '')
    {
        if (!request()->isPost() || empty($number)) {
            return json(['code' => 2, 'msg' => '参数传递错误！']);
        }
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        Config::load($coffile, '', 'sys');
        $conflist = Config::get('','sys');
        $param['theme_style'] = $number;
        setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
        return json(['code' => 1]);
    }

    public function tpldownload($number = '')
    {
        if (!request()->isPost() || empty($number)) {
            return json(['code' => 2, 'msg' => '参数传递错误！']);
        }
        if (!is_dir($this->update_path)) {
            $dir = new \com\Dir();
            $dir->create($this->update_path, 0755, true);
        }
        $lock = $this->update_path.config('cloud.identifier').'tpl.lock';
        if (!is_file($lock)) {
            file_put_contents($lock, time());
        } else {
            return json(['code' => 2, 'msg' => '安装模版任务执行中，请手动删除此文件后重试！<br>文件地址：/data/uppack/'.config('cloud.identifier').'tpl.lock']);
        }
        // 检查当前升级补丁前面是否还有未升级的补丁

        $file = $this->cloud->data(['number' => $number, 'identifier' => config('cloud.identifier'), 'app_grant' => config('cloud.grant')])->down('Install');
        if ($file === false || empty($file)) {
            $this->clearCache($file);
            return json(['code' => 2, 'msg' => '获取模版失败！']);
        }else{
            if (self::_tplInstall($file) === false) {
                $this->clearCache($file);
                return json(['code' => 2, 'msg' => '安装失败:'.$this->error]);
            }
        }
        return json(['code' => 1]);
    }

    public function download($version = '')
    {
        if (!request()->isPost() || empty($version)) {
            return json(['code' => 2, 'msg' => '参数传递错误！']);
        }
        if (!is_dir($this->update_path)) {
            $dir = new \com\Dir();
            $dir->create($this->update_path, 0755, true);
        }
        $lock = $this->update_path.config('cloud.identifier').'upgrade.lock';
        if (!is_file($lock)) {
            file_put_contents($lock, time());
        } else {
            return json(['code' => 2, 'msg' => '升级任务执行中，请手动删除此文件后重试！<br>文件地址：/data/uppack/'.config('cloud.identifier').'upgrade.lock']);
        }

        $versions = $this->getVersion();
        // 检查当前升级补丁前面是否还有未升级的补丁
        $tobe = [];
        $file = '';
        $versions['data'] = array_reverse($versions['data']);
        foreach ($versions['data'] as $k => $v) {
            if (version_compare($v['version'], $version, '>=')) {
                if (version_compare($v['version'], $version, '=')) {
                    $file = $this->cloud->data(['version' => $v['version'], 'identifier' => config('cloud.identifier'), 'app_grant' => config('cloud.grant')])->down('Upgrade');
                    break;
                }
            } else {
                $file = $this->cloud->data(['version' => $v['version'], 'identifier' => config('cloud.identifier'), 'app_grant' => config('cloud.grant')])->down('Upgrade');
                if ($file === false) {
                    $this->clearCache($file);
                    return json(['code' => 2, 'msg' => '前置版本 '.$v['version'].' 升级失败！']);
                } else {
                    if (self::_install($file, $v['version']) === false) {
                        $this->clearCache($file);
                        return json(['code' => 2, 'msg' => '升级失败:'.$this->error]);
                    }
                }
            }
        }
        if ($file === false || empty($file)) {
            $this->clearCache($file);
            return json(['code' => 2, 'msg' => '获取升级包失败！']);
        }
        return json(['code' => 1, 'msg' => basename($file)]);
    }

    private function clearCache($file = '', $version = '')
    {
        if (is_file($this->update_path.config('cloud.identifier').'upgrade.lock')) {
            unlink($this->update_path.config('cloud.identifier').'upgrade.lock');
        }
        if (is_file($this->update_path.config('cloud.identifier').'tpl.lock')) {
            unlink($this->update_path.config('cloud.identifier').'tpl.lock');
        }
        if (is_file($file)) {
            unlink($file);
        }
        // 在升级缓存列表里面清除已升级的版本信息
        if ($version) {
            $version_cache = cache($this->cache_upgrade_list);
            if ($version_cache) {
                unset($version_cache['data'][$version]);
                cache($this->cache_upgrade_list, $version_cache, 3600);
            }
            
        }
        // 删除升级解压文件
        if (is_dir($this->update_path)) {
            $dir = new \com\Dir();
            $dir->delDir($this->update_path);
        }
    }

    public function install($file = '', $version = '')
    {
        if (!request()->isPost() || empty($version)) {
            return json(['code' => 2, 'msg' => '参数传递错误！']);
        }
        $file = $this->update_path.$file;
        if (!file_exists($file)) {
            $this->clearCache($file);
            return json(['code' => 2, 'msg' => $version.' 升级包异常，请重新升级！']);
        }

        if (self::_install($file, $version) === false) {
            $this->clearCache($file);
            return json(['code' => 2, 'msg' => $this->error]);
        }
        return json(['code' => 1, 'msg' => '升级包安装成功。', 'url' => url('upgrade/index')]);
    }

    private function _install($file = '', $version = '')
    {
        if (empty($file) || empty($version)) {
            $this->error = '参数传递错误！';
            return false;
        }
        return self::_systemInstall($file, $version);
        clearstatcache();
    }

    private function _systemInstall($file, $version)
    {
        $_version = cache($this->cache_upgrade_list);
        $_version = $_version['data'];

        $dir = new \com\Dir();
        if (!is_dir($this->update_back_path)) {
            $dir->create($this->update_back_path);
        }
        $decom_path = $this->update_path.basename($file,".zip");
        if (!is_dir($decom_path)) {
            $dir->create($decom_path, 0777, true);
        }
        // 解压升级包
        $archive = new \com\PclZip();
        $archive->PclZip($file);
        if(!$archive->extract(PCLZIP_OPT_PATH, $decom_path, PCLZIP_OPT_REPLACE_NEWER)) {
            $this->error = '升级失败，请开启[backup/uppack]文件夹权限！';
            return false;
        }

        try {
        	// 备份需要升级的旧版本
	    	$up_info = include_once $decom_path.DS.'upgrade.php';
	    	//备份文件
	    	$back_path = $this->update_back_path.config('yunucms.version');
        } catch(\Exception $e) {
            $this->error = '升级失败,更新包异常！';
            return false;
        }
	    

        if (!is_dir($back_path)) {
            $dir->create($back_path, 0777, true);
        }
        $layout = '';

        array_push($up_info['update'], '/version.php');
        foreach ($up_info['update'] as $k => $v) {
            $_dir = $back_path.dirname($v).DS;
            if (!is_dir($_dir)) {
                $dir->create($_dir, 0777, true);
            }
            if (is_file('./'.$v)) {
                @copy('./'.$v, $_dir.basename($v));
            }
        }
        // 更新升级文件
        $dir->copyDir($decom_path.DS.'upload', '.');
        // 根据升级补丁删除文件
        if (isset($up_info['delete'])) {
            foreach ($up_info['delete'] as $k => $v) {
                if (is_file('./'.$v)) {
                    @unlink('./'.$v);
                }
                //删除文件夹
                if (is_dir('./'.$v)) {
                    $dir->delDir('./'.$v);
                }
            }
        }
        // 导入SQL
        $sql_file = realpath($decom_path.DS.'database.sql');
        if (is_file($sql_file)) {
            $sql = file_get_contents($sql_file);
            $sql_list = parse_sql($sql, 0, ['yunu_' => config('database.prefix')]);
            if ($sql_list) {
                $sql_list = array_filter($sql_list);
                foreach ($sql_list as $v) {
                    try {
                        Db::execute($v);
                    } catch(\Exception $e) {
                        $this->error = 'SQL更新失败！';
                        return false;
                    }
                }
            }
        }
        $this->clearCache('', $version);
        return true;
    }
    private function _tplInstall($file)
    {
        $_version = cache($this->cache_upgrade_list);
        $_version = $_version['data'];

        $dir = new \com\Dir();
        if (!is_dir($this->update_back_path)) {
            $dir->create($this->update_back_path);
        }
        $decom_path = $this->update_path.basename($file,".zip");
        if (!is_dir($decom_path)) {
            $dir->create($decom_path, 0777, true);
        }
        // 解压升级包
        $archive = new \com\PclZip();
        $archive->PclZip($file);
        if(!$archive->extract(PCLZIP_OPT_PATH, $decom_path, PCLZIP_OPT_REPLACE_NEWER)) {
            $this->error = '安装失败，请开启[backup/uppack]文件夹权限！';
            return false;
        }

        // 安装模版
        $dir->copyDir($decom_path.DS, '.'.DS.'template');
        // 导入SQL
        $sql_file = realpath($decom_path.DS.'database.sql');
        if (is_file($sql_file)) {
            $sql = file_get_contents($sql_file);
            $sql_list = parse_sql($sql, 0, ['yunu_' => config('database.prefix')]);
            if ($sql_list) {
                $sql_list = array_filter($sql_list);
                foreach ($sql_list as $v) {
                    try {
                        Db::execute($v);
                    } catch(\Exception $e) {
                        $this->error = 'SQL更新失败！';
                        return false;
                    }
                }
            }
        }
        $this->clearCache('', '');
        return true;
    }
}
