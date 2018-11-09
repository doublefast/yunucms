<?php
use think\Db;
use app\index\model\CategoryModel;

//站内链接
function sitelink($con){

    $list = db('sitelink')->where("status='1'")->order('id desc')->select();
    $num = 0;
    foreach ($list as $k => $v) {
        $url = $v['url'];
        if (substr($url, 0,1) == '@') {
            $catemodel = new CategoryModel();
            $category = $catemodel->getOneCategory(substr($url, 1));
            if ($category) {
                $url = $catemodel->getCategoryUrl($category);
            }
        }

        $astr = "<a href='".$url."' target='".$v['otype']."' title='".$v['name']."'><strong>".$v['name']."</strong></a>";
        $v['num'] = $num>0 ? $num : (empty($v['num']) ? -1 : $v['num']);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?\=)([^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);
        $con = preg_replace( '|(<img\b[^>]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3', $con);
        $con = preg_replace( '|(<a\b[^>]*?)('.$v['name'].')([^>]*?>)(<[^<]*?)('.$v['name'].')([^>]*?>)|U', '$1%&&&&&%$3$4%&&&&&%$6', $con);

        $con = str_replace_limit($v['name'], $astr, $con, $v['num']);
        $con = str_replace('%&&&&&%', $v['name'], $con);
    }
    return $con;
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

function getHomeurl(){
    $url = "";
    $area = session('sys_areainfo');
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
    $area = session('sys_areainfo');
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
    $area = session('sys_areainfo');
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
    $area = session('sys_areainfo');
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
    $area = session('sys_areainfo');
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

function get_wapurl($url){
    $area = session('sys_areainfo');
    switch (config('sys.url_model')) {
        case '1'://动态
            if (config('sys.wap_levelurl')) {
                if ($area) {
                    $url = $url."?area=".$area['etitle'];
                }
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
            if ($area) {
            	if ($url == '/') {
            		$url = $url.$area['etitle'].".html";
            	}else{
            		if ($area['isurl']) {
	                    $url = '/'.$area['etitle'].'_'.substr($url, 1);
	                }
            	}
            }
            if (config('sys.wap_levelurl')) {
                $url = config('sys.site_protocol')."://m.".config('sys.site_levelurl').$url;
            }else{
                $url = config('sys.site_protocol')."://".config('sys.site_url')."/m".$url;
            }
            break;
    }
    return $url;   
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
/**
 * 函数检测
 * @return array 检测数据
 */
function check_func(){
    $items = array(
        array('pdo_mysql',          '支持', 'success','1'),
        array('file_get_contents', '支持', 'success','0'),
        array('mb_strlen',         '支持', 'success','0'),
        array('pathinfo',          '支持', 'success','0'),
    );
    if (!version_compare("6.9", PHP_VERSION, ">")) {
        $items[] = array('mysqli_connect',          '支持', 'success','0');
    }else{
        $items[] = array('mysql',     '支持', 'success','0');
    }

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