<?php
use think\Db;
use think\Config;
define('WAP_PRE', Config::get('sys.wap_pre') ? Config::get('sys.wap_pre') : "m");
if (!function_exists('connum')) {
	//统计栏目内容数
	function connum($str) {
		$num = 0;
	    $num = db('content')->where(['cid'=>$str])->count();
	    return $num;
	}
}
if (!function_exists('str2sub')) {
	//截取字符串
	function str2sub($str, $num, $flag = false, $unhtml = true,  $sp = '...') {
	    if ($unhtml) {
	        $str = str_replace("&nbsp;", '', $str);
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
}
if (!function_exists('redirecturl')) {
	function redirecturl(){
	    $source_url = curPageURL(); 
	    if (!cache('urllist')) {
	        $urllist = db('redirecturl')->orderRaw('id desc')->select();
	        cache('urllist', $urllist, 7200);
	    }else{
	        $urllist = cache('urllist');
	    }
	    $redirecturl = filter_by_value($urllist, 'source_url', $source_url);
	    if ($redirecturl) {
	        echo("<script type='text/javascript'>window.location.replace('".$redirecturl['target_url']."');</script>");exit();
	        //header("Location: ".$redirecturl['target_url'], TRUE, 301); exit();
	    }
	}
}
if (!function_exists('filter_by_value')) {
	function filter_by_value($array, $index, $value){  
	    $newarray = [];
	    if(is_array($array) && count($array)>0)  { 
	        foreach(array_keys($array) as $key){  
	            $temp[$key] = $array[$key][$index];  
	            if ($temp[$key] == $value){ 
	                $newarray = $array[$key];  
	            }  
	        }  
	    }  
	    return $newarray;  
	}  
}
if (!function_exists('curPageURL')) {
	function curPageURL() 
	{
	    $pageURL = 'http';
	    if ((isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") || (isset($_SERVER["HTTP_FROM_HTTPS"]) && $_SERVER["HTTP_FROM_HTTPS"] == "on") || (isset($_SERVER["HTTP_X_CLIENT_SCHEME"]) && $_SERVER["HTTP_X_CLIENT_SCHEME"] == "https")) {
	        $pageURL .= "s";
	    }
	    $pageURL .= "://";
	    $pageURL .= $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
	    return $pageURL;
	}
}
if (!function_exists('disablewords')) {
	//禁用词
	function disablewords($con){
	    if (config('sys.disablewords_status')) {
	        $text = trim(config('sys.disablewords_content'));
	        $textlist = explode("\n", $text);
	        foreach ($textlist as $k => $v) {
	            $jg = strpos($v, "，") ? "，" : ',';
	            $ciar = explode($jg, $v);
	            $con = str_replace($ciar[0], (isset($ciar[1]) ? $ciar[1] : ''), $con);
	        }
	    }
	    return $con;
	}
}
if (!function_exists('writelog')) {
	//记录日志
	function writelog($uid,$username,$description,$status)
	{
	    $data['admin_id'] = $uid;
	    $data['admin_name'] = $username;
	    $data['description'] = $description;
	    $data['status'] = $status;
	    $data['ip'] = request()->ip();
	    $data['add_time'] = time();
	    $log = db('Log')->insert($data);
	}
}
if (!function_exists('str_replace_limit')) {
	//字符串截取
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
}
if (!function_exists('dir_del')) {
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
}
if (!function_exists('is_mobile')) {
	//手机端
	function is_mobile(){
	    if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])){
	        return true;
	    }
	    /*if (isset ($_SERVER['HTTP_VIA']))  //cdn屏蔽via判断有效
	    {
	        if(!stristr($_SERVER['HTTP_VIA'], "cache")){
	         	return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
	        }
	    }*/
	    if (isset ($_SERVER['HTTP_USER_AGENT']))
	    {
	        $clientkeywords = array ('nokia',
	        'oppo','xiaomi','miui','huawei','coolpad','sony','ericsson','mot','samsung',
	        'htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo',
	        'iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm',
	        'operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile');
	        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
	        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))){
	            return true;
	        }
	    }
	    if (isset($_SERVER['HTTP_ACCEPT']))
	    {
	        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
	        {
	            return true;
	        }
	    }
	    return false;
	}
}
if (!function_exists('str2arr')) {
	//字符转数组
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
}
if (!function_exists('str2img')) {
	//获取字符串图片（1张）
	function str2img($str, $num = 1) {
	    $pattern="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";  
	    $content = $str;  //文章内容  
	    preg_match_all($pattern, $content, $matchContent);  

	    if (count($matchContent[1]) >= $num) {
	        $temp = $matchContent[1][$num -1];
	        if (!stristr($temp, 'http')) {
	            $temp = config('sys.site_protocol').'://'.config('sys.site_url').$temp;
	        }
	    }else{
	        $temp = "";
	    }
	    return $temp;
	}
}
if (!function_exists('update_str_dq')) {
	/**
	 * 修改地区中标签
	 * @param  string $str 文字内容 $sys_area 地区名称
	 */
	function update_str_dq($str, $city = []){
	    //地区文字处理
	    $cityname = "";
	    $provname = "";
	    if ($city) {
	        if (!cache('cachecity'.$city['id'])) {
	            $prov = [];
	            if ($city['pid'] == 0) {
	                $prov = $city;
	            }else{
	                $cityname = $city['stitle'];
	                $prov = top_aera($city['pid']);
	            }
	            if ($prov) {
	                $provname = $prov['stitle'];
	            } 

	            $cachecity['cityname'] = $cityname;
	            $cachecity['provname'] = $provname;
	            cache('cachecity'.$city['id'], $cachecity, 7200);
	        }else{
	            $cachecity = cache('cachecity'.$city['id']);
	            $cityname = $cachecity['cityname'];
	            $provname = $cachecity['provname'];
	        }
	    }
	    if (is_object($str)) {
	        $str = $str->toarray();
	    }
	    if (is_array($str)) {
	        foreach ($str as $k111 => $v111) {
	            if (is_string($v111)) {
	                $v111 = str_replace('[prov]', $provname, $v111);
	                $v111 = str_replace('[city]', $cityname, $v111);
	                $v111 = str_replace('[prov_or_city]', $cityname ? $cityname : $provname, $v111);
	                $str[$k111] = $v111;
	            }
	        }
	    }else{
	        $str = str_replace('[prov]', $provname, $str);
	        $str = str_replace('[city]', $cityname, $str);
	        $str = str_replace('[prov_or_city]', $cityname ? $cityname : $provname, $str);
	    }
	    return $str;
	}
}
if (!function_exists('top_aera')) {
	function top_aera($area_id){
	    $dbarea = db('area');
	    $prov = $dbarea->where(['id'=>$area_id])->find();
	    if ($prov['pid'] != 0) {
	        $prov = top_aera($prov['pid']);
	    }
	    return $prov;
	}
}
if (!function_exists('build_query')) {
	function build_query($query_data, $encoding = false) {  
	    $res = '';  
	    $count = count ( $query_data );  
	    $i = 0;  
	    foreach ( $query_data as $k => $v ) {  
	        if ($encoding === true) {  
	            $v = urlencode ( $v );  
	        }  
	        if ($i < $count - 1) {  
	            $res .= $k . '=' . $v . '&';  
	        } else {  
	            $res .= $k . '=' . $v;  
	        }  
	        $i ++;  
	    }  
	    return $res;  
	} 
}
if (!function_exists('setConfigfile')) {
	//写入配置文件
	function setConfigfile($file, $arr){
	    $str="<?php \nreturn [\n";
	    foreach($arr as $key=>$v){
	        $str.= "\t'".$key."'=>'".$v."',\n";
	    }
	    $str.="];\n";
	    file_put_contents($file, $str);
	}
}
if (!function_exists('add_slashes_recursive')) {
	function add_slashes_recursive($variable ){
	    if (is_string($variable)){
	        $str = stripslashes($variable);
	        $str = preg_replace( "@<script(.*?)</script>@is", "", $str );
	        $str = preg_replace( "@<iframe(.*?)</iframe>@is", "", $str );
	        return addslashes($str);
	    }elseif(is_array($variable)){
	        foreach( $variable as $i => $value ){
	            $variable[add_slashes_recursive($i)] = add_slashes_recursive($value) ;
	        }
	    }
	    return $variable ;
	}
}
if (!function_exists('getprovince')) {
	function getprovince($areaid){
	    $areadata = db('area')->where(['id'=>$areaid])->find();
	    if ($areadata) {
	        if ($areadata['pid'] == 0) {
	            return $areaid;
	        }else{
	            return getprovince($areadata['pid']);
	        }
	    }
	}
}
if (!function_exists('send_post')) {
	function send_post($url, $post_data, $header = 'x-www-form-urlencoded') {    
	    $result = '';
	    $method = "POST";
	    if (is_array($header)) {
	        $headers = $header;
	    }else{
	        $headers = array();
	        array_push($headers, "Content-Type".":"."application/".$header."; charset=UTF-8");
	    }
	    $bodys = http_build_query($post_data);

	    $curl = curl_init();
	    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
	    curl_setopt($curl, CURLOPT_URL, $url);
	    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
	    curl_setopt($curl, CURLOPT_FAILONERROR, false);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($curl, CURLOPT_HEADER, true);
	    if (1 == strpos("$".$url, "https://"))
	    {
	        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
	        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
	    }
	    curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);
	    $response  = curl_exec($curl);
	    if (curl_getinfo($curl, CURLINFO_HTTP_CODE) == '200') {
	        list($header, $result) = explode("\r\n\r\n", $response , 2);
	    }
	    return $result;
	}
}
if (!function_exists('send_get')) {
	function send_get($url, $get_data, $header = 'x-www-form-urlencoded') {    

		$combined = $url."?";
        $valueArr = array();
        foreach($get_data as $key => $val){
            $valueArr[] = "$key=$val";
        }
        $keyStr = implode("&",$valueArr);
        $combined .= ($keyStr);
        
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        curl_setopt($curl, CURLOPT_URL, $combined);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

	    $response  = curl_exec($curl);
	    return $response;
	}
}
if (!function_exists('reeturnsitecopy')) {
    function reeturnsitecopy(){
        return $strarr = [
            'copy_sysname' => '云优CMS',
            'copy_name' => 'YUNUCMS',
            'copy_url' => 'www.yunucms.com',
            'sitestr' => '云优城市分站管理系统',
            'copy_num' => '（中国国家版权局计算机<span>软件著作权登记号：2018SR118857</span>）',
            'payurl' => 'http://www.yunucms.com/code/fenzhan/price/',
        ];
    }
}
if (!function_exists('curl')) {
	function curl($url) {
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_URL,$url);
	    curl_setopt($ch, CURLOPT_HEADER, 0);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
	    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36");
	    $response = curl_exec($ch);
	    if ($response === false) $response = '';
	    curl_close($ch);
	    return $response;
	}
}
if (!function_exists('runhook')) {
    /**
     * 监听钩子的行为
     * @param string $name 钩子名称
     * @param array $params 参数
     */
    function runhook($name = '', $params = []) {
        \think\Hook::listen($name, $params);
    }
}

