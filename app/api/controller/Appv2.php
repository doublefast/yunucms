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
///index.php?s=api/appv2/mainindex
/*$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';*/
$http_type = config('sys.site_protocol')."://";
define('WEBSITE_HOST', $http_type . $_SERVER['HTTP_HOST']);
class Appv2 extends Controller {
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
	public function api_config() {
        $attr = $this->getattr();
        if (strpos($attr['name'],'*') !== false) {
            $strlist = explode("*", $attr['name']);
            $data = [];
            foreach ($strlist as $k => $v) {
                $data[$v] = config('sys.'.$v);
            }
        }else{
            $confstr = config('sys.'.$attr['name']);
            $data = $confstr;
        }

        $json = $this->info($data !== null);
        $json['data'] = $data;
        return $this->returnjson($json, $attr['callback']);
    }
    public function api_nav() {
        $attr = $this->getattr();
        $typeid = !isset($attr['typeid']) || $attr['typeid'] == '' ? -1 : intval($attr['typeid']);
        $limit = empty($attr['limit'])? null : $attr['limit'];
        $_category = new \app\index\model\CategoryModel();
        $_navlist = $_category->getCategory('', $typeid);
        $_navlist  = $_category->unlimitedForLayer($_navlist);
        foreach($_navlist as $k => $v) {
            $_limit_list = explode(',', $limit);
            if(count($_limit_list) > 1){
                if(($k < $_limit_list[0]) || ($k > $_limit_list[1])) unset($_navlist[$k]);
            } else{
                if($k >= $limit) unset($_navlist[$k]);
            }
            if(!empty($v['jumpurl']) && substr($v['jumpurl'], 0,1) == '@'){
            	$_navlist[$k]['id'] = substr($v['jumpurl'], 1);
            } else {
            	$_navlist[$k]['id'] = $v['id'];
            }
            $_navlist[$k]['child'] = $v['child'];
            $_navlist[$k]['title'] = $v['title'];
            $_navlist[$k]['etitle'] = $v['etitle'];
            $_navlist[$k]['subtitle'] = $v['subtitle'];
            $_navlist[$k]['mid'] = $v['mid'];
            $_navlist[$k]['pid'] = $v['pid'];
            $_navlist[$k]['target'] = $v['target'] ? '_blank' : '_self';
            $_navlist[$k]['url'] = $_category->getCategoryUrl($v);
        }

        $json = $this->info($_navlist !== null);
        $json['data'] = $_navlist;
        return $this->returnjson($json, $attr['callback']);
    }
    public function api_cate() {
        $attr = $this->getattr();
        $typeid = empty($attr['typeid']) ? 0 : trim($attr['typeid']);

        $_category = new \app\index\model\CategoryModel();
        $type = $_category->getOneCategory($typeid);
        $type['url'] = $_category->getCategoryUrl($type);

        $json = $this->info($type !== null);
        $json['data'] = $type->getData();
        return $this->returnjson($json, $attr['callback']);
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

        $json = $this->info($data !== null);
        $json['data'] = $data;
        return $this->returnjson($json, $attr['callback']);
    }
    /**
     * [banner 幻灯片]
     * @param  [number] $id            */
    public function api_bannerlist() {
        $attr = $this->getattr();
        $type = empty($attr['type']) ? '' : $attr['type'];
        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            $orderby = $this->checkorderstr($attr['orderby']) ? $attr['orderby'] : "id DESC";
        }

        if (isset($attr['id'])) {
            $data = db('banner')->where(['id'=>$attr['id']])->find();
        }else{
            $where = [];
            if ($type) {
                $where['type'] = $type;
            }
            $data = db('banner')->where($where)->orderRaw($orderby)->select();
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
    public function api_block() {
        $attr = $this->getattr();
        $name = isset($attr['name']) ? $attr['name'] : '';
        $infolen = empty($attr['infolen']) ? 0 : intval($attr['infolen']);
        $textflag = empty($attr['textflag']) ? 0 : 1;
        $name = trim(htmlspecialchars($name));

        $_block = db('block')->where(['title' => $name])->find();
        $blockcont = '';
        if ($_block) {
            if ($_block['type'] == 2) {
                if (!$textflag) {
                    $blockcont = '<img src="'. $_block['content'] .'" />';
                }else {
                    $blockcont = $_block['content'];
                }
            }else {
                if($infolen) {
                    $blockcont = str2sub(strip_tags($_block['content']), $infolen, 0);//清除html再截取
                }else {
                    $blockcont = $_block['content'];
                }
            }
        }
        $json = $this->info($blockcont !== null);
        $json['data'] = $blockcont;
        return $this->returnjson($json, $attr['callback']);
    }
    public function api_banner() {
        $attr = $this->getattr();
        $type = empty($attr['type']) ? '' : $attr['type'];
        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            $orderby = $this->checkorderstr($attr['orderby']) ? $attr['orderby'] : "id DESC";
        }
        $limit = empty($attr['limit']) ? null : $attr['limit'];

        $_type = $type;

        $_where = [];
        if ($_type) {
            $_where['type'] = $_type;
        }

        $_limit = "$limit";
        $infolist = db('banner')->where($_where)->orderRaw("$orderby")->limit($_limit)->select();

        $json = $this->info($infolist !== null);
        $json['data'] = $infolist;
        return $this->returnjson($json, $attr['callback']);
    }
    public function api_catlist() {
        $attr = $this->getattr();
        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? 0 : trim($attr['cid']);
        $_limit = $limit;
        $_category = new \app\index\model\CategoryModel();
        $_catlist = $_category->getCategory(1);
        //type为top,忽略cid1
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

            $desc = strip_tags($list['desc']);
            $desc = $this->utf8_strcut($desc, 0, 108);
            $_infolist[$k]['desc'] = $desc;
            $_infolist[$k]['create_time_all'] = $list['create_time'];
            $_infolist[$k]['update_time_all'] = $list['update_time'];
            $_infolist[$k]['create_time'] = date("Y-m-d", $list['create_time']);
            $_infolist[$k]['update_time'] = date("Y-m-d", $list['update_time']);
        }
        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        $json['count'] = $_count;
        $json['countpage'] = ceil($_count/$limit);
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
        if (isset($content['content'])) {
            preg_match_all('/<img src=\"(.+?)\".*?>/',$content['content'], $matches, PREG_SET_ORDER);
            foreach ($matches as $k => $v) {
                $content['content'] = preg_replace($v[0], 'img src="'.$v['1'].'"/', $content['content']);
            }
        }
        $content['update_time'] = date("Y-m-d H:i:s", $content['update_time']);
        if (isset($content['seo_title'])) {
            $content['seo_title'] = str_replace("{标题名称}",$content['title'],$content['seo_title']);
        }
        if (isset($content['seo_keywords'])) {
            $content['seo_keywords'] = str_replace("{标题名称}",$content['title'],$content['seo_keywords']);
        }
        if (isset($content['seo_desc'])) {
            $content['seo_desc'] = str_replace("{标题名称}",$content['title'],$content['seo_desc']);
        }
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
    public function api_imgupload(){
        $attr = $this->getattr();
        $base64_img = $attr['file'];
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
        //$attr = input();
        $request_body = file_get_contents('php://input');
        $attr = json_decode($request_body, true);
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