<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Config;
use Qiniu\Auth as Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;
header("Content-Type: text/html;charset=utf-8");
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers:x-requested-with,content-type');
header('Access-Control-Allow-Origin:'.$_SERVER['HTTP_ORIGIN']);
header('Access-Control-Allow-Methods:GET,POST,PATCH,PUT,DELETE,OPTIONS');
header('Access-Control-Max-Age:1728000');
if($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit;
}
/*$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';*/
$http_type = config('sys.site_protocol')."://";
define('WEBSITE_HOST', $http_type . $_SERVER['HTTP_HOST']);
class App extends Controller {
    public function _initialize() {
        $areaindex = trim(htmlspecialchars(input('area')));
        config('sys.sys_area', $areaindex);
        config('sys.url_model', 1);
        $this->areaindex = $areaindex;
    }
    public function _empty($name) {
        $apiName = 'api_'.$name;
        if (!method_exists($this, $apiName)) {
            return $this->error();
            exit();
        }
        return $this->$apiName();
    }
    public function index(Request $request) {
        $apiName = 'api_'.$request->controller();
        if (!method_exists($this, $apiName)) {
            return $this->error();
            exit();
        }
        return $this->$apiName();
    }
    public function info($condition,$msg = "") {
        if ($condition) {
            $json['status'] = "success";
            $json['info'] = $msg ? $msg : '请求成功';
        }else{
            $json['status'] = "error";
            $json['info'] = $msg ? $msg : '请求失败，请参见API文档';
        }
        return $json;
    }
    public function error($info) {
        // 返回错误
        $attr = $this->getattr();
        $json = $this->info(false);
        if (isset($info)) $json['info'] = $info;
        return $this->returnjson($json, $attr['callback']);
    }
    public function top_aera($area_id){
	    $dbarea = db('area');
	    $prov = $dbarea->where(['id'=>$area_id])->find();
	    if ($prov['pid'] != 0) {
	        $prov = top_aera($prov['pid']);
	    }
	    return $prov;
	}
    public function api_mainindex() {
        $attr = $this->getattr();
        $data['seo_title'] = config("sys.seo_title");
        $data['seo_keywords'] = config("sys.seo_keywords");
        $data['seo_desc'] = config("sys.seo_description");
        if (config('sys.seo_area') == 1) {
            $data['seo_title'] = config("sys.seo_title_area");
            $data['seo_keywords'] = config("sys.seo_keywords_area");
            $data['seo_desc'] = config("sys.seo_description_area");
        }
        $area = $this->areaindex ? db('area')->where('id', $this->areaindex)->find() : [];
        if ($area && $area['seo_title'] && $area['seo_keywords'] && $area['seo_description']) {
            $data['seo_title'] = $area['seo_title'];
            $data['seo_keywords'] = $area['seo_keywords'];
            $data['seo_desc'] = $area['seo_description'];
        }

        $data = $this->update_str_dq($data);
        $json = $this->info($data !== null);
        $json['data'] = $data;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [banner 幻灯片]
     * @param  [number] $id            */
    public function api_bannerlist() {
        $attr = $this->getattr();
        if (isset($attr['id'])) {
            $data = db('banner')->where(['id'=>$attr['id']])->find();
        }else{
            $data = db('banner')->orderRaw("sort desc")->select();
        }
        foreach($data as $k => $v) {
            $data[$k]['pic'] = $v['pic'];
        }
        $json = $this->info($data !== null);
        $json['data'] = $data;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [catlist 栏目列表]
     * @param  [number] $id
     */
    public function api_categorylist() {
        $attr = $this->getattr();
        $isonecate = 0;
        $midwhere = isset($attr['ispage']) && $attr['ispage'] == 1 ? ['EQ',37] : ['NEQ',37];
        if (isset($attr['id'])) {
            if (isset($attr['seltype'])) {
                $data = db('category')
                ->alias("c")
                ->join('diymodel m', 'c.mid = m.id')
                ->where(['c.pid'=>$attr['id'],'m.id'=>$midwhere])//'m.type'=>2,
                ->field('c.id,c.title,c.etitle,c.mid,c.pid,c.desc,c.seo_title,c.seo_keywords,c.seo_desc,c.content')
                ->orderRaw('c.id asc')
                ->select();
            }else{
                $data = db('category')
                ->alias("c")
                ->join('diymodel m', 'c.mid = m.id')
                ->where(['c.id'=>$attr['id']])//,'m.type'=>2
                ->field('c.*')
                ->find();
                $isonecate = 1;
            }
        } elseif (isset($attr['mid'])) {
            if (!empty($attr['mid'])) {
                $data = db('category')
                ->alias("c")
                ->join('diymodel m', 'c.mid = m.id')
                ->where(['m.id'=>$attr['mid']])//'m.type'=>2,
                ->field('c.id,c.title,c.etitle,c.mid,c.pid,c.desc,c.seo_title,c.seo_keywords,c.seo_desc,c.content')
                ->orderRaw('c.sort desc,c.id asc')
                ->select();
            }else{
                $data = db('category')
                ->alias("c")
                ->join('diymodel m', 'c.mid = m.id')
                ->where(['m.id'=>['NOT IN',[33,34,35,37]]])//'m.type'=>2,
                ->field('c.id,c.title,c.etitle,c.mid,c.pid,c.desc,c.seo_title,c.seo_keywords,c.seo_desc,c.content')
                ->orderRaw('c.sort desc,c.id asc')
                ->select();
            }
            
        }else{
            $data = db('category')
                ->alias("c")
                ->join('diymodel m', 'c.mid = m.id')
                ->where(['m.id'=>$midwhere])//'m.type'=>2,
                ->field('c.id,c.title,c.etitle,c.mid,c.pid,c.desc,c.seo_title,c.seo_keywords,c.seo_desc,c.content')
                ->orderRaw("c.sort desc,c.id asc")
                ->select();
        }
        if ($isonecate) {
            $data['desc'] = $data['desc'] ? $data['desc'] : $data['content'];
            $data['seo_title'] = $data['seo_title'] ? $data['seo_title'] : $data['title']."-".config("sys.site_title");
            $data['seo_keywords'] = $data['seo_keywords'] ? $data['seo_keywords'] : $data['title'];
            $seo_desc = $data['seo_desc'];
            if (!$seo_desc && $data['desc']) {
                $desc = strip_tags($data['desc']);
                $desc = $this->utf8_strcut($desc, 0, 80);
                $seo_desc = $desc;
            }
            $data['seo_desc'] = $seo_desc;
            $data = $this->update_str_dq($data);
        }else{
            foreach ($data as $k => $v) {
                $data[$k]['desc'] = $v['desc'] ? $v['desc'] : $v['content'];
                $data[$k]['seo_title'] = $v['seo_title'] ? $v['seo_title'] : $v['title']."-".config("sys.site_title");
                $data[$k]['seo_keywords'] = $v['seo_keywords'] ? $v['seo_keywords'] : $v['title'];
                $seo_desc = $v['seo_desc'];
                if (!$seo_desc && $v['desc']) {
                    $desc = strip_tags($v['desc']);
                    $desc = $this->utf8_strcut($desc, 0, 80);
                    $seo_desc = $desc;
                }
                $data[$k]['seo_desc'] = $seo_desc;
                $data[$k] = $this->update_str_dq($data[$k]);
            }
        }
        
        $json = $this->info($data !== null);
        $json['data'] = $data;
        return $this->returnjson($json, $attr['callback']);
    }
    public function api_catlist() {
        $attr = $this->getattr();
        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? 0 : trim($attr['cid']);
        $_limit = $limit;
        $_category = new \app\index\model\CategoryModel();
        $_catlist = $_category->getCategory(1);
        //type为top,忽略cid
        $_catlist  = $_category->unlimitedForLayer($_catlist, 'child', $cid);
        foreach($_catlist as $autoindex => $catlist) {
            /*if(!in_array($catlist['mid'], [33,34,35])){
                unset($_catlist[$autoindex]);
            }else{*/
                $_catlist[$autoindex] = $catlist->getData();
                $_limit_list = explode(',', $_limit);
                if(count($_limit_list) > 1){
                    if(($autoindex < $_limit_list[0]) || ($autoindex > $_limit_list[1])) unset($_catlist[$autoindex]);
                } else{
                    if($_limit && $autoindex >= $_limit) unset($_catlist[$autoindex]);
                }
            //}
        }
        foreach ($_catlist as $k => $v) {
        	$_catlist[$k]['desc'] = $v['desc'] ? $v['desc'] : $v['content'];
        	$_catlist[$k]['seo_title'] = $v['seo_title'] ? $v['seo_title'] : $v['title']."-".config("sys.site_title");
            $_catlist[$k]['seo_keywords'] = $v['seo_keywords'] ? $v['seo_keywords'] : $v['title'];
            $seo_desc = $v['seo_desc'];
            if (!$seo_desc && $v['desc']) {
            	$desc = strip_tags($v['desc']);
	            $desc = $this->utf8_strcut($desc, 0, 80);
	            $seo_desc = $desc;
            }
            $_catlist[$k]['seo_desc'] = $seo_desc;
            $_catlist[$k] = $this->update_str_dq($_catlist[$k]);
        }
        $json = $this->info($_catlist !== null);
        $json['data'] = array_values($_catlist);
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [contentlist 内容列表]
     * @param  [number] $cid        [栏目ID]
     * @param  [string] $orderby    [排序]
     * @param  [number] $limit      [显示数量]
     * @param  [number] $pagesize   [分页数]
     * @param  [string] $conidlist  [指定内容ID]
     */
    public function api_contentlist() {
        $attr = $this->getattr();
        $limit = empty($attr['limit']) ? 20 : $attr['limit'];
        $pages = empty($attr['pages']) || $attr['pages'] < 1 ? 1 : intval($attr['pages']);
        $keyword = empty($attr['keyword']) ? null : $attr['keyword'];
        $_count = 0;

        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
        	$orderby = $this->checkorderstr($attr['orderby']) ? $attr['orderby'] : "id DESC";
        }

        if (isset($attr['conidlist'])) {
            //获取指定内容
            $_infolist = db('content')->where(['id'=>['IN',$attr['conidlist']]])->orderRaw("$orderby")->select();
        } elseif (isset($attr['mid'])) {
            $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : $attr['cid'];
            $_area = $this->areaindex ? db('area')->where('id', $this->areaindex)->find() : [];
            if ($cid > 0) {
                $_category = new \app\index\model\CategoryModel();
                $_ids = $_category->getChildsId($_category->getCategory(), $cid, true);
                $_where = array('create_time' => array('LT', time()), 'cid'=> array('IN', $_ids));
            }else {
                $_where = array('create_time' => array('LT', time()));
            }
            if ($_area) {
                $_where['area'] = [['=', 'null'],['eq',''], ['LIKE','%,'.$_area['id'].',%'], 'or'];
            }
            if ($keyword) {
                $_where['TITLE'] = ['LIKE','%'.$keyword.'%'];
            }
            if (!empty($attr['mid'])) {
            	$_where['mid'] = $attr['mid'];
            }else{
            	$_where['mid'] =['NOT IN',[33,34,35,37]];
            }
            $_infolist = db('content')->where($_where)->orderRaw("$orderby")->limit(($pages-1)*$limit,$limit)->select();
            $_count = db('content')->where($_where)->count();
        }else{
            $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : $attr['cid'];
            if ($cid > 0) {
                $_category = new \app\index\model\CategoryModel();
                $_ids = $_category->getChildsId($_category->getCategory(), $cid, true);
                $_where = array('create_time' => array('LT', time()), 'cid'=> array('IN', $_ids));
            }else {
                $_where = array('create_time' => array('LT', time()));
            }
            $_area = $this->areaindex ? db('area')->where('id', $this->areaindex)->find() : [];
            if ($_area) {
                $_where['area'] = [['=', 'null'],['eq',''], ['LIKE','%,'.$_area['id'].',%'], 'or'];
            }
            if ($keyword) {
                $_where['TITLE'] = ['LIKE','%'.$keyword.'%'];
            }
            $_infolist = db('content')->where($_where)->orderRaw("$orderby")->limit(($pages-1)*$limit,$limit)->select();
            $_count = db('content')->where($_where)->count();
        }
        $_content = new \app\index\model\ContentModel();
        foreach ($_infolist as $k => $list) {
            $_infolist[$k] = $_content->getContentByCon($list);
            $_infolist[$k]['alltitle'] = $list['title'];
            $areadata = $_content->getContentArea($list, $_area);
            $_infolist[$k]['title'] = $areadata['title'];
            $_infolist[$k]['catetitle'] = db('category')->where(['id'=>$list['cid']])->value('title');
            if ($_infolist[$k]['pic'] == "") {
                $_infolist[$k]['pic'] = str2img($_infolist[$k]['content'], 1);
            }

        }
        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        $json['count'] = $_count;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [content 详情页]
     * @param  [number] $id     [内容ID]
     */
    public function api_content() {
        $attr = $this->getattr();
        $id = $attr['id'];
        $where = ['id'=>$id];
        $content = db('content')->where($where)->find();
        if (empty($content)) {
            $json = $this->info(false, "内容不存在");
            return $this->returnjson($json, $attr['callback']);
        }
        $catemodel = new \app\index\model\CategoryModel();
        $category = $catemodel->getOneCategory($content['cid']);
        if (empty($category)) {
            $json = $this->info(false, "内容栏目不存在");
            return $this->returnjson($json, $attr['callback']);
        }
        config('sys.pc_mip', false);
        $conmodel = new \app\index\model\ContentModel();
        $content = $conmodel->getContentByCon($content);
        $content['ys_title'] = $content['title'];//记录原始title
        $area = $this->areaindex ? db('area')->where('id', $this->areaindex)->find() : [];
        $content = $conmodel->getContentArea($content,$area);
        $content['seo_title'] = $content['seo_title'] ? $content['seo_title'] : $content['title']."-".config("sys.site_title");
        $content['seo_keywords'] = $content['seo_keywords'] ? $content['seo_keywords'] : $content['title'];
        $seo_desc = $content['seo_desc'];

        if (!$seo_desc) {
            $desc = strip_tags($content['content']);
            $desc = $this->utf8_strcut($desc, 0, 80);
            $seo_desc = $desc;
        }
        $content['seo_desc'] = $seo_desc;
        $content['prev'] = $conmodel->getContentPrev($category['id'], $content['id']);
        $content['next'] = $conmodel->getContentNext($category['id'], $content['id']);
        $content['category'] = $category;
        $content['catetitle'] = $category['etitle'];
        if($area){
            $content['seo_title'] = $this->update_str_dq($content['seo_title']);
            $content['seo_keywords'] = $this->update_str_dq($content['seo_keywords']);
            $content['seo_desc'] = $this->update_str_dq($content['seo_desc']);
        }
        $content['fieldlist'] = db('diyfield')->where(['mid'=>$content['mid'],'ftype'=>['<>', "------"]])->orderRaw("sort asc")->select();
        $json = $this->info($content !== null);
        $json['data'] = $content;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [formlist 表单列表]
     */
    public function api_formlist() {
        $attr = $this->getattr();
        $_infolist = db('diyform')->orderRaw("id asc")->select();
        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [formcontent 表单内容]
     * @param  [number] $id   [表单ID]
     */
    public function api_formcontent() {
        $attr = $this->getattr();
        $id = empty($attr['id']) ? '' : intval($attr['id']);
        $diyfieldmodel = new \app\admin\model\DiyfieldModel();
        $_data = $diyfieldmodel->getAllDiyfield($id, 3);
        $json = $this->info($_data !== null);
        $json['data'] = $_data;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [formaction 表单提交]
     * @param  [number] $id   [表单ID]
     */
    public function api_formaction() {
        $attr = $this->getattr();
        $fid = empty($attr['fid']) ? 0 : intval($attr['fid']);
        try{
            $diyformcon = db('diyform')->where(['id'=>$fid])->find();
            if (!$diyformcon) {
                $res = ['status' => 'error', 'info' => "表单不存在"];
                return $this->returnjson($res, $attr['callback']);
            }
            $dbfield = db('diyfield');
            foreach ($attr as $k => $v) {
                if (is_array($v)) {
                    $attr[$k] = implode(',', $v);
                }
                //验证必填
                $fielddata = $dbfield->where(['field'=>$k,'mid'=>$fid])->find();
                if ($fielddata) {
                    if ($fielddata['isnotnull'] == 1) {
                        if (!$v) {
                            $res = ['status' => 'error', 'info' => $fielddata['title']."请正确填写！"];
                            return $this->returnjson($res, $attr['callback']);
                        }
                    }
                }
                $attr[$k] = addslashes(strip_tags(htmlspecialchars($attr[$k])));
            }

            $attr['vid'] = db('form_'.$diyformcon['tabname'])->strict(false)->insertGetId($attr);
            $attr['create_time'] = time();
            $attr['update_time'] = time();
            $attr['ip'] = request()->ip();

            $result = db('formcon')->strict(false)->insertGetId($attr);
            if(false === $result){            
                $res = ['status' => 'error', 'info' => $this->getError()];
                return $this->returnjson($res, $attr['callback']);
            }else{
                //触发表单提醒机制
                if ($diyformcon['mailwarn'] && $diyformcon['mailadd'] && $diyformcon['mailcontent']) {
                    try {
                        $mail = new PHPMailer(true);
                        $mail->CharSet = 'UTF-8';           //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
                        $mail->IsSMTP();                    // 设定使用SMTP服务
                        $mail->SMTPDebug = 0;               // SMTP调试功能 0=关闭 1 = 错误和消息 2 = 消息
                        $mail->SMTPAuth = true;             // 启用 SMTP 验证功能
                        $mail->SMTPSecure = 'ssl';          // 使用安全协议
                        $mail->Host = config("sys.mail_smtp"); // SMTP 服务器
                        $mail->Port = config("sys.mail_smtpport");                  // SMTP服务器的端口号
                        $mail->Username = config("sys.mail_username");    // SMTP服务器用户名
                        $mail->Password = config("sys.mail_password");     // SMTP服务器密码
                        $mail->SetFrom(config("sys.mail_username"), config("sys.mail_setname"));

                        $mail->Subject = $this->updateMailCon($attr, $diyformcon['mailtitle']);
                        $mail->MsgHTML($this->updateMailCon($attr, $diyformcon['mailcontent']));
                        $mail->AddAddress($diyformcon['mailadd'], '');
                        $jg =  $mail->Send() ? true : $mail->ErrorInfo;
                    } catch (\Exception $e) {
                        $res = ['status' => 'error', 'info' => "表单邮箱提醒配置错误，请检查，或关闭表单中邮件提醒功能"];
                        return $this->returnjson($res, $attr['callback']);
                    }
                }
                $res = ['status' => 'success', 'info' => '提交成功'];
                return $this->returnjson($res, $attr['callback']);
            }
        }catch( PDOException $e){
            $res = ['status' => 'error', 'info' => $e->getMessage()];
        }
        return $this->returnjson($res, $attr['callback']);
    }
    public function updateMailCon($param, $mailcon)
    {
        $preg = '/%[\s\S]*?\%/i';
        preg_match_all($preg, $mailcon, $filelist);
        if ($filelist) {
            foreach ($filelist[0] as $k => $v) {
                $filename = str_replace("%", "", $v);
                if (array_key_exists($filename, $param)) {
                    $mailcon = str_replace($v, $param[$filename], $mailcon);
                } 
            }
        }
        return $mailcon;
    }
    /**
     * [arealist 地区列表]
     * @param  [bool]   $top     [是否推荐]
     * @param  [bool]   $con     [独立内容]
     * @param  [bool]   $url     [二级域名]
     * @param  [number] $limit   [显示数量]
     */
    public function api_arealist() {
        $attr = $this->getattr();
        $top = empty($attr['top']) ? '' : intval($attr['top']);
        $con = empty($attr['con']) ? '' : intval($attr['con']);
        $url = empty($attr['url']) ? '' : intval($attr['url']);
        $limit = empty($attr['limit']) ? null : intval($attr['limit']);
        $_limit = $limit;
        $_top = intval($top);
        $_con = intval($con);
        $_url = intval($url);
        $_where = [];
        $_where['isopen'] = 1;
        if ($_top) {
            $_where['istop'] = $_top;
        }
        if ($_con) {
            $_where['iscon'] = $_con;
        }
        if ($_url) {
            $_where['isurl'] = $_url;
        }
        $_area = $this->areaindex ? db('area')->where(['id' => $this->areaindex])->find() : [];
        if ($_area) {
            $_where['pid'] = $_area['id'];
        }else{
            $_where['pid'] = 0;
        }
        $_limit = "$limit";
        $_infolist = db('area')->where($_where)->orderRaw("sort asc")->limit($_limit)->select();
        if (empty($_infolist)) {
            if ($_area) {
                $_where['pid'] = $_area['pid'];
                $_infolist = db('area')->where($_where)->orderRaw("sort asc")->limit($_limit)->select();
            }
        }
        $_area = new \app\index\model\AreaModel();
        $_category = new \app\index\model\CategoryModel();
        $_content = new \app\index\model\ContentModel();
        foreach($_infolist as $autoindex => $area) {
            if (isset($content)) {
                $_data = $_content->getContentArea($content, $area);
                $_infolist[$autoindex]['url'] = $_data['url'];
                $_infolist[$autoindex]['title'] = $area['stitle'].$content['ys_title'];
            }else{
                if (isset($category)){
                    $_data = $_category->getCategoryArea($category, $area);
                    $_infolist[$autoindex]['url'] = $_data['url'];
                    $_infolist[$autoindex]['title'] = $area['stitle'].$category['ys_title'];
                }else{
                    $_infolist[$autoindex]['url'] = $_area->getAreaUrl($area);
                }
            }
        }
        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        return $this->returnjson($json, $attr['callback']);
    }
    public function update_str_dq($str){
	    $cityname = "";
	    $provname = "";
	    if ($this->areaindex) {
	        $dbarea = db('area');
	        $city = $dbarea->where(['id'=>$this->areaindex])->find();
	        $prov = [];
	        if ($city) {
	            if ($city['pid'] == 0) {
	                $prov = $city;
	            }else{
	                $cityname = $city['stitle'];
	                $prov = top_aera($city['pid']);
	            }
	        }
	        if ($prov) {
	            $provname = $prov['stitle'];
	        }
	    }
	    if (is_object($str)) {
	        $str = $str->toarray();
	    }
	    if (is_array($str)) {
	        foreach ($str as $k111 => $v111) {
	            if (is_string($v111)) {
	                $v111 =  str_replace('[prov]', $provname, $v111);
	                $v111 =  str_replace('[city]', $cityname, $v111);
	                $v111 =  str_replace('[prov_or_city]', $cityname ? $cityname : $provname, $v111);
	                $str[$k111] = $v111;
	            }
	        }
	    }else{
	        $str = str_replace('[prov]', $provname, $str);
	        $str = str_replace('[city]', $cityname, $str);
	        $str =  str_replace('[prov_or_city]', $cityname ? $cityname : $provname, $str);
	    }
	    return $str;
	}
    public function returnjson($json, $callback = null){
        arr_pic_add_url($json);
        $json['areaindex'] = $this->areaindex;
        return $callback === null ? $json : jsonp($json);
    }
    /*public function api_imgupload(){
        $file = request()->file('file');
        $info = $file->validate(['ext'=>config('sys.upload_image_ext'),'size'=>config('sys.upload_image_size') * 1024])->move(ROOT_PATH.'uploads/image/');
        if($info){
            $fileinfo = $info->getInfo();
            $res['name'] = mb_substr($fileinfo['name'], 0,  -4, "UTF-8");
            $res['status'] = 1;
            $res['image_name'] = '/uploads/image/'.str_replace("\\", "/", $info->getSaveName());
            $res = $this->imgamend($res);
        }else{
            $res['status'] = 0;
            $res['error_info'] = $file->getError();
        }
        $json = $this->info($res !== null);
        $json['data'] = $res;
        return $this->returnjson($json, $attr['callback']);
    }*/
    public function api_imgupload(){
        $attr = $this->getattr();
        $base64_img = $attr['file'];
        //$base64_img = "data:image/png;base64,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";
        $base64_img = str_replace('', '+', $base64_img);
        $up_dir = 'uploads/image/'.date('Ymd',time());
        if(!file_exists($up_dir)){
            mkdir($up_dir,0777,true);
        }
        if(preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_img, $result)){
            $type = $result[2];
            if(in_array($type, array('pjpeg', 'jpeg', 'jpg', 'gif', 'bmp', 'png'))){
                $randStr = str_shuffle('1234567890'); //随机字符串
                $rand = substr($randStr,0,4); // 返回前四位
                $picname = date('YmdHis').$rand.'.'.$type;  //完整路径 + 图片名
                $new_file = $up_dir.'/'.$picname;
                if(file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_img)))){
                    $img_path = str_replace($new_file);
                    $res['name'] = $picname;
                    $res['status'] = 1;
                    $res['image_name'] = "/".$new_file;
                    $res = $this->imgamend($res);
                }else{
                    $res['status'] = 0;
                    $res['error_info'] = "图片上传失败";
                }
            }else{
                $res['status'] = 0;
                $res['error_info'] = "文件类型错误";
            }
        }else{
            $res['status'] = 0;
            $res['error_info'] = "图片上传失败";
        }
        $json = $this->info($res !== null);
        $json['data'] = $res;
        return $this->returnjson($json, $attr['callback']);
    }
    public function getattr(){
        $attr = input();
        /*$request_body = file_get_contents('php://input');
        $attr = json_decode($request_body, true);*/
        return $attr;
    }
    //图片更正处理
    private function imgamend($res){
        if (config('sys.image_watermark')) {
            $image = \Image\Image::open('.'.$res['image_name']);
            if (config('sys.image_watermark') == 1) {
                $font = '.'.config('sys.image_watermark_text_font');
                if (is_file($font)) {
                    $image->text(config('sys.image_watermark_text'), $font, config('sys.image_watermark_text_size'), "#".config('sys.image_watermark_text_color'),config('sys.image_watermark_pos'),0,config('sys.image_watermark_text_angle'))
                    ->save('.'.$res['image_name']);
                }else{
                    $res['status'] = 0;
                    $res['error_info'] = '水印文字，不存在的字体文件';
                    return json_encode($res);
                }
            }else{
                if (is_file('.'.config('sys.image_watermark_pic'))) {
                    $image->water('.'.config('sys.image_watermark_pic'), config('sys.image_watermark_pos'), config('sys.image_watermark_pic_opacity'))
                    ->save('.'.$res['image_name']);
                }else{
                    $res['status'] = 0;
                    $res['error_info'] = '水印图片，不存在的图片文件';
                    return json_encode($res);
                }
            }
        }
        if (config('sys.qiniu')) {
            try {
                require_once  ROOT_PATH.'app/extend/Qiniu/autoload.php';
                //上传到七牛后保存的文件名
                $key = substr($res['image_name'], 1);
                // 需要填写你的 Access Key 和 Secret Key
                $accessKey = config('sys.qiniu_accesskey');
                $secretKey = config('sys.qiniu_secretkey');
                $auth = new Auth($accessKey, $secretKey);
                $bucket = config('sys.qiniu_bucket');
                $domain = config('sys.qiniu_domain');
                $token = $auth->uploadToken($bucket);
                $uploadMgr = new UploadManager();
                list($ret, $err) = $uploadMgr->putFile($token, $key, '.'.$res['image_name']);
                if ($err !== null) {
                    $res['status'] = 0;
                    $res['error_info'] = is_object($err) ? "七牛云配置异常，请检查" : $err ;
                } else {
                    $res['status'] = 1;
                    $res['image_name'] = $domain . $ret['key'];
                }
            } catch (Exception $e) {
                $res['status'] = 0;
                $res['error_info'] = '七牛云配置异常，请检查';
                return json_encode($res);
            }
        }else{
            $res['image_name'] = config('sys.site_protocol').'://'.config('sys.site_url').$res['image_name'];
        }
        return $res;
    }

    public function utf8_strcut($str, $start, $length=null) {   
		preg_match_all('/./us', $str, $match);   
		$chars = is_null($length)? array_slice($match[0], $start ) : array_slice($match[0], $start, $length);   
		unset($str);
		return implode('', $chars);   
	}
	public function checkorderstr($orderstr){
        $orderstr = strtolower(str_replace(" ","",$orderstr));
        if (preg_match("/^[a-z]*$/", $orderstr)) {
            return true;
        }else{
            return false;
        }
    }
}