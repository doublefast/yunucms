<?php
use think\Db;
//截取字符串
function str2sub($str, $num, $flag = 0, $sp = '...') {
    if ($str == '' || $num <= 0) {
        return $str;
    }
    $strlen = mb_strlen($str, 'utf-8');
    $newstr ='';
    $newstr .= mb_substr($str, 0, $num, 'utf-8');//substr中国会乱码
    if ($num < $strlen && $flag) {
        $newstr .= $sp;
    }

    return $newstr;
}

function sitelink($con){
    $list = db('sitelink')->where("status='1'")->order('id desc')->select();
    foreach ($list as $k => $v) {
        $astr = "<a href='".$v['url']."' target='".$v['otype']."'>".$v['name']."</a>";
        $v['num'] =  empty($v['num']) ? -1 : $v['num'];
        $con = preg_replace( '|(<img[^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3', $con);
        $con = str_replace_limit($v['name'], $astr, $con, $v['num']);
        $con = str_replace('%&&&&&%', $v['name'], $con);
    }
    return $con;
}

function str_replace_limit($search, $replace, $subject, $limit=-1) {
    if (is_array($search)) {
        foreach ($search as $k=>$v) {
            $search[$k] = '`' . preg_quote($search[$k],'`') . '`';
        }
    }else {
        $search = '`' . preg_quote($search,'`') . '`';
    }
    return preg_replace($search, $replace, $subject, $limit);
}

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

//删除根据目录删除子文件
function dir_del($dirpath){
    $dh=opendir($dirpath);
    while (($file=readdir($dh))!==false) {
        if($file!="." && $file!="..") {
            $fullpath=$dirpath."/".$file;
            if(!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                dir_del($fullpath);
                @rmdir($fullpath);
            }
        }
    }
    closedir($dh);
    $isEmpty = true;
    $dh=opendir($dirpath);
    while (($file=readdir($dh))!== false) {
        if($file!="." && $file!="..") {
            $isEmpty = false;
            break;
        }
    }
    return $isEmpty;
}

function is_mobile()
{
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
    {
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
        'oppo','xiaomi','miui','huawei','coolpad','sony','ericsson','mot','samsung',
        'htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo',
        'iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm',
        'operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile');
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
        return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT']))
    {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        }
    }
    return false;
}
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

function str2arr($str, $sp = '***') {
    if ($str == '') {
        return $str;
    }
    $strlist = explode($sp, $str);
    foreach ($strlist as $k => $v) {
        if (empty($v)) {
            unset($strlist[$k]);
        }
    }
    return $strlist;
}
function uploads_add_url(&$value){
    if (gettype($value) == 'string' && !empty($value)) {
        $value = preg_replace('/(\/uploads\/)(.*?\.[jp(e)?g|png|gif|bmp])/','//'.$_SERVER['HTTP_HOST'].'/uploads/'."$2",$value);
    }
}
function arr_pic_add_url(&$array){
    if(is_array($array)){
        foreach ($array as $key=>&$value){
            if(is_array($value)){
                arr_pic_add_url($value);
            }
            else{
                uploads_add_url($value);
            }
        }
    }else{
        uploads_add_url($array);
    }
    return $array;
}
