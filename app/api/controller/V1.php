<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Config;

header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:x-requested-with,content-type');
header('Access-Control-Max-Age:1728000');
header("Content-Type: text/html;charset=utf-8");

$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
define('WEBSITE_HOST', $http_type . $_SERVER['HTTP_HOST']);

class V1 extends Controller {
    public function _initialize() {
        config('sys.sys_area', session('sys_area'));
        config('sys.sys_levelurl', session('sys_levelurl'));
    }
    public function _empty($name) {
        // 空操作
        $apiName = 'api_'.$name;
        if (!method_exists($this, $apiName)) {
            // 方法不存在
            return $this->error();
            exit();
        }
        return $this->$apiName();
    }
    public function index(Request $request) {
        // 空控制器
        $apiName = 'api_'.$request->controller();
        if (!method_exists($this, $apiName)) {
            // 方法不存在
            return $this->error();
            exit();
        }
        return $this->$apiName();
    }
    public function info($condition) {
        // 响应状态和文字
        if ($condition) {
            $json['state'] = 200;
            $json['info'] = '请求成功';
        }else{
            $json['state'] = 400;
            $json['info'] = '请求失败，请参见API文档';
        }
        return $json;
    }
    public function error($info) {
        // 返回错误
        $attr = input();
        $json = $this->info(false);
        if (isset($info)) $json['info'] = $info;
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [config 读取配置信息]
     * @param  [string] $name [名称]
     */
    public function api_config() {
        $attr = input();
        $confstr = config('sys.'.$attr['name']);
        $json = $this->info($confstr !== null);
        $json['data'] = $confstr;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [list 内容列表]
     * @param  [number] $cid        [栏目ID]
     * @param  [number] $titlelen   [标题长度]
     * @param  [string] $orderby    [排序]
     * @param  [string] $keyword    [关键词]
     * @param  [number] $limit      [显示数量]
     * @param  [number] $pagesize   [分页数]
     * @param  [bool]   $flag       [标示]
     * @param  [number] $top        [头条]
     */
    public function api_list() {
        $attr = input();

        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : $attr['cid'];
        $titlelen = empty($attr['titlelen']) ? 0 : intval($attr['titlelen']);

        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            if (strpos($attr['orderby'], 'desc') === true || strpos($attr['orderby'], 'asc') === true) {
            	$orderby = $attr['orderby'];
            }else{
                $orderby = "id DESC";
            }
        }
        $keyword = empty($attr['keyword']) ? '' : trim($attr['keyword']);
        $limit = empty($attr['limit']) ? null : $attr['limit'];
        $pages = empty($attr['pages']) || $attr['pages'] < 1 ? 1 : intval($attr['pages']);
        $flag = empty($attr['flag']) ? '' : intval($attr['flag']);
        $top = empty($attr['top']) ? '' : intval($attr['top']);

        $_cid = $cid;
        $_keyword = $keyword;
        $_flag = $flag;
        $_top = $top;
        $_tag = $tag;

        if($_cid == -1) $_cid = input('cid');
        if ($_cid > 0 || substr($_cid, 0, 1) == '$') {
            $_category = new \app\index\model\CategoryModel();
            $_ids = $_category->getChildsId($_category->getCategory(), $_cid, true);
            $_where = array('create_time' => array('LT', time()), 'cid'=> array('IN', $_ids));
        }else {
            $_where = array('create_time' => array('LT', time()));
        }
        if ($_keyword != '') {
            $_where['title'] = array('LIKE','%'.$_keyword.'%');
        }

        if ($_flag) {
            $_where['istop'] = $_flag;
        }
        if ($_top) {
            $_where['top'] = $_top;
        }

        $_where['create_time'] = ['LT', time()];

        $_infolist = db('content')->where($_where)->order("$orderby")->limit(($pages-1)*$limit,$limit)->select();

        $_content = new \app\index\model\ContentModel();

        foreach ($_infolist as $k => $list) {
            $_infolist[$k] = $_content->getContentByCon($list);
            $_infolist[$k]['alltitle'] = $list['title'];
            $_infolist[$k]['url'] = $_content->getContentArea($list)['url'];
            if($titlelen) $_infolist[$k]['title'] = str2sub($list['title'], $titlelen, 0);
        }

        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }


    public function api_listmip() {
        $attr = input();

        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : $attr['cid'];
        $titlelen = empty($attr['titlelen']) ? 0 : intval($attr['titlelen']);
        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            if (strpos($attr['orderby'], 'desc') === true || strpos($attr['orderby'], 'asc') === true) {
                $orderby = $attr['orderby'];
            }else{
                $orderby = "id DESC";
            }
        }
        $keyword = empty($attr['keyword']) ? '' : trim($attr['keyword']);
        $limit = empty($attr['limit']) ? null : $attr['limit'];
        $pages = empty($attr['pageNum']) || $attr['pageNum'] < 1 ? 1 : intval($attr['pageNum']);
        $flag = empty($attr['flag']) ? '' : intval($attr['flag']);
        $top = empty($attr['top']) ? '' : intval($attr['top']);
        // $tag = empty($attr['tag']) ? '' : trim($attr['tag']);

        $_cid = $cid;
        $_keyword = $keyword;
        $_flag = $flag;
        $_top = $top;
        $_tag = $tag;

        if($_cid == -1) $_cid = input('cid');
        if ($_cid > 0 || substr($_cid, 0, 1) == '$') {
            $_category = new \app\index\model\CategoryModel();
            $_ids = $_category->getChildsId($_category->getCategory(), $_cid, true);
            $_where = array('create_time' => array('LT', time()), 'cid'=> array('IN', $_ids));
        }else {
            $_where = array('create_time' => array('LT', time()));
        }
        if ($_keyword != '') {
            $_where['title'] = array('LIKE','%'.$_keyword.'%');
        }

        if ($_flag) {
            $_where['istop'] = $_flag;
        }
        if ($_top) {
            $_where['top'] = $_top;
        }

        $_where['create_time'] = ['LT', time()];

        $_infolist = db('content')->where($_where)->order("$orderby")->limit(($pages-1)*$limit,$limit)->select();

        $_content = new \app\index\model\ContentModel();

        foreach ($_infolist as $k => $list) {
            $_infolist[$k] = $_content->getContentByCon($list);
            $_infolist[$k]['alltitle'] = $list['title'];
            $_infolist[$k]['url'] = $_content->getContentArea($list)['url'];
            if($titlelen) $_infolist[$k]['title'] = str2sub($list['title'], $titlelen, 0);
            $_infolist[$k]['create_time'] = date('Y-m-d H:i:s', $list['create_time']);
            $_infolist[$k]['update_time'] = date('Y-m-d H:i:s', $list['update_time']);
            $desc = isset($list['desc']) ? $list['desc'] : '';
            $desc = str_replace("&nbsp;", '', $desc);
            $desc = strip_tags($desc);
            $_infolist[$k]['desc'] = $desc;
        }

        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        arr_pic_add_url($json);
        $res['status'] = 0;
        $res['data'] = [];
        $res['data']['items'] = $json['data'];
        $res['data']['isEnd'] = count($json['data']) < $limit ? 1 : 0;
        return $attr['callback'] === null?$res:jsonp($res);
    }
    
