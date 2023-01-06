<?php
use think\Db;
if (!function_exists('sitelink')) {
    function sitelink($con){
        $list = db('sitelink')->where("status='1'")->orderRaw('id desc')->select();
        foreach ($list as $k => $v) {
            $astr = "<a href='".$v['url']."' target='".$v['otype']."'>".$v['name']."</a>";
            $v['num'] =  empty($v['num']) ? -1 : $v['num'];
            $con = preg_replace( '|(<img[^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3', $con);
            $con = str_replace_limit($v['name'], $astr, $con, $v['num']);
            $con = str_replace('%&&&&&%', $v['name'], $con);
        }
        return $con;
    }
}
if (!function_exists('getHomeurl')) {
    function getHomeurl(){
        $url = "";
        $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
        switch (config('sys.url_model')) {
             case '1'://动态
                $url = config('sys.site_guide') ? "/index.php/index/index" : '/';
                if ($area) {
                    if ($area['isurl']) {
                        $url = $area['etitle'].'.'.config('sys.site_levelurl').$url;
                    }else{
                        $url = config('sys.site_url').$url.'?area='.$area['etitle'];
                    }
                }else{
                    $url = config('sys.site_url').$url;
                }
                break;
            case '2'://静态
                 # code...
                break;
            case '3'://伪静态
                $url = config('sys.site_guide') ? "index/" : '';
                if ($area) {
                    if ($area['isurl']) {
                        $url = $area['etitle'].'.'.config('sys.site_levelurl')."/".$url;
                    }else{
                        $url = config('sys.site_url')."/".$area['etitle'].".html";
                    }
                }else{
                    $url = config('sys.site_url')."/".$url;
                }
                break;
        }
        $url = 'http://'.$url;
        return $url;
    }
}
if (!function_exists('getSearchurl')) {
    function getSearchurl(){
        $home_url = "";
        $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
        switch (config('sys.url_model')) {
             case '1'://动态
                $url = "/index.php/search/index";
                if ($area) {
                    if ($area['isurl']) {
                        $url = $area['etitle'].'.'.config('sys.site_levelurl').$url;
                    }else{
                        $url = config('sys.site_url').$url. "&area=".$area['etitle'];
                    }
                }else{
                    $url = config('sys.site_url').$url;
                }
                break;
            case '2'://静态
                 # code...
                break;
            case '3'://伪静态
                $url = "search/";
                if ($area) {
                    if ($area['isurl']) {
                        $url = $area['etitle'].'.'.config('sys.site_levelurl')."/".$url;
                    }else{
                        $url = config('sys.site_url')."/".$area['etitle']."_".$url;
                    }
                }else{
                    $url = config('sys.site_url')."/".$url;
                }
                break;
        }
        $url = 'http://'.$url;
        return $url;
    }
}
if (!function_exists('getPosition')) {
    function getPosition($typeid = 0, $sname = '', $surl = '', $delimiter = '&gt;&gt;') {
        $delimiter = $delimiter ? $delimiter :'&gt;&gt;';

        $position = '<a href="'.getHomeurl().'">首页</a>';

        if (!empty($typeid)) {
            $category = new app\index\model\CategoryModel();

            $cate = $category->getCategory();
            $getParents = $category->getParents($cate, $typeid);
            if (is_array($getParents)) {
                foreach ($getParents as $v) {
                    $cate = $category->getCategoryArea($v);
                    $position .= $delimiter. '<a href="'. $cate['url'] .'">'.$cate['title']. '</a>';
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
}
if (!function_exists('get_wapurl')) {
    function get_wapurl($url){
        switch (config('sys.url_model')) {
            case '1'://动态
                if (config('sys.wap_levelurl')) {
                    $url = "http://m.".config('sys.site_levelurl').str_replace('/index/', '/', $url);
                }else{
                    $url = str_replace('/index/', '/wap/', $url);
                }
                $url = $url == '/' ? "/index.php/wap" : $url;
                break;
            case '3'://伪静态
                if (config('sys.wap_levelurl')) {
                    $url = "http://m.".config('sys.site_levelurl').$url;
                }else{
                    $url = "/m".$url;
                }
                break;
        }
        return $url;
    }
}
if (!function_exists('uploads_add_url')) {
    function uploads_add_url(&$value){
        if (gettype($value) == 'string' && !empty($value)) {
            if (!stristr($value, 'http')) {
                $value = preg_replace('/(\/uploads\/)(.*?\.[jp(e)?g|png|gif|bmp])/i', WEBSITE_HOST.'/uploads/'."$2",$value);
            }else{
                $value = preg_replace('/(\"\/uploads\/)(.*?\.[jp(e)?g|png|gif|bmp])/i', '"'.WEBSITE_HOST.'/uploads/'."$2",$value);
            }
        }
    }
}
if (!function_exists('api_update_str_dq')) {
    function api_update_str_dq(&$value){
        if (gettype($value) == 'string' && !empty($value)){
            $value =  str_replace('[prov]', '', $value);
            $value =  str_replace('[city]', '', $value);
            $value =  str_replace('[prov_or_city]', '', $value);
        }
    }
}
if (!function_exists('arr_pic_add_url')) {
    function arr_pic_add_url(&$array){
        if(is_array($array)){
            foreach ($array as $key=>&$value){
                if(is_array($value)){
                    arr_pic_add_url($value);
                }else{
                    uploads_add_url($value);
                    api_update_str_dq($value);
                }
            }
        }else{
            uploads_add_url($array);
            api_update_str_dq($array);
        }
        return $array;
    }
}