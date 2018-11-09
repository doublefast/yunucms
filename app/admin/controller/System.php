<?php
namespace app\admin\controller;
use app\admin\model\AreaModel;
use app\admin\model\MediaModel;
use think\Config;

class System extends Common
{
    public function basic()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            unset($param['file']);
            unset($param['ico']);
            
            $param['site_guide'] = array_key_exists("site_guide", $param) ? 1 : 0;
            $param['site_slide'] = array_key_exists("site_slide", $param) ? 1 : 0;

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }

        $indexdef = getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'index_default.html');
        $this->assign('indexdef', $indexdef);
        return $this->fetch();
    }

    //生成站点地图
    public function sitemap() {
        $api = new Api();
        $api->createSitemap();
        
        return $this->fetch();
    }

    public function seo()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            $param['seo_area'] = array_key_exists("seo_area", $param) ? 1 : 0;

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));

            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        $area = new AreaModel();
        $nav = new \org\Leftnav;
        $arr = $area->getAllArea(['isopen'=>1,'istop'=>1]);
        $arealist = $nav::rule($arr);
        $this->assign('arealist', $arealist);
        return $this->fetch();
    }

    public function qiniu()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            $param['qiniu'] = array_key_exists("qiniu", $param) ? 1 : 0;

            if (strpos($param['qiniu_accesskey'], '*')) {
                unset($param['qiniu_accesskey']);
            }
            if (strpos($param['qiniu_secretkey'], '*')) {
                unset($param['qiniu_secretkey']);
            }

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));

            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        $qiniu_accesskey = config('sys.qiniu_accesskey');
        if ($qiniu_accesskey) {
            $qiniu_accesskey = substr_replace($qiniu_accesskey, '********', 4, count($qiniu_accesskey)-5);
        }
        $qiniu_secretkey = config('sys.qiniu_secretkey');
        if ($qiniu_accesskey) {
            $qiniu_secretkey = substr_replace($qiniu_secretkey, '********', 4, count($qiniu_secretkey)-5);
        }
        $this->assign([
            'qiniu_accesskey' => $qiniu_accesskey,
            'qiniu_secretkey' => $qiniu_secretkey
        ]);
        return $this->fetch();
    }

    public function interapi()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');

            $param['api_bdts'] = array_key_exists("api_bdts", $param) ? 1 : 0;
            $param['api_bdxzh'] = array_key_exists("api_bdxzh", $param) ? 1 : 0;
            $param['api_bdqc'] = array_key_exists("api_bdqc", $param) ? 1 : 0;
            $param['api_wyc'] = array_key_exists("api_wyc", $param) ? 1 : 0;
            $param['api_xxts'] = array_key_exists("api_xxts", $param) ? 1 : 0;
            $param['api_pmjkhq'] = array_key_exists("api_pmjkhq", $param) ? 1 : 0;
            $param['api_media'] = array_key_exists("api_media", $param) ? 1 : 0;
  
            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));

            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        return $this->fetch();
    }
    
    public function checkPmjkhq()
    {
        //查询主关键排名
        $this->cloud = new \com\Cloud();
        $mainkeywords = send_post($this->cloud->yunapiUrl().'/getMainKeywords', ['domain'=>config('sys.site_levelurl')]);
        $mainkeywords = $mainkeywords ? json_decode($mainkeywords, true) : null;
        if ($mainkeywords) {
            $mainkeywords = $mainkeywords['state'] == 1 ? $mainkeywords['data'][0] : null;
        }
        $data['state'] = $mainkeywords ? 1 : 0;
        return json_encode($data);
    }

    //验证用户开启媒体联盟
    public function checkMedia()
    {
        if(request()->isAjax()){
            $apikey = input('apikey'); 
            $media = new MediaModel(); 
            $domainid = $media->checkmedia($apikey);
            $data['state'] = $domainid ? 1 : 0;
            return json_encode($data);
        }
    }

    //上传设置
    public function upload()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            unset($param['file']);
            unset($param['filefont']);

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        return $this->fetch();
    }

    public function disablewords()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            
            $param['disablewords_status'] = array_key_exists("disablewords_status", $param) ? 1 : 0;

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }

        $indexdef = getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'index_default.html');
        $this->assign('indexdef', $indexdef);
        return $this->fetch();
    }

    public function copy(){
        if (request()->isPost()) {
            $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';

            $copy_title = input('post.copy_title/s');
            $copy_name = input('post.copy_name/s');
            $copy_url = input('post.copy_url/s');

            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));

            return json(['code' => 1, 'data' => '', 'msg' => '更改后台版权成功']);
            exit();
        }
    }
}