if (!function_exists('get_plugins_class')) {
    /**
     * 获取插件类名
     * @param  string $name 插件名
     * @return string
     */
    function get_plugins_class($name)
    {
        return "plugins\\{$name}\\{$name}";
    }
}
if (!function_exists('get_plugins_manage')) {
    /**
     * 获取插件类名
     * @param  string $name 插件名
     * @return string
     */
    function get_plugins_manage($name, $co)
    {
        return "plugins\\{$name}\\admin\\{$co}";
    }
}
if (!function_exists('ymkdir')) {
    /**
     * 递归创建目录
     *
     * @param string $path 目录路径，不带反斜杠
     * @param intval $purview 目录权限码
     * @return boolean
     */
    function ymkdir($path, $purview = 0777)
    {
        if (!is_dir($path)) {
            ymkdir(dirname($path), $purview);
            if (!mkdir($path, $purview)) {
                return false;
            }
        }
        return true;
    }
}
if (!function_exists('plugins_action_exist')) {
    /**
     * 检查插件操作是否存在
     * @param string $path 插件操作路径：插件名/控制器/[操作]
     * @param string $group 控制器分组[admin,home]
     * @return bool
     */
    function plugins_action_exist($path = '', $group = 'admin')
    {
        if (strpos($path, '/')) {
            list($name, $controller, $action) = explode('/', $path);
        }
        $controller = empty($controller) ? 'Index' : ucfirst($controller);
        $action = empty($action) ? 'index' : $action;
        
        return method_exists("plugins\\{$name}\\{$group}\\{$controller}", $action);
    }
}

