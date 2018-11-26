<?php
use think\Db;
use app\wap\model\CategoryModel;

//站内链接
function sitelink($con){
    $list = db('sitelink')->where("status='1'")->order('id desc')->select();
    $num = 0;
    foreach ($list as $k => $v) {
        $url = $v['wapurl'];
        if (substr($url, 0,1) == '@') {
            $catemodel = new CategoryModel();
            $category = $catemodel->getOneCategory(substr($url, 1));
            if ($category) {
                $url = $catemodel->getCategoryUrl($category);
            }
        }
        if ($v['areapre'] && session('sys_areainfo')) {
            $area = session('sys_areainfo');
            $newname = $area['stitle'].$v['name'];
        }else{
            $newname = $v['name'];
        }
        $astr = "<a href='".$url."' target='".$v['otype']."' title='".$newname."'><strong>".$newname."</strong></a>";
        $v['num'] = $num > 0 ? $num : (empty($v['num']) ? -1 : $v['num']);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?\=)([^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3', $con);
        $con = preg_replace( '|(<a\b[^>]*?)('.$v['name'].')([^>]*?>)(<[^<]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);

        $con = str_replace_limit($v['name'], $astr, $con, $v['num']);
        $con = str_replace('%&&&&&%', $newname, $con);
    }
    return $con;
}

function get_wapurl(){
    $url = $_SERVER['REQUEST_URI'];
    switch (config('sys.url_model')) {
        case '1'://动态
            if (config('sys.wap_levelurl')) {
                $url = str_replace('/m/', '/', $url);
                $url = config('sys.site_protocol')."://m.".config('sys.site_levelurl').str_replace('/index/', '/', $url);
            }else{
                $url = config('sys.site_protocol')."://".config('sys.site_url').str_replace('/index/', '/wap/', $url);
            }
            $url = $url == '/' ? config('sys.site_protocol')."//".config('sys.site_url')."/index.php/wap" : $url;
            break;
        case '3'://伪静态
            if (config('sys.wap_levelurl')) {
                $url = str_replace('/m/', '/', $url);
                $url = config('sys.site_protocol')."://m.".config('sys.site_levelurl').$url;
            }else{
                $url = config('sys.site_protocol')."://".config('sys.site_url').$url;
            }
            break;
    }
    return $url;   
}

function getHomeurl(){
    $url = "";
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl') : config('sys.site_url').'/index.php/wap';

            if ($area) {
                $url = $url.'?area='.$area['etitle'];
            }
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/' : config('sys.site_url').'/m/';

            if ($area) {
                $url = $url.$area['etitle'].".html";
            }
            break;
    }
    $url = config('sys.site_protocol')."://".$url;
    return $url;
}

function getSearchurl(){
    $home_url = "";
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/index.php?s=search/index' : config('sys.site_url').'/index.php?s=wap/search/index';
            if ($area) {
                $url = $url. "&area=".$area['etitle'];
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl') : config('sys.site_url').'/m';
            
            if ($area) {
                $url = $url."/".$area['etitle']."_"."search/";
            }else{
                $url = $url."/search/";
            }
            break;
    }
    $url = config('sys.site_protocol')."://".$url;
    return $url;
}

function getFormurl(){
    $home_url = "";
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/index.php?s=myform/index' : config('sys.site_url').'/index.php?s=wap/myform/index';
            if ($area) {
                $url = $url. "&area=".$area['etitle'];
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/' : config('sys.site_url').'/m/';
            $url = $url."myform/";
            break;
    }
    $url = config('sys.site_protocol')."://".$url;
    return $url;
}

function getCaptchaurl($id){
    $home_url = "";
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
        case '1'://动态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/index.php?s=myform/captcha' : config('sys.site_url').'/index.php?s=wap/myform/captcha';
            $url = $url."&id=$id";
            if ($area) {
               $url = $url. "&area=".$area['etitle'];
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/' : config('sys.site_url').'/m/';
            $url = $url."captcha/$id";
            break;
    }
    $url = config('sys.site_protocol')."://".$url;
    return $url;
}

function getPosition($typeid = 0, $sname = '', $surl = '', $delimiter = '&gt;&gt;') {
    $delimiter = $delimiter ? $delimiter :'&gt;&gt;';

    $position = '<a href="'.getHomeurl().'">首页</a>';

    if (!empty($typeid)) {
        $category = new app\wap\model\CategoryModel();

        $cate = $category->getCategory();
        $getParents = $category->getParents($cate, $typeid);
        if (is_array($getParents)) {       
            foreach ($getParents as $v) {
                //$cate = $category->getCategoryArea($v);
                $position .= $delimiter. '<a href="'. $v['url'] .'">'.$v['title']. '</a>'; 
            }  
        }
    }
    if (!empty($sname)) {
        if (empty($surl)) {
            $position .= $delimiter. $sname; 
        }else {
            $position .= $delimiter. '<a href="' . $surl .'">'.$sname. '</a>'; 
        }
    }
    return $position;
}

function getTagurl($tag){
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/wap/tag/index?1-1";
            if ($area) {
                $url = $url. "&area=".$area['etitle'];
            }
            $url = $url."&title=".urlencode($tag);
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl').'/' : config('sys.site_url').'/m/';
            if ($area) {
                $url = $url.$area['etitle']."_tag/";
            }else{
                $url = $url."tag/";
            }
            $url = $url.urlencode($tag);
            break;
    }
    $url = config('sys.site_protocol')."://".$url;
    return $url;
}
function get_pcurl($url){
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
        case '1'://动态
            $url = $url == "/index.php/wap" ? '/' : $url;
            if (config('sys.wap_levelurl')) {
                $url = str_replace('/index.php/', '/index.php/index/', $url);
            }else{
                $url = str_replace('/index.php/wap/', '/index.php/index/', $url);
            }

            if ($area['isurl']) {
                $url = config('sys.site_protocol')."://".$area['etitle'].'.'.config('sys.site_levelurl').$url;
            }else{
                $url = config('sys.site_protocol')."://".config('sys.site_url').$url;
            }
            break;
        case '3'://伪静态
            if (!config('sys.wap_levelurl')) {
                $url = str_replace('/m/', '/', $url);
            }
            if ($area['isurl']) {
                $url = str_replace("/".$area['etitle']."_", '/', $url);
                $url = config('sys.site_protocol')."://".$area['etitle'].'.'.config('sys.site_levelurl').$url;
            }else{
                $url = config('sys.site_protocol')."://".config('sys.site_url').$url;
            }
            
            break;
    }
    return $url;   
}