    /**
     * [link 友情链接]
     * @param  [number] $type       [类型]
     * @param  [string] $orderby    [排序]
     * @param  [number] $limit      [显示数量]
     * @param  [bool]   $flag       [标示]
     */
    public function api_link() {
        $attr = input();

        $type = empty($attr['type']) ? '' : $attr['type'];
        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            if (strpos($attr['orderby'], 'desc') === true || strpos($attr['orderby'], 'asc') === true) {
                $orderby = $attr['orderby'];
            }else{
                $orderby = "id DESC";
            }
        }
        $limit = empty($attr['limit']) ? null : $attr['limit'];
        $flag = empty($attr['flag']) ? '' : intval($attr['flag']);

        $_type = $type;
        $_flag = $flag;

        $_where = [];
        if ($_type) {
            $_where['type'] = $_type;
        }

        if ($_flag) {
            $_where['pic'] = $_flag ? array('NEQ', '') : array('EQ', '');
        }

        //地区独立内容
        $_area = config('sys.sys_area') ? db('area')->where(['etitle' => config('sys.sys_area')])->find() : [];
        if ($_area) {
            $_where['area'] = [['exp',' is NULL'],['eq',''], ['LIKE','%,'.$_area['id'].',%'], 'or'];
        }

        $_limit = "$limit";
        $_infolist = db('link')->where($_where)->order("$orderby")->limit($_limit)->select();

        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [banner 幻灯片]
     * @param  [number] $type       [类型]
     * @param  [string] $orderby    [排序]
     * @param  [number] $limit      [显示数量]
     */
    public function api_banner() {
        $attr = input();

        $type = empty($attr['type']) ? '' : $attr['type'];
        if (empty($attr['orderby'])) {
            $orderby = "id DESC";
        }else{
            if (strpos($attr['orderby'], 'desc') === true || strpos($attr['orderby'], 'asc') === true) {
                $orderby = $attr['orderby'];
            }else{
                $orderby = "id DESC";
            }
        }
        $limit = empty($attr['limit']) ? null : $attr['limit'];

        $_type = $type;

        $_where = [];
        if ($_type) {
            $_where['type'] = $_type;
        }

        $_limit = "$limit";
        $_infolist = db('banner')->where($_where)->order("$orderby")->limit($_limit)->select();

        $json = $this->info($_infolist !== null);
        $json['data'] = $_infolist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [block 自定义块]
     * @param  [string] $name       [标题]
     * @param  [number] $infolen    [内容长度]
     * @param  [bool]   $textflag   [内容类型]
     */
    public function api_block() {
        $attr = input();

        $name = isset($attr['name']) ? $attr['name'] : '';
        $infolen = empty($attr['infolen']) ? 0 : intval($attr['infolen']);
        $textflag = empty($attr['textflag']) ? 0 : 1;
        $name = trim(htmlspecialchars($name));

        $_block = db('block')->where(['title=' => $name])->find();
        $_block_content = '';
        if ($_block) {
            if ($_block['type'] == 2) {
                if (!$textflag) {
                    $_block_content = '<img src="'. $_block['content'] .'" />';
                }else {
                    $_block_content = $_block['content'];
                }
            }else {
                if($infolen) {
                    $_block_content = str2sub(strip_tags($_block['content']), $infolen, 0);//清除html再截取
                }else {
                    $_block_content = $_block['content'];
                }
            }
        }

        $json = $this->info($_block_content !== null);
        $json['data'] = $_block_content;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [catlist 栏目列表]
     * @param  [number] $cid        [栏目ID]
     * @param  [string] $type       [类型]
     * @param  [number] $limit      [显示数量]
     * @param  [number] $flag       [标示]
     */
    public function api_catlist() {
        $attr = input();

        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : trim($attr['cid']);//只接收一个栏目ID
        $type = empty($attr['type'])? 'son' : $attr['type'];//son表示下级栏目,self表示同级栏目,top顶级栏目(top忽略typeid)
        $flag = empty($attr['flag']) ? 1: intval($attr['flag']);//0(不显示链接和单页),1(全部显示)
        $limit = empty($attr['limit'])? null : $attr['limit'];


        $_limit = $limit;
        $_cid = intval($cid);
        $_type = $type;

        $_category = new \app\index\model\CategoryModel();
        if($_cid == -1) $_cid = input('cid');
        $_catlist = $_category->getCategory(1);

        if ($flag == 0) {
            $_catlist = $_category->clearLink($_catlist);//去除外部链接的栏目
        }
        //type为top,忽略cid
        if($_cid == 0 || $_type == 'top') {
            $_catlist  = $_category->unlimitedForLayer($_catlist);
        }else {

            if ($_type == 'self') {
                //同级分类
                $_typeinfo  = $_category->getSelf($_catlist, $_cid );
                $_catlist  = $_category->unlimitedForLayer($_catlist, 'child', $_typeinfo['pid']);
            }else {
                //son，子类列表
                $_catlist  = $_category->unlimitedForLayer($_catlist, 'child', $_cid);
            }
        }

        foreach($_catlist as $autoindex => $catlist) {
            $_catlist[$autoindex] = $catlist->getData();
            $_limit_list = explode(',', $_limit);
            if(count($_limit_list) > 1){
                if(($autoindex < $_limit_list[0]) || ($autoindex > $_limit_list[1])) unset($_catlist[$autoindex]);
            } else{
                if($_limit && $autoindex >= $_limit) unset($_catlist[$autoindex]);
            }
        }

        $json = $this->info($_catlist !== null);
        $json['data'] = $_catlist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [nav 导航]
     * @param  [number] $typeid     [类型]
     * @param  [number] $limit      [显示数量]
     */
    public function api_nav() {
        $attr = input();

        $typeid = !isset($attr['typeid']) || $attr['typeid'] == '' ? -1 : trim($attr['typeid']);
        $limit = empty($attr['limit'])? null : $attr['limit'];

        $_limit = $limit;
        $_typeid = intval($typeid);

        $_category = new \app\index\model\CategoryModel();
        $_navlist = $_category->getCategory('', $_typeid);

        $_navlist  = $_category->unlimitedForLayer($_navlist);

        foreach($_navlist as $autoindex => $nav) {
            $_limit_list = explode(',', $_limit);
            if(count($_limit_list) > 1){
                if(($autoindex < $_limit_list[0]) || ($autoindex > $_limit_list[1])) unset($_navlist[$autoindex]);
            } else{
                if($autoindex >= $_limit) unset($_navlist[$autoindex]);
            }
            $_navlist[$autoindex]['target'] = $nav['target'] ? '_blank' : '_self';
            $_navlist[$autoindex]['url'] = $_category->getCategoryUrl($nav);
        }

        $json = $this->info($_navlist !== null);
        $json['data'] = $_navlist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [type 导航]
     * @param  [number] $typeid     [类型]
     */
    public function api_type() {
        $attr = input();

        $typeid = empty($attr['typeid']) ? 0 : trim($attr['typeid']);

        $_category = new \app\index\model\CategoryModel();
        $type = $_category->getOneCategory($typeid);
        $type['url'] = $_category->getCategoryUrl($type);

        $json = $this->info($type !== null);
        $json['data'] = $type->getData();
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [area 地区导航]
     * @param  [bool]   $top     [是否推荐]
     * @param  [bool]   $con     [独立内容]
     * @param  [bool]   $url     [二级域名]
     * @param  [number] $limit   [显示数量]
     */
    public function api_area() {
        $attr = input();

        $top = empty($attr['top']) ? '' : intval($attr['top']);
        $con = empty($attr['con']) ? '' : intval($attr['con']);
        $url = empty($attr['url']) ? '' : intval($attr['url']);
        $limit = empty($attr['limit']) ? null : intval($attr['limit']);

        $_limit = $limit;
        $_top = intval($top);
        $_con = intval($con);
        $_url = intval($url);

        $_where = [];
        if ($_top) {
            $_where['istop'] = $_top;
        }
        if ($_con) {
            $_where['iscon'] = $_con;
        }
        if ($_url) {
            $_where['isurl'] = $_url;
        }

        $_area = config('sys.sys_area') ? db('area')->where(['etitle' => config('sys.sys_area')])->find() : [];
        if ($_area) {
            $_where['pid'] = $_area['id'];
        }else{
            $_where['pid'] = 0;
        }

        $_limit = "$limit";
        $_infolist = db('area')->where($_where)->order("sort asc")->limit($_limit)->select();
        if (empty($_infolist)) {
            if ($_area) {
                $_where['pid'] = $_area['pid'];
                $_infolist = db('area')->where($_where)->order("sort asc")->limit($_limit)->select();
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
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [position 当前位置(面包屑导航)]
     * @param  [number]   $cid       [栏目ID]
     * @param  [string]   $sname     [末尾链接名称]
     * @param  [string]   $surl      [末尾链接地址]
     * @param  [string]   $delimiter [分隔符]
     */
    public function api_position() {
        $attr = input();

        $cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1: trim($attr['cid']);//只接收一个栏目ID
        $sname = isset($attr['sname']) ? trim($attr['sname']) : '';
        $surl = isset($attr['surl']) ? trim($attr['surl']) : '';
        $delimiter = isset($attr['delimiter']) ? trim($attr['delimiter']) : '';

        $_sname = $sname;
        $_cid = $cid;

        $position = getPosition($_cid, $_sname, "$surl", "$delimiter");

        $json = $this->info($position !== null);
        $json['data'] = $position;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [url 获取url]
     * @param  [string]   $name       [名称]
     */
    public function api_url() {
        $attr = input();

        $constr = "";
        switch ($attr['name']) {
            case 'home':
                $constr = getHomeurl();
                break;
            case 'search':
                $constr = getSearchurl();
                break;
        }

        $json = $this->info($constr !== null);
        $json['data'] = $constr;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [cwkeywords 显示长尾关键词组合列表]
     */
    public function api_cwkeywords() {
        $attr = input();

        $_keywordlist = explode(',', config('sys.seo_cwkeyword'));
        $_content = new \app\index\model\ContentModel();
        if (isset($content)) {
            $_area = config('sys.sys_area') ? db('area')->where(['etitle' => config('sys.sys_area')])->find() : [];
            $_areaname = $_area ? $_area['stitle'] : "";

            foreach($_keywordlist as $autoindex => $keyword) {
                $_keywordlist[$autoindex]['name'] = array_key_exists("ys_title", $content) ? $content['ys_title'].$keyword : $content['title'].$keyword;

                $_keywordlist[$autoindex]['name'] = $_areaname .$cwkeywords['name'];
                $_keywordlist[$autoindex]['url'] = $_content->getContentUrl($content, $autoindex);
            }
        }

        $json = $this->info($_keywordlist !== null);
        $json['data'] = $_keywordlist;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [content 详情页]
     * @param  [number] $id     [内容ID]
     */
    public function api_content() {
        $attr = input();

        $id = input('id');
        $etitle = input('etitle', '', 'htmlspecialchars,trim');
        $cw = input('cw', '', 'htmlspecialchars,trim');

        if (is_numeric($etitle)) {
            $id = (int)$etitle;
        }
        if (empty($id) && empty($etitle)) {
            return $this->error('参数错误');
            exit();
        }
        if ($etitle) {
            $where = ['etitle'=>$etitle];
        }
        if ($id) {
            $where = ['id'=>$id];
        }

        $content = db('content')->where($where)->find();
        //非正常独立内容链接不显示

        if ($content['area'] != '') {
            $area = config('sys.sys_area') ? db('area')->where(['etitle' => config('sys.sys_area')])->find() : [];
            if ($area) {
                if (!strstr($content['area'], ','.$area['id'].',')) {
                    return $this->error('非正常独立内容链接不显示');
                    exit();
                }
            }else{
                return $this->error('非正常独立内容链接不显示');
                exit();
            }
        }

        if (empty($content)) {
            return $this->error('内容不存在');
            exit();
        }
        db('content')->where('id', $content['id'])->setInc('click');//增加浏览

        $catemodel = new \app\index\model\CategoryModel();
        $category = $catemodel->getOneCategory($content['cid']);

        if (empty($category)) {
            return $this->error('栏目不存在');
            exit();
        }

        if ($category['tpl_show'] == '') {
            return $this->error('模版不存在');
            exit();
        }
        $conmodel = new \app\index\model\ContentModel();
        $content = $conmodel->getContentByCon($content);

        $content['ys_title'] = $content['title'];//记录原始title

        if ($cw !== '') {
            $cwkey = explode(',', config('sys.seo_cwkeyword'));
            $content['title'] = $content['title'].$cwkey[$cw];
        }

        $content = $conmodel->getContentArea($content);

        $content['seo_title'] = $content['seo_title'] ? $content['seo_title'] : $content['title'];
        $content['seo_keywords'] = $content['seo_keywords'] ? $content['seo_keywords'] : config('sys.seo_title');
        $content['seo_desc'] = $content['seo_desc'] ? $content['seo_desc'] : config('sys.seo_desc');

        $content['prev'] = $conmodel->getContentPrev($category['id'], $content['id']);
        $content['next'] = $conmodel->getContentNext($category['id'], $content['id']);

        $content['category'] = $category;

        $json = $this->info($content !== null);
        $json['data'] = $content;
        arr_pic_add_url($json);
        return $attr['callback'] === null?$json:jsonp($json);
    }
    /**
     * [form 表单]
     * @param  [__formid__]  [表单ID]
     * @param  [__captcha1__] [验证码]
     */
    public function api_form() {
        $attr = input();
        $diyform = new \app\index\model\DiyformModel();
        $info = $diyform->getOnediyform($attr['__formid__']);
        if (!$info) {
            $json['state'] = 400;
            $json['info'] = '表单类别不存在!';
            return $attr['callback'] === null?$json:jsonp($json);
        }
        $info = $diyform->insertForm($attr,$info['id']);
        $json['state'] = $info['status'] === 'success'?200:400;
        $json['info'] = $info['msg']?$info['msg']:'请求失败，请参见API文档';
        return $attr['callback'] === null?$json:jsonp($json);
    }
}
