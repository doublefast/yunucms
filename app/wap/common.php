<?php
use think\Db;
//截取字符串
function str2sub($str, $num, $flag = false, $unhtml = true,  $sp = '...') {
    if ($unhtml) {
        $str = strip_tags($str);
    }
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
        $astr = "<a href='".$v['url']."' target='".$v['otype']."' title='".$stitle.$v['name']."'><strong>".$stitle.$v['name']."</strong></a>";
        $v['num'] = $num>0 ? $num : (empty($v['num']) ? -1 : $v['num']);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?\=)([^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3', $con);
        $con = preg_replace( '|(<a\b[^>]*?)('.$v['name'].')([^>]*?>)(<[^<]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);

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
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl') : config('sys.site_url').'/index.php/wap';

            if ($area) {
                $url = $url.'?area='.$area['etitle'];
            }
            break;
        case '3'://伪静态
            $url = config('sys.wap_levelurl') ? "m.".config('sys.site_levelurl') : config('sys.site_url').'/m/';

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
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/wap/search/index";
            if ($area) {
                $url = $url. "?area=".$area['etitle'];
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = "search/";
            if ($area) {
                $url = $area['etitle']."_".$url;
            }else{
                $url = $url;
            }
            break;
    }
    $url = getHomeurl().$url;
    return $url;
}
function getFormurl(){
    $home_url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/wap/myform/index";
            if ($area) {
                $url = $url. "?area=".$area['etitle'];
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = "myform/";
            if ($area) {
                $url = $area['etitle']."_".$url;
            }else{
                $url = $url;
            }
            break;
    }
    $url = getHomeurl().$url;
    return $url;
}
function getCaptchaurl($id){
    $home_url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/index/myform/captcha?id=$id";
            if ($area) {
                if ($area['isurl']) {
                    $url = $area['etitle'].'.'.config('sys.site_levelurl').$url;
                }else{
                    $url = config('sys.site_url').$url. "?area=".$area['etitle'];
                }
            }else{
                $url = config('sys.site_url').$url;
            }
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = "captcha/$id";
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
    $url = config('sys.site_protocol').'://'.$url;
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
function getTagurl($tag){
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
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
            $url = "tag/";
            if ($area) {
                $url = "/m/".$area['etitle']."_".$url;
            }else{
                $url = "/m/".$url;
            }
            $url = $url.urlencode($tag);
            break;
    }
    return $url;
}
/**
 * 修改地区中标签
 * @param  string $str 文字内容 $sys_area 地区名称
 */
function update_str_dq($str, $sys_area = ''){
    $cityname = "";
    $provname = "";
    if ($sys_area) {
        $dbarea = db('area');
        $city = $dbarea->where(['etitle'=>$sys_area])->find();
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
function top_aera($area_id){
    $dbarea = db('area');
    $prov = $dbarea->where(['id'=>$area_id])->find();
    if ($prov['pid'] != 0) {
        $prov = top_aera($prov['pid']);
    }
    return $prov;
}