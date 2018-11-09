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

function getHomeurl(){
    $url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = config('sys.site_guide') ? "/index.php/index/index/index" : '/';
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
    $url = config('sys.site_protocol').'://'.$url;
    return $url;
}

function getSearchurl(){
    $home_url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/index/search/index";
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
    $url = config('sys.site_protocol').'://'.$url;
    return $url;
}
function getFormurl(){
    $home_url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/index/myform/index";
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
            $url = "myform/";
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

function getTagurl($tag){
    $home_url = "";
    $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
    switch (config('sys.url_model')) {
         case '1'://动态
            $url = "/index.php/index/tag/index?1=1";
            if ($area) {
                if ($area['isurl']) {
                    $url = $area['etitle'].'.'.config('sys.site_levelurl').$url;
                }else{
                    $url = config('sys.site_url').$url. "&area=".$area['etitle'];
                }
            }else{
                $url = config('sys.site_url').$url;
            }
            $url = $url."&title=".urlencode($tag);
            break;
        case '2'://静态
             # code...
            break;
        case '3'://伪静态
            $url = "tag/";
            if ($area) {
                if ($area['isurl']) {
                    $url = $area['etitle'].'.'.config('sys.site_levelurl')."/".$url;
                }else{
                    $url = config('sys.site_url')."/".$area['etitle']."_".$url;
                }
            }else{
                $url = config('sys.site_url')."/".$url;
            }
            $url = $url.urlencode($tag);
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
    if (isset($_SERVER['HTTP_ACCEPT']))
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
                $url = config('sys.site_protocol')."://m.".config('sys.site_levelurl').str_replace('/index/', '/', $url);
            }else{
                if (stripos($url, "/index/")) {
                    $url = str_replace('/index/', '/wap/', $url);
                }else{
                    $url = str_replace('/index.php?', '/index.php/wap?', $url);
                }
                
            }
            $url = $url == '/' ? "/index.php/wap" : $url;
            break;
        case '3'://伪静态
            if (config('sys.wap_levelurl')) {
                $url = config('sys.site_protocol')."://m.".config('sys.site_levelurl').$url;
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

/**
 * 系统环境检测
 * @return array 系统环境数据
 */
function check_env(){
    $items = array(
        'os'      => array('操作系统', '不限制', '类Unix', PHP_OS, 'success'),
        'php'     => array('PHP版本', '5.4', '5.4+', PHP_VERSION, 'success'),
        'upload'  => array('附件上传', '不限制', '2M+', '未知', 'success'),
        'gd'      => array('GD库', '2.0', '2.0+', '未知', 'success'),
    );

    //PHP环境检测
    if($items['php'][3] < $items['php'][1]){
        $items['php'][4] = 'error';
    }

    //附件上传检测
    if(@ini_get('file_uploads'))
        $items['upload'][3] = ini_get('upload_max_filesize');

    //GD库检测
    $tmp = function_exists('gd_info') ? gd_info() : array();
    if(empty($tmp['GD Version'])){
        $items['gd'][3] = '未安装';
        $items['gd'][4] = 'error';
    } else {
        $items['gd'][3] = $tmp['GD Version'];
    }
    unset($tmp);
    return $items;
}

/**
 * 目录，文件读写检测
 * @return array 检测数据
 */
function check_dirfile(){
    $items = array(
        array('dir',  '可写', 'success', ROOT_PATH.'uploads'),
        array('dir',  '可写', 'success', ROOT_PATH.'data'),
        array('dir',  '可写', 'success', ROOT_PATH.'caches'),
    );
    foreach ($items as &$val) {
        if('dir' == $val[0]){
            if(!is_writable($val[3])) {
                if(is_dir($val[3])) {
                    $val[1] = '可读';
                    $val[2] = 'error';
                    session('error', true);
                } else {
                    $val[1] = '不存在';
                    $val[2] = 'error';
                    session('error', true);
                }
            }
        } else {
            if(file_exists($val[3])) {
                if(!is_writable($val[3])) {
                    $val[1] = '不可写';
                    $val[2] = 'error';
                    session('error', true);
                }
            } else {
                if(!is_writable(dirname($val[3]))) {
                    $val[1] = '不存在';
                    $val[2] = 'error';
                    session('error', true);
                }
            }
        }
    }
    return $items;
}

/**
 * 函数检测
 * @return array 检测数据
 */
function check_func(){
    $items = array(
        array('mysql',     '支持', 'success','0'),
        array('pdo_mysql',          '支持', 'success','1'),
        array('file_get_contents', '支持', 'success','0'),
        array('mb_strlen',         '支持', 'success','0'),
        array('pathinfo',          '支持', 'success','0'),
    );
    $loaded = get_loaded_extensions();
    foreach ($items as &$val) {
    	if ($val[3] == '1') {
    		if(!in_array($val[0], $loaded)){
	            $val[1] = '不支持';
	            $val[2] = 'error';
	            session('error', true);
	        }
    	}else{
    		if(!function_exists($val[0])){
	            $val[1] = '不支持';
	            $val[2] = 'error';
	            session('error', true);
	        }
    	}
        
    }
    return $items;
}
//写入配置文件
function setConfigfile($file, $arr){
    $str="<?php \nreturn [\n";
    foreach($arr as $key=>$v){
        $str.= "\t'".$key."'=>'".$v."',\n";
    }
    $str.="];\n";
    file_put_contents($file, $str);
}
/**
 * 及时显示提示信息
 * @param  string $msg 提示信息
 */
function show_msg($msg, $class = true){
    if($class){
        $str = "<script type=\"text/javascript\">showmsg(\"{$msg}\")</script>";
    }else{
        $str = "<script type=\"text/javascript\">showmsg(\"{$msg}\", \"error\")</script>";
    }
    return $str;
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

function mysqlupdate($sql_path, $old_prefix="", $new_prefix="", $separator=";\n") 
{
    $commenter = array('#','--');
    //判断文件是否存在
    if(!file_exists($sql_path))
        return false;
        
    $content = file_get_contents($sql_path);   //读取sql文件
    $content = str_replace(array($old_prefix, "\r"), array($new_prefix, "\n"), $content);//替换前缀
        
    //通过sql语法的语句分割符进行分割
    $segment = explode($separator,trim($content)); 

    //去掉注释和多余的空行
    $data=array();
    foreach($segment as  $statement)
    {
        $sentence = explode("\n",$statement);         
        $newStatement = array();
        foreach($sentence as $subSentence)
        {
            if('' != trim($subSentence))
            {
                //判断是会否是注释
                $isComment = false;
                foreach($commenter as $comer)
                {
                    if(preg_match("/^(".$comer.")/is",trim($subSentence)))
                    {
                        $isComment = true;
                        break;
                    }
                }
                //如果不是注释，则认为是sql语句
                if(!$isComment)
                    $newStatement[] = $subSentence;                    
            }
        }           
        $data[] = $newStatement;            
    }

    //组合sql语句
    foreach($data as  $statement)
    {
        $newStmt = '';
        foreach($statement as $sentence)
        {
            $newStmt = $newStmt.trim($sentence)."\n";
        }    
        if(!empty($newStmt))            
        { 
            $result[] = $newStmt;
        }
    }   
    return $result;
}