if (!function_exists('plugins_run')) {
    /**
     * 运行插件操作
     * @param string $path  执行操作路径：插件名/控制器/[操作]
     * @param mixed $params 参数
     * @param string $group 控制器分组[admin,home]
     * @return mixed
     */
    function plugins_run($path = '', $params = [], $group = 'admin')
    {
        if (strpos($path, '/')) {
            list($name, $controller, $action) = explode('/', $path);
        } else {
            $name = $path;
        }
        $controller = empty($controller) ? 'index' : ucfirst($controller);
        $action = empty($action) ? 'index' : $action;
        if (!is_array($params)) {
            $params = (array)$params;
        }
        define('IS_PLUGINS', true);
        $class = "plugins\\{$name}\\{$group}\\{$controller}";
        $obj = new $class;
        return call_user_func_array([$obj, $action], [$params]);
    }
}

if (!function_exists('plugins_info')) {
    /**
     * 获取插件信息
     * @param string $name 插件名
     * @return bool
     */
    function plugins_info($name = '')
    {
        $path = ROOT_PATH.'plugins/'.$name.'/info.php';
        if (!file_exists($path)) {
            return false;
        }
        $info = include_once $path;
        return $info;
    }
}
if (!function_exists('getDirFile')) {
    function getDirFile($directory, $dir_name = '', &$arr_file = array())
    {
        if (!is_dir($directory)) {
            return false;
        }

        $mydir = dir($directory);
        while ($file = $mydir->read()) {
            if ((is_dir("$directory/$file")) AND ($file != ".") AND ($file != "..")) {
                if ($dir_name) {
                    getDirFile("$directory/$file", "$dir_name/$file", $arr_file);
                } else {
                    getDirFile("$directory/$file", "$file", $arr_file);
                }

            } else if (($file != ".") AND ($file != "..")) {
                if ($dir_name) {
                    $arr_file[] = "$dir_name/$file";
                } else {
                    $arr_file[] = "$file";
                }
            }
        }
        $mydir->close();

        return $arr_file;
    }
}
if (!function_exists('securityStr')) {
    function securityStr($str)
    {
    	$str = str_replace(array('(',"'",'#','=','`','$','%','&',';','@','\\','{','}'), '', $str);
        return $str;
    }
}
?>