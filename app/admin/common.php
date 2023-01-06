<?php
use think\Db;
if (!function_exists('get_pinyin')) {
    /**
     *  获取拼音信息
     *
     * @access    public
     * @param     string  $str  字符串
     * @param     int  $ishead  是否为首字母
     * @param     int  $isclose  解析后是否释放资源T
     * @return    string
     */
    function get_pinyin($str, $ishead=0, $isclose=1)
    {
        //global $pinyins;
        $pinyins = array();
        $restr = '';
        $str = trim($str);
        $slen = strlen($str);
        //$str=iconv("UTF-8","gb2312",$str);
        //echo $str;
        if($slen < 2)
        {
            return $str;
        }
        if(count($pinyins) == 0)
        {
            $fp = fopen(ROOT_PATH.'statics/pinyin.dat', 'r');
            if (false == $fp) {
            	return '';
            }
            while(!feof($fp))
            {
                $line = trim(fgets($fp));
                $pinyins[$line[0].$line[1]] = substr($line, 3, strlen($line)-3);
            }
            fclose($fp);
        }

        for($i=0; $i<$slen; $i++)
        {
            if(ord($str[$i])>0x80)
            {
                $c = $str[$i].$str[$i+1];
                $i++;
                if(isset($pinyins[$c]))
                {
                    if($ishead==0)
                    {
                        $restr .= $pinyins[$c];
                    }
                    else
                    {
                        $restr .= $pinyins[$c][0];
                    }
                }else
                {
                    $restr .= "";
                }
            }else if( preg_match("/[a-z0-9]/i", $str[$i]) )
            {
                $restr .= $str[$i];
            }
            else
            {
                $restr .= "";
            }
        }
        if($isclose==0)
        {
            unset($pinyins);
        }
        return $restr;
    }
}
if (!function_exists('getMenuList')) {
    //获取菜单列表
    function getMenuList($param){
        $parent = []; //父类
        $child = [];  //子类

        foreach($param as $key=>$vo){

            if($vo['pid'] == 0){
                $vo['href'] = $vo['name'] == "#" ? "#" : url($vo['name']);
                $parent[] = $vo;
            }else{
                $vo['href'] = url($vo['name']); //跳转地址
                $child[] = $vo;
            }
        }

        foreach($parent as $key=>$vo){
            foreach($child as $k=>$v){
                if($v['pid'] == $vo['id']){
                    $parent[$key]['children'][] = $v;
                }
            }
        }
        foreach($parent as $key=>$vo){
            $parent[$key]['tophref'] = array_key_exists("children",$vo) ? $vo['children'][0]['href'] : "#";
        }

        unset($child);
        return $parent;
    }
}
if (!function_exists('parseParams')) {
    /**
     * 将字符解析成数组
     * @param $str
     */
    function parseParams($str)
    {
        $arrParams = [];
        parse_str(html_entity_decode(urldecode($str)), $arrParams);
        return $arrParams;
    }
}
if (!function_exists('subTree')) {
    /**
     * 子孙树 用于菜单整理
     * @param $param
     * @param int $pid
     */
    function subTree($param, $pid = 0)
    {
        static $res = [];
        foreach($param as $key=>$vo){

            if( $pid == $vo['pid'] ){
                $res[] = $vo;
                subTree($param, $vo['id']);
            }
        }
        return $res;
    }
}
if (!function_exists('prepareMenu')) {
    /**
     * 整理菜单树方法
     * @param $param
     * @return array
     */
    function prepareMenu($param)
    {
        $parent = []; //父类
        $child = [];  //子类

        foreach($param as $key=>$vo){

            if($vo['pid'] == 0){
                $vo['href'] = '#';
                $parent[] = $vo;
            }else{
                $vo['href'] = url($vo['name']); //跳转地址
                $child[] = $vo;
            }
        }

        foreach($parent as $key=>$vo){
            foreach($child as $k=>$v){

                if($v['pid'] == $vo['id']){
                    $parent[$key]['child'][] = $v;
                }
            }
        }
        unset($child);
        return $parent;
    }
}
if (!function_exists('format_bytes')) {
    /**
     * 格式化字节大小
     * @param  number $size      字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string            格式化后的带单位的大小
     */
    function format_bytes($size, $delimiter = ' ') {
        $units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
        for ($i = 0; $size >= 1024 && $i < 5; $i++) {
            $size /= 1024;
        }
        return round($size, 2) . $delimiter . $units[$i];
    }
}
if (!function_exists('rand_str')) {
    //获取随机字符串
    function rand_str( $length = 5 ) { 
        // 密码字符集，可任意添加你需要的字符 
        $chars = 'abcdefghijklmnopqrstuvwxyz'; 
        $str =''; 
        for ( $i = 0; $i < $length; $i++ ) 
        {
            $str .= $chars[ mt_rand(0, strlen($chars) - 1) ]; 
        } 
        return $str; 
    } 
}
if (!function_exists('getFileFolderList')) {
    /**
     * getFileFolderList
     *@fileFlag 0 所有文件列表,1只读文件夹,2是只读文件(不包含文件夹)
     */
    function getFileFolderList($pathname,$fileFlag = 0, $pattern='*') {
        $fileArray = array();
        $pathname = rtrim($pathname,'/') . '/';
        $list = [];
        if (strpos($pattern, ',') !== false) {
            $patarr = explode(",", $pattern);
            foreach ($patarr as $k => $v) {
                $list = array_merge($list, glob($pathname.$v));
            }
        }else{
            $list = glob($pathname.$pattern);
        }
        
        if ($list) {
        	foreach ($list as $i => $file) {
    	        switch ($fileFlag) {
    	            case 0:
    	                $fileArray[] = basename($file);
    	                break;
    	            case 1:
    	                if (is_dir($file)) {
    	                    $fileArray[] = basename($file);
    	                }
    	                break;

    	            case 2:
    	                if (is_file($file)) {                    
    	                    $fileArray[] = basename($file);
    	                }
    	                break;
    	            
    	            default:
    	                break;
    	        }
    	    }    
    	}
        

        if(empty($fileArray)) $fileArray = NULL;
        return $fileArray;
    }
}
if (!function_exists('read_all_dir')) {
    function read_all_dir($dir)
    {
        $arr = array();
        $hander = scandir($dir);    
        foreach ($hander as $v) {      
            if (is_dir($dir . DS . $v) && $v != "." && $v != "..") { 
                $arr[$v] = read_all_dir($dir . DS . $v); 
            }else{
                if($v != "." && $v != ".."){   
                    //$arr[]=$v; 
                }
            }
        }
        return $arr;
    }
}
if (!function_exists('getDir2')) {
    //获取所有文件列表
    function getDir2($dir)
    {
        $files = array();
        foreach (glob($dir . DS.'*') as $file) {
            if (is_dir($file)) {
                $files = array_merge($files, getDir2($file));
            } else {
                $files[] = $file;
            }
        }
        return $files;
    }
}
if (!function_exists('parse_sql')) {
    /**
    * 分割sql语句
    * @param  string $content sql内容
    * @param  bool $limit  如果为1，则只返回一条sql语句，默认返回所有
    * @param  array $prefix 替换前缀
    * @return array|string 除去注释之后的sql语句数组或一条语句
    */
    function parse_sql($sql = '', $limit = 0, $prefix = []) {
            // 被替换的前缀
            $from = '';
            // 要替换的前缀
            $to = '';

            // 替换表前缀
            if (!empty($prefix)) {
                $to   = current($prefix);
                $from = current(array_flip($prefix));
            }

            if ($sql != '') {
                // 纯sql内容
                $pure_sql = [];

                // 多行注释标记
                $comment = false;

                // 按行分割，兼容多个平台
                $sql = str_replace(["\r\n", "\r"], "\n", $sql);
                $sql = explode("\n", trim($sql));

                // 循环处理每一行
                foreach ($sql as $key => $line) {
                    // 跳过空行
                    if ($line == '') {
                        continue;
                    }

                    // 跳过以#或者--开头的单行注释
                    if (preg_match("/^(#|--)/", $line)) {
                        continue;
                    }

                    // 跳过以/**/包裹起来的单行注释
                    if (preg_match("/^\/\*(.*?)\*\//", $line)) {
                        continue;
                    }

                    // 多行注释开始
                    if (substr($line, 0, 2) == '/*') {
                        $comment = true;
                        continue;
                    }

                    // 多行注释结束
                    if (substr($line, -2) == '*/') {
                        $comment = false;
                        continue;
                    }

                    // 多行注释没有结束，继续跳过
                    if ($comment) {
                        continue;
                    }

                    // 替换表前缀
                    if ($from != '') {
                        $line = str_replace('`'.$from, '`'.$to, $line);
                    }
                    if ($line == 'BEGIN;' || $line =='COMMIT;') {
                        continue;
                    }
                    // sql语句
                    array_push($pure_sql, $line);
                }

                // 只返回一条语句
                if ($limit == 1) {
                    return implode("", $pure_sql);
                }

                // 以数组形式返回sql语句
                $pure_sql_arr = implode("\n", $pure_sql);
                $pure_sql = explode(";\n", $pure_sql_arr);
                return $pure_sql;
            } else {
                return $limit == 1 ? '' : [];
            }
    }
}
if (!function_exists('get_byte')) {
    /**
     * 功能：计算文件大小
     * @param int $bytes
     * @return string 转换后的字符串
     */
    function get_byte($bytes) {
        if (empty($bytes)) {
            return '--';
        }
        $sizetext = array(" B", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
        return round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), 2) . $sizetext[$i];
    }
}
if (!function_exists('s_to_hs')) {
    function s_to_hs($s = 0){
        $h = floor($s / 60);
        $s = $s % 60;
        //$h = (strlen($h) == 1)? '0'.$h : $h;
        //$s = (strlen($s) == 1)? '0'.$s : $s;
        if($h){
            $str = $h.'分'.$s."秒";
        }else{
            if ($s) {
                $str = $s."秒";
            }else{
                $str = "1秒";
            }
        }
        return $str;
    }
}
if (!function_exists('strip_slashes_recursive')) {
    function strip_slashes_recursive( $variable ){
        if ( is_string( $variable ) )
            return stripslashes( $variable ) ;
        if ( is_array( $variable ) )
            foreach( $variable as $i => $value )
                $variable[ $i ] = strip_slashes_recursive( $value ) ;
        
        return $variable ; 
    }
}
if (!function_exists('returnpayurl')) {
    function returnpayurl(){
        return "http://www.yunucms.com/buy/index.html";
    }
}
if (!function_exists('mysqlupdate')) {
    function mysqlupdate($sql_path, $old_prefix="", $new_prefix="", $separator=";\n") {
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
}
if (!function_exists('create_appsecret')) {
    //伪原创
    function create_appsecret($appid, $apikey) {
        return md5($appid.$apikey);
    }
}
if (!function_exists('url_get_contents')) {
    //根据URL获取内容
    function url_get_contents($url) {
        try{
            $heads = get_headers($url, 1);
            $html = "";
            if (stristr($heads[0], "200") || stristr($heads[0], "302")) {
                $parm=array(
                    "http"=>array(
                        "method"=>"GET",
                        "timeout"=>3
                    ),
                );
                $context = stream_context_create($parm);
                $html = @file_get_contents($url, false, $context);
            }
            return $html;
        }catch( PDOException $e){
            return "ERROR";
        }
    }
}
if (!function_exists('getHomeurl')) {
    //获取首页URL
    function getHomeurl($area){
        $url = "";
        switch (config('sys.url_model')) {
             case '1'://动态
                $url = "/index.php?s=index/index";
                //$url = config('sys.site_guide') ? "/index.php?s=index/index/index" : '/';
                if ($area) {
                    if ($area['isurl']) {
                        $url = $area['etitle'].'.'.config('sys.site_levelurl').'/';
                    }else{
                        $url = config('sys.site_url').$url.'&area='.$area['etitle'];
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
}
if (!function_exists('_array_column')) {
    function _array_column(array $array, $column_key, $index_key=null){
        $result = [];
        foreach($array as $arr) {
            if(!is_array($arr)) continue;

            if(is_null($column_key)){
                $value = $arr;
            }else{
                $value = $arr[$column_key];
            }

            if(!is_null($index_key)){
                $key = $arr[$index_key];
                $result[$key] = $value;
            }else{
                $result[] = $value;
            }
        }
        return $result; 
    }
}
if (!function_exists('gettableval')) {
    function gettableval($table){
        //创建DB对象
        $db = Db::connect();
        $valstr = "";
        $result = $db->query("SELECT * FROM `{$table}`");
        foreach ($result as $row) {
            $row = array_map('addslashes', $row);
            $valstr .= str_replace(array("\r","\n"),array('\r','\n'),implode("', '", $row));
        }
        return $valstr;
    }
}
if (!function_exists('get_host')) {
    function get_host($to_virify_url = ''){
        $url   = $to_virify_url ? $to_virify_url : $_SERVER['HTTP_HOST'];
        $data = explode('.', $url);
        $co_ta = count($data);
     
        //判断是否是双后缀
        $zi_tow = true;
        $host_cn = 'com.cn,net.cn,org.cn,gov.cn';
        $host_cn = explode(',', $host_cn);
        foreach($host_cn as $host){
            if(strpos($url,$host)){
                $zi_tow = false;
            }
        }
     
        //如果是返回FALSE ，如果不是返回true
        if($zi_tow == true){
     
            // 是否为当前域名
            if($url == 'localhost'){
                $host = $data[$co_ta-1];
            }
            else{
                $host = $data[$co_ta-2].'.'.$data[$co_ta-1];
            }
            
        }
        else{
            $host = $data[$co_ta-3].'.'.$data[$co_ta-2].'.'.$data[$co_ta-1];
        }
        
        return $host;
    }
}
if (!function_exists('dirsize')) {
    function dirsize($dir){
        @$dh = opendir($dir);
        $size = 0;
        while($file = @readdir($dh)){
            if($file!="." && $file!=".."){
                $path = $dir."/".$file;
                if(is_dir($path)){
                    $size += dirsize($path);
                }elseif(is_file($path)){
                    $size += filesize($path);
                }
            }
        }
        @closedir($dh);
        return $size;
    }
}
if (!function_exists('lvlstr')) {
    function lvlstr($lvl){
        $lvlstr = "";
        switch ($lvl) {
            case '2':
                $lvlstr = "　├ ";
                break;
            case '3':
                $lvlstr = "　　├ ";
                break;
            case '4':
                $lvlstr = "　　　├ ";
                break;
            case '5':
                $lvlstr = "　　　　├ ";
                break;
            case '6':
                $lvlstr = "　　　　　├ ";
                break;
            case '7':
                $lvlstr = "　　　　　　├ ";
                break;
            case '8':
                $lvlstr = "　　　　　　　├ ";
                break;
        }
        return $lvlstr;
    }
}