<?php
namespace app\admin\controller;
use think\Controller;
use think\Log;
use think\Config;
use app\admin\model\ContentModel;
use app\admin\model\CategoryModel;
use app\admin\model\AreaModel;
use app\admin\model\LinkModel;

use think\Db;
use think\File;
use think\Request;
use com\Dir;
use Qiniu\Auth as Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;

class Api extends Controller
{
	public function _initialize()
    {
    	header("Access-Control-Allow-Origin: *");
    	header("Content-type:text/html;charset=utf-8");
    }
    /*
    	标题：title
    	分类ID：cid
    	创建时间：release_time
    	内容：content
    	推荐：flag
    	域名：appsecret
   	*/
    public function infouploading()
    {
		if (!config('sys.api_xxts')) {
    		$data = ['state'=> 2, 'msg'=>'信息推送API未开启'];
	    	//Log::write(json_encode($data),'log');
	    	return json_encode($data); exit();
    	}
    	if (request()->isPost()){
	    	$param = input();
	    	if (empty($param['appsecret']) || empty($param['title']) || empty($param['cid'])) {
	    		$data = ['state'=> 2, 'msg'=>'参数异常 '];
	    		//Log::write(json_encode($data),'log');
	    		return json_encode($data);
	    	}
	    	$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';  
	    	if (md5($http_type.$_SERVER['HTTP_HOST']) != $param['appsecret']) {
	    		$data = ['state'=> 2, 'msg'=>'appsecret 不匹配'];
	    		//Log::write(json_encode($data),'log');
	    		return json_encode($data);
	    	}
	    	$category = new CategoryModel();
	        $cate = $category->getOneCategory($param['cid']);
	       	if ($cate) {
	       		
	       		$param['sort'] = isset($param['sort']) ? $param['sort'] : 0;
	       		$param['istop'] = isset($param['flag']) ? $param['flag'] : 0;
	       		$param['mid'] = $cate['mid'];
	       		$param['content'] = htmlspecialchars_decode($param['content']);
	       		$param['create_time'] = isset($param['release_time']) ? date('Y-m-d H:i:s', $param['release_time']) : date('Y-m-d H:i:s', time());

	       		if (isset($param['oneimg']) && $param['oneimg']) {
	       			$param['pic'] = str2img($param['content']);
	       		}
	       		$content = new ContentModel();
	            $flag = $content->insertContent($param, $cate['mid']);

	            if ($flag['code']) {
	            	$data = ['state'=> 1, 'msg'=>'success', 'url'=>config('sys.site_protocol')."://".config('sys.site_url')."/index.php?s=index/show/index&etitle=".$flag['data']];
	            	//Log::write(json_encode($data),'log');
	    			return json_encode($data);
	            }else{
	            	$data = ['state'=> 2, 'msg'=>'内容添加失败'];
	            	//Log::write(json_encode($data),'log');
	    			return json_encode($data);
	            }
	       	}else{
	       		$data = ['state'=> 2, 'msg'=>'分类信息未找到'];
	       		//Log::write(json_encode($data),'log');
	    		return json_encode($data);
	       	}
		}else{
			$data = ['state'=> 2, 'msg'=>'请求方式异常'];
			//Log::write(json_encode($data),'log');
	    	return json_encode($data);
		}
    }

    public function checkopen(){
    	if (config('sys.api_xxts')) {
    		$data = ['state'=> 1, 'msg'=>'已开启'];
    	}else{
    		$data = ['state'=> 0, 'msg'=>'未开启'];
    	}
    	//Log::write(json_encode($data),'log');
    	return json_encode($data); exit();
    }

    //图片上传
  	public function imgupload(){
        if ($this->checkrequest()) {
    	  	if (request()->isPost()){
                $file = request()->file(input('file'));
                $info = $file->validate(['ext'=>config('sys.upload_image_ext'),'size'=>config('sys.upload_image_size') * 1024])->move(ROOT_PATH.'uploads/image/');
                if($info){
                    $fileinfo = $info->getInfo();
                    $res['name'] = mb_substr($fileinfo['name'], 0,  -4, "UTF-8"); 
                    $res['status'] = 1;
                    $res['image_name'] = '/uploads/image/'.str_replace("\\", "/", $info->getSaveName());
                    
                    $res = $this->imgamend($res);
                }else{
                    $res['status'] = 0; 
                    $res['error_info'] = $file->getError();
                }
                return json_encode($res);
            }
        }
  	}
    //远程图片下载
    public function downloadimg(){
        if (request()->isPost()){
            $imgurl = securityStr(input('imgurl'));
            $ext = strrchr($imgurl, '.');
            if(strpos(config('sys.upload_image_ext'), str_replace(".","",$ext)) === false){
                $res['status'] = 0; 
                $res['error_info'] = '文件格式异常不支持远程下载';
                return json_encode($res);
            }
            $path = ROOT_PATH . 'uploads' . DS.'image'. DS.date("Ymd").DS;
            if(!is_dir($path)){
                mkdir($path, 0777, true);
            }
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $imgurl);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            $file = curl_exec($ch);
            curl_close($ch);
            $filename = str_replace(" ", "",str_replace(".", "" , microtime()));
            $newfilename = $filename.$ext; 
            $resource = fopen($path . $newfilename, 'a');
            fwrite($resource, $file);
            fclose($resource);
            if (file_exists($path.$newfilename)) {
                $res['name'] = $filename; 
                $res['status'] = 1;
                $res['image_name'] = '/uploads/image/'.date("Ymd")."/".$newfilename;
                $res = $this->imgamend($res);
            }else{
                $res['status'] = 0; 
                $res['error_info'] = "远程文件下载异常";
            }
            return json_encode($res);
        }
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
  	//获取地区列表
  	public function getarea(){
  		$area = new AreaModel();
        $arealist = $area->getAllArea();
        $zhuzhan = [
            'pid' => '0',
            'iscon' => '1',
            'id' => '88888888',
            'title' => '主站',
            'stitle' => '主站'
        ];
        array_unshift($arealist, $zhuzhan);
        $arealist = $area->getAreaByCon($arealist);
        return json_encode($arealist);
  	}
    //获取关键词组合列表_新版
    public function getkeywords2(){
        $jieguo = array();
        //获取首页SEO关键词
        if (config('sys.seo_keywords')) {
            $str = config('sys.seo_keywords');
            $str = str_replace("[prov]", "", $str);
            $str = str_replace("[city]", "", $str);
            $str = str_replace("[prov_or_city]", "", $str);
            $jieguo = array_merge($jieguo, explode(",", $str));
        }
        //获取栏目页SEO关键词
        $catlist = db('category')->where("seo_keywords <> ''")->column('seo_keywords');
        foreach ($catlist as $k => $v) {
            $str = $v;
            $str = str_replace("[prov]", "", $str);
            $str = str_replace("[city]", "", $str);
            $str = str_replace("[prov_or_city]", "", $str);
            $str = str_replace("，", ",", $str);
            $jieguo = array_merge($jieguo, explode(",", $str));
        }
        //获取详情页SEO关键词
        $conlist = db('content')->where("seo_keywords <> ''")->column('seo_keywords');
        foreach ($conlist as $k => $v) {
            $str = $v;
            $str = str_replace("[prov]", "", $str);
            $str = str_replace("[city]", "", $str);
            $str = str_replace("[prov_or_city]", "", $str);
            $str = str_replace("，", ",", $str);
            $jieguo = array_merge($jieguo, explode(",", $str));
        }
        //获取地区管理的关键词
        $arealist = db('area')->where("seo_keywords <> ''")->column('seo_keywords');
        foreach ($arealist as $k => $v) {
            $jieguo = array_merge($jieguo, explode(",", $v));
        }
        $jieguo = array_unique($jieguo);
        return json_encode($jieguo);
    }
  	//获取关键词组合列表
  	public function getkeywords(){
  		$arealist = db('area')->where("istop = 1 OR iscon = 1 OR isurl = 1")->column('title');
  		$ctkeyword = config('sys.seo_ctkeyword') ? explode(',', config('sys.seo_ctkeyword')) : [];
  		$hxkeyword = config('sys.seo_hxkeyword') ? explode(',', config('sys.seo_hxkeyword')) : [];
  		$cwkeyword = config('sys.seo_cwkeyword') ? explode(',', config('sys.seo_cwkeyword')) : [];
  		$max = 50000;
  		$jieguo = array();
  		//c
	  	foreach ($hxkeyword as $k2 => $v2) {
	  		if (count($jieguo) < $max) {
	  			$jieguo[] = $v2;
	  		}
  		}
  		//b+c
  		foreach ($ctkeyword as $k1 => $v1) {
	  		foreach ($hxkeyword as $k2 => $v2) {
	  			if (count($jieguo) < $max) {
	  				$jieguo[] = $v1.$v2;
	  			}
	  		}
	  	}
	  	//c+d
	  	foreach ($hxkeyword as $k2 => $v2) {
	  		foreach ($cwkeyword as $k3 => $v3) {
	  			if (count($jieguo) < $max) {
	  				$jieguo[] = $v2.$v3;
	  			}
	  		}
	  	}
	  	//a+c+d
  		foreach ($arealist as $k => $v) {
  			foreach ($hxkeyword as $k2 => $v2) {
	  			foreach ($cwkeyword as $k3 => $v3) {
	  				if (count($jieguo) < $max) {
	  					$jieguo[] = $v.$v2.$v3;
	  				}
	  			}
	  		}
  		}
  		//a+c
  		foreach ($arealist as $k => $v) {
  			foreach ($hxkeyword as $k2 => $v2) {
	  			if (count($jieguo) < $max) {
	  				$jieguo[] = $v.$v2;
	  			}
	  		}
  		}
	  	//b+c+d
  		foreach ($ctkeyword as $k1 => $v1) {
	  		foreach ($hxkeyword as $k2 => $v2) {
	  			foreach ($cwkeyword as $k3 => $v3) {
	  				if (count($jieguo) < $max) {
	  					$jieguo[] = $v1.$v2.$v3;
	  				}
	  			}
	  		}
	  	}
  		//a+b+c+d
  		foreach ($arealist as $k => $v) {
  			foreach ($ctkeyword as $k1 => $v1) {
	  			foreach ($hxkeyword as $k2 => $v2) {
	  				foreach ($cwkeyword as $k3 => $v3) {
	  					if (count($jieguo) < $max) {
	  						$jieguo[] = $v.$v1.$v2.$v3;
	  					}
	  				}
	  			}
	  		}
  		}
        return json_encode($jieguo);
  	}
  	public function geturls(){
  		//首页链接
        $areahomelist = db('area')->where(['isopen'=>1, 'isurl'=>0])->select();
  		$siteurl = config('sys.site_protocol')."://".config('sys.site_url');
        //站点地图      
        $category = new \app\admin\model\CategoryModel;
        $content = new \app\admin\model\ContentModel;
        $homecate = new \app\index\model\CategoryModel;
        $homecon = new \app\index\model\ContentModel;

        //urls
        $urls[] = $siteurl;
        foreach ($areahomelist as $k => $v) {
        	$areahomeurl = getHomeurl($v);
        	$urls[] = $areahomeurl;
        }
        $infolist = $category->getAllcategory(); 
        foreach($infolist as $k=>$v){
            $clist = $content->getContentByCid($v['id'], true);
            foreach($clist as $k1=>$v1){
                if ($v1['area']) {
                    $arealist = explode(",", $v1['area']);
                    foreach ($arealist as $k2 => $v2) {
                        if ($v2) {
                            $areadata = db('area')->where(['id'=>$v2,'isopen'=>1, 'isurl'=>0])->find();
                            if ($areadata) {
                                $htmlurl = $homecon->getContentUrl($v1,'',$areadata);
                                if (config('sys.url_model') == 3) {
                                    $htmlurl = $htmlurl.'html';
                                }
                                $htmlurl = str_replace("&", "&amp;", $htmlurl);
                                $urls[] = $htmlurl;
                            }else{
	                        	if ($v2 == '88888888') {
	                            	$htmlurl = $homecon->getContentUrl($v1);
				                    if (config('sys.url_model') == 3) {
				                        $htmlurl = $htmlurl.'html';
				                    }
				                    $urls[] = $htmlurl;
	                            }
	                        }
                        }
                    }
                }else{
                    $htmlurl = $homecon->getContentUrl($v1);
                    if (config('sys.url_model') == 3) {
                        $htmlurl = $htmlurl.'html';
                    }
                    $urls[] = $htmlurl;
                }
            }
        } 
        return json_encode($urls);
  	}
    //获取网站访问量pv
    public function getvisit(){
        $db = db('browse');
        $data['d'] = $db->where("TO_DAYS(FROM_UNIXTIME(time,'%Y-%m-%d')) = TO_DAYS(NOW())")->count();//当天
        $data['w'] = $db->where("YEARWEEK(FROM_UNIXTIME(time,'%Y-%m-%d'), 1) = YEARWEEK(NOW(), 1)")->count();//本周
        $data['m'] = $db->where("FROM_UNIXTIME(time,'%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m')")->count();//本月
        $data['c'] = $db->count();//总共

        $d15 = [];

        for ($i=0; $i < 15; $i++) { 
        	$daytime = strtotime("- $i day");
        	$day['day'] = date('m-d', $daytime);
        	$day['pv'] = $db->where("TO_DAYS(FROM_UNIXTIME(time,'%Y-%m-%d')) = TO_DAYS(FROM_UNIXTIME(".$daytime.",'%Y-%m-%d'))")->count();
        	$d15[] = $day;
        }
        $data['d15'] = $d15;
        return json_encode($data);
    }
    //验证帐号密码是否正确
    public function checkuser(){
    	if (!input("encrypt") || !input("username") || !input("password")) {
            return json_encode(['code' => 0, 'data' => '', 'msg' => '请求参数异常']);
        }
    	$encrypt = input('encrypt');
        $html = send_post("http://control.yunucms.com/Index/Api/cms_login_check", ['encrypt'=>$encrypt,'host'=>config('sys.site_url')]);
        if ($html) {
         	$username = input("username");
            $password = htmlspecialchars_decode(input("password"));
            $db = Db::name('admin');
            $hasUser = $db->where(['username'=>$username])->find();
            if(empty($hasUser)){
                return json_encode(['code' => 0, 'data' => '', 'msg' => '管理员不存在']);
            }
            if(md5(md5($password).config('auth_key')) != $hasUser['password']){
                return json_encode(['code' => 0, 'data' => '', 'msg' => '账号或密码错误']);
            }
            if(1 != $hasUser['status']){
                return json_encode(['code' => 0, 'data' => '', 'msg' => '该账号被禁用']);
            }
            //获取该管理员的角色信息
            session('admin_username', $username);
            writelog($hasUser['id'], session('admin_username'), '用户【'.session('admin_username').'】客户端登录成功', 1);
            return json_encode(['code' => 1, 'data' => '', 'msg' => '登录成功！']);
       	}else{
       		return json_encode(['code' => 0, 'data' => '', 'msg' => '请求方式异常']);
       	}

    }
  	public function upsitemap(){
  		$this->createsitemap();
    	$data = ['state'=> 1, 'msg'=>'SUCCESS'];
    	return json_encode($data);
  	} 

  	//更新站点地图
    public function createsitemap(){
    	$category = new \app\admin\model\CategoryModel;
        $content = new \app\admin\model\ContentModel;
        $homecate = new \app\index\model\CategoryModel;
        $homecon = new \app\index\model\ContentModel;

        $sitemap_up_index = config('sys.sitemap_up_index') ? config('sys.sitemap_up_index') : 'hourly';
        $sitemap_up_list = config('sys.sitemap_up_list') ? config('sys.sitemap_up_list') : 'daily';
        $sitemap_up_content = config('sys.sitemap_up_content') ? config('sys.sitemap_up_content') : 'weekly';
        $sitemap_lev_index = config('sys.sitemap_lev_index') ? config('sys.sitemap_lev_index') : '1.0';
        $sitemap_lev_list = config('sys.sitemap_lev_list') ? config('sys.sitemap_lev_list') : '0.8';
        $sitemap_lev_content = config('sys.sitemap_lev_content') ? config('sys.sitemap_lev_content') : '0.6';
        $sitemap_num_start = config('sys.sitemap_num_start') ? intval(config('sys.sitemap_num_start')) : 0;
        $sitemap_num = config('sys.sitemap_num') ? intval(config('sys.sitemap_num')) : 1000;
        $sitemap_type = config('sys.sitemap_type') ? config('sys.sitemap_type') : 'sitemap.xml';
        $sitemap_type_site = config('sys.sitemap_type_site') ? config('sys.sitemap_type_site') : '1,2,3,4';
        $sitemap_num = ($sitemap_num - $sitemap_num_start) > 50000 ? $sitemap_num_start + 50000 : $sitemap_num; //上限50000

        $sitemap_type_site_list = explode(",", $sitemap_type_site);
        //index_list
        $siteurl = config('sys.site_protocol')."://".config('sys.site_url');
        $arealist = db('area')->where(['isopen'=>1,'isurl'=>0])->select();  

        $areahomelist = []; //地区首页
        if (strstr($sitemap_type_site, '4')) {  
            $areahomelist = $arealist;
        }
        
        $cateurl_list = []; //栏目
        $catelist = $category->getAllcategory(); 
        if (strstr($sitemap_type_site, '2')) {   
            foreach($catelist as $k=>$v){
                $cateurl = $homecate->getCategoryUrl($v);
                $cateurl = str_replace("&", "&amp;", $cateurl);
                $cateurl_list[] = [
                    'cateurl' => $cateurl,
                    'catetitle' => $v['title'],
                ];
            }
        }
        $cateareaurl_list = []; //地区栏目
        if (strstr($sitemap_type_site, '5')) {   
            foreach($catelist as $k=>$v){
                foreach ($arealist as $k1 => $v1) {
                    $cateurl = $homecate->getCategoryUrl($v, $v1);
                    $cateurl = str_replace("&", "&amp;", $cateurl);
                    $cateareaurl_list[] = [
                        'cateurl' => $cateurl,
                        'catetitle' => $v1['title'].$v['title'],
                    ];
                }
                
            }
        }

        $conurl_list = [];  //内容页
        $conareaurl_list = [];  //地区内容页
        if (strstr($sitemap_type_site, '3') || strstr($sitemap_type_site, '6')) {   
            $conlist = db("content")->where(['create_time' =>['LT', time()]])->limit($sitemap_num_start, ($sitemap_num-$sitemap_num_start))->orderRaw('create_time desc')->select();
            foreach($conlist as $k1=>$v1){
                if ((count($conurl_list)+count($conareaurl_list)) >= $sitemap_num) {
                    break;
                }
                if ($v1['jumpurl']) {
                    continue;
                }

                if ($v1['area']) {
                    //不需要生成分站
                    if (strstr($sitemap_type_site, '6')) {
                    	if ($v1['mainurl']) { //内容同步主站
        			        $conurl = $homecon->getContentUrl($v1, '', [], false);
        			        $conurl = config('sys.url_model') == 3 ? $conurl.'html' : $conurl;
        			        $conurl_list[] = [
        	                    'title' => $v1['title'],
        	                    'create_time' => $v1['create_time'],
        	                    'seo_desc' => $v1['seo_desc'],
        	                    'ys_conurl' => $conurl,
        	                    'conurl' => str_replace("&", "&amp;", $conurl)
        	                ];
                    	}else{
                    		$arealist = explode(",", $v1['area']);
        	                foreach ($arealist as $k2 => $v2) {
        	                    if ((count($conurl_list)+count($conareaurl_list)) >= $sitemap_num) {
        	                        break;
        	                    }
        	                    if ($v2) {
        	                        $areadata = db('area')->where(['id'=>$v2, 'isopen'=>1,'isurl'=>0])->find();
        	                        if ($areadata) {
        	                            $conurl = $homecon->getContentUrl($v1, '', $areadata);
        	                            $conurl = config('sys.url_model') == 3 ? $conurl.'html' : $conurl;

        	                            $conareaurl_list[] = [
        	                                'title' => $areadata['stitle'].$v1['title'],
        	                                'create_time' => $v1['create_time'],
        	                                'seo_desc' => $v1['seo_desc'],
        	                                'ys_conurl' => $conurl,
        	                                'conurl' => str_replace("&", "&amp;", $conurl)
        	                            ];
        	                        }else{
        	                            if ($v2 == '88888888') {
        	                                $indexurl = $homecon->getContentUrl($v1, '', [], false);
        	                                $indexurl = config('sys.url_model') == 3 ? $indexurl.'html' : $indexurl;

        	                                $conurl_list[] = [
        	                                    'title' => $v1['title'],
        	                                    'create_time' => $v1['create_time'],
        	                                    'seo_desc' => $v1['seo_desc'],
        	                                    'ys_conurl' => $indexurl,
        	                                    'conurl' => str_replace("&", "&amp;", $indexurl)
        	                                ];
        	                            }
        	                        }
        	                    }
        	                }
                    	}
                    }
                }else{
                    $indexurl = $homecon->getContentUrl($v1, '', [], false);
                    $indexurl = config('sys.url_model') == 3 ? $indexurl.'html' : $indexurl;
                    $conurl_list[] = [
                        'title' => $v1['title'],
                        'create_time' => $v1['create_time'],
                        'seo_desc' => $v1['seo_desc'],
                        'ys_conurl' => $indexurl,
                        'conurl' => str_replace("&", "&amp;", $indexurl)
                    ];
                }
            }
        }

        //站点地图
        if (strstr($sitemap_type, 'sitemap.xml')) {
            $sitemap = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n";  

            foreach ($sitemap_type_site_list as $k1 => $v1) {
                switch ($v1) {
                    case '1':
                        $sitemap .= "<url>\r\n"."<loc>".$siteurl."</loc>\r\n"."<priority>".$sitemap_lev_index."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_index."</changefreq>\r\n</url>\r\n";
                        break;
                    case '2':
                        foreach ($cateurl_list as $k => $v) {
                            $sitemap .= "<url>\r\n"."<loc>".$v['cateurl']."</loc>\r\n"."<priority>".$sitemap_lev_list."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_list."</changefreq>\r\n</url>\r\n";
                        }
                        break;
                    case '3':
                        foreach ($conurl_list as $k => $v) {
                            $sitemap .= "<url>\r\n"."<loc>".$v['conurl']."</loc>\r\n"."<priority>".$sitemap_lev_content."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_content."</changefreq>\r\n</url>\r\n";
                        }
                        break;
                    case '4':
                        foreach ($areahomelist as $k => $v) {
                            $areahomeurl = getHomeurl($v);
                            $areahomeurl = str_replace("&", "&amp;", $areahomeurl);
                            $sitemap .= "<url>\r\n"."<loc>".$areahomeurl."</loc>\r\n"."<priority>".$sitemap_lev_index."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_index."</changefreq>\r\n</url>\r\n";
                        }
                        break;
                    case '5':
                        foreach ($cateareaurl_list as $k => $v) {
                            $sitemap .= "<url>\r\n"."<loc>".$v['cateurl']."</loc>\r\n"."<priority>".$sitemap_lev_list."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_list."</changefreq>\r\n</url>\r\n";
                        }
                        break;
                    case '6':
                        foreach ($conareaurl_list as $k => $v) {
                            $sitemap .= "<url>\r\n"."<loc>".$v['conurl']."</loc>\r\n"."<priority>".$sitemap_lev_content."</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>".$sitemap_up_content."</changefreq>\r\n</url>\r\n";
                        }
                        break;
                }
            }
            $sitemap .= '</urlset>';       
            $file = fopen("sitemap.xml","w");
            fwrite($file, $sitemap);
            fclose($file);
        }
        //rss
        if (strstr($sitemap_type, 'rss.xml')) {
            $rss = "<rss version=\"2.0\">\r\n";
            $rss .= "<channel>\r\n";
            $sitedesc = str_replace("[prov_or_city]", '', config('sys.seo_description'));
            $rss .= "<title><![CDATA[".config('sys.site_title')."]]></title>\r\n";
            $rss .= "<category><![CDATA[".config('sys.site_title')."]]></category>\r\n";
            $rss .= "<description><![CDATA[".$sitedesc."]]></description>\r\n";
            $rss .= "<link><![CDATA[".$siteurl."]]></link>\r\n";
            $rss .= "<language>zh_CN</language>\r\n";
            $rss .= "<pubDate>".date('Y-m-d H:i:s')."</pubDate>\r\n";
            $rss .= "<lastBuildDate>".date('Y-m-d H:i:s')."</lastBuildDate>\r\n";
            $rss .= "<generator>YUNUCMS RSS Generator</generator>\r\n";
            $rss .= "<ttl>5</ttl>\r\n";
            foreach ($conurl_list as $k => $v) {
                $rss .= "<item>\r\n";
                $rss .= "<title><![CDATA[".$v['title']."]]></title>\r\n";
                $rss .= "<description><![CDATA[".$v['seo_desc']."]]></description>\r\n";
                $rss .= "<link><![CDATA[".$v['conurl']."]]></link>\r\n";
                $rss .= "<author><![CDATA[".config('sys.site_title')."]]></author>\r\n";
                $rss .= "<pubDate><![CDATA[".date('Y-m-d H:i:s', $v['create_time'])."]]></pubDate>\r\n";
                $rss .= "<category><![CDATA[]]></category>\r\n";
                $rss .= "</item>\r\n";
            }
            foreach ($conareaurl_list as $k => $v) {
                $rss .= "<item>\r\n";
                $rss .= "<title><![CDATA[".$v['title']."]]></title>\r\n";
                $rss .= "<description><![CDATA[".$v['seo_desc']."]]></description>\r\n";
                $rss .= "<link><![CDATA[".$v['conurl']."]]></link>\r\n";
                $rss .= "<author><![CDATA[".config('sys.site_title')."]]></author>\r\n";
                $rss .= "<pubDate><![CDATA[".date('Y-m-d H:i:s', $v['create_time'])."]]></pubDate>\r\n";
                $rss .= "<category><![CDATA[]]></category>\r\n";
                $rss .= "</item>\r\n";
            }
            $rss .= "</channel>\r\n";
            $rss .= "</rss>";
            $rssfile = fopen("rss.xml","w");
            fwrite($rssfile, $rss);
            fclose($rssfile);
        }

        //txt
        $txt = "";
        //html
        $html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n";
        $html .= "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n";
        $html .= "<head>\r\n";
        $html .= "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n";
        $html .= "<title>html网站地图</title>\r\n";
        $html .= "<style type='text/css'>\r\n";
        $html .= ".clearfix {*zoom: 1;}\r\n";
        $html .= ".clearfix:after {content: ' ';display: block;height: 0;clear: both;visibility: hidden;}\r\n";
        $html .= ".list {max-width: 1200px;margin: 0 auto;}\r\n";
        $html .= ".list li {float: left;width: 49%;font-size: 14px;color: #666;list-style: none;border-bottom: 1px solid #ddd;line-height: 40px;margin-right: 2%;}\r\n";
        $html .= ".list li:nth-child(2n) {margin-right: 0;}\r\n";
        $html .= ".list li a {float: left;width: 60%;color: #666;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;text-decoration: none;}\r\n";
        $html .= ".list li span {float: right;font-size: 12px;color: #888;}\r\n";
        $html .= "</style>\r\n";
        $html .= "</head>\r\n";
        $html .= "<body>\r\n";
        $html .= "<div class='wrap'>\r\n";
        $html .= "<div class='list clearfix'>\r\n";
        $html .= "<ul>\r\n";

        $seo_title_area = config('sys.seo_area') && config('sys.seo_title_area') ? config('sys.seo_title_area') : "";


        foreach ($sitemap_type_site_list as $k1 => $v1) {
            switch ($v1) {
                case '1':
                    $html .= "<li><a href='".$siteurl."' title='".update_str_dq(config('sys.seo_title'),[])."' target='_blank'>".update_str_dq(config('sys.seo_title'),[])."</a><span>".date('Y-m-d H:i:s')."</span></li>\r\n";
                    $txt .= $siteurl."\r\n";
                    break;
                case '2':
                    foreach ($cateurl_list as $k => $v) {
                        $html .= "<li><a href='".$v['cateurl']."' title='".$v['catetitle']."' target='_blank'>".$v['catetitle']."</a><span>".date('Y-m-d H:i:s')."</span></li>\r\n";
                        $txt .= $v['cateurl']."\r\n";
                    }
                    break;
                case '3':
                    foreach ($conurl_list as $k => $v) {
                        $html .= "<li><a href='".$v['ys_conurl']."' title='".$v['title']."' target='_blank'>".$v['title']."</a><span>".date('Y-m-d H:i:s', $v['create_time'])."</span></li>\r\n";
                        $txt .= $v['ys_conurl']."\r\n";
                    }
                    break;
                case '4':
                    foreach ($areahomelist as $k => $v) {
                        $areahomeurl = getHomeurl($v);
                        $areatitle = $v['seo_title'] ? $v['seo_title'] : $seo_title_area;
                        $areatitle = $areatitle ? $areatitle : config('sys.seo_title');
                        $areatitle =  update_str_dq($areatitle, $v);

                        $html .= "<li><a href='".$areahomeurl."' target='_blank'>".$areatitle."</a><span>".date('Y-m-d H:i:s')."</span></li>\r\n";
                        $txt .= $areahomeurl."\r\n";
                    }
                    break;
                case '5':
                    foreach ($cateareaurl_list as $k => $v) {
                        $html .= "<li><a href='".$v['cateurl']."' title='".$v['catetitle']."' target='_blank'>".$v['catetitle']."</a><span>".date('Y-m-d H:i:s')."</span></li>\r\n";
                        $txt .= $v['cateurl']."\r\n";
                    }
                    break;
                case '6':
                    foreach ($conareaurl_list as $k => $v) {
                        $html .= "<li><a href='".$v['ys_conurl']."' title='".$v['title']."' target='_blank'>".$v['title']."</a><span>".date('Y-m-d H:i:s', $v['create_time'])."</span></li>\r\n";
                        $txt .= $v['ys_conurl']."\r\n";
                    }
                    break;
            }
        }

        $html .= "</ul>\r\n";
        $html .= "</div>\r\n";
        $html .= "</div>\r\n";
        $html .= "</body>\r\n";
        $html .= "</html>\r\n";
        if (strstr($sitemap_type, 'sitemap.htm')) {
            $file = fopen("sitemap.htm","w");
            fwrite($file, $html);
            fclose($file);
        }
        if (strstr($sitemap_type, 'sitemap.txt')) {
            $file = fopen("sitemap.txt","w");
            fwrite($file, $txt);
            fclose($file);
        }
    }



    //文件/夹管理
  	public function browsefile($spath = '', $stype = 'picture') {
        if ($this->checkrequest()) {
    	    $spath = input('spath');
    	    $stype = input('stype');
    	    $imgtype = input('imgtype') ? input('imgtype') : "";

    	    $base_path = '/uploads/img';
    	    $encodeflag = input('encodeflag', 0, 'intval');
    	    switch ($stype) {
    	      	case 'picture':
    	        	$base_path = '/uploads/image';
    	        	break;
    	      	case 'file':
    		        $base_path = '/uploads/file';
    		        break;      
    	      	default:
    	        	exit('参数错误');
    	        	break;
    	    }
    	    if ($encodeflag) {
    	      	$spath = base64_decode($spath);
    	    }
    	    $spath = str_replace('.', '', ltrim($spath,$base_path));
    	    $path = $base_path . '/'. $spath;
    	    $dirlist = new Dir('.'.$path);//加上.      '.'.$path
    	    $list = $dirlist->toArray();

    	    for ($i=0; $i < count($list); $i++) { 
    	      	$list[$i]['isImg'] = 0;
    	      	if ($list[$i]['isFile']) {
    		        $url = config('sys.site_protocol')."://".config('sys.site_url').rtrim($path,'/') . '/'. $list[$i]['filename'];
    		        $ext = explode('.', $list[$i]['filename']);
    		        $ext = end($ext);
    		        if (in_array($ext, explode(',', config('sys.upload_file_ext')))) {
    		          	$list[$i]['isImg'] = 1;
    		        }
    	      	}else {
    	        	$url = url('api/browsefile', array('spath'=>base64_encode(rtrim($path,'/') . '/'. $list[$i]['filename']),'stype' => $stype, 'encodeflag' => 1, 'imgtype' => $imgtype ));
    	      	    $url = strpos($url, 'http') !== false ? $url: config('sys.site_protocol')."://".config('sys.site_url') .$url;
                } 
    	      	$list[$i]['url'] = $url;      
    	      	$list[$i]['size'] = get_byte($list[$i]['size']);
    	      	unset($list[$i]['owner']);
    	      	unset($list[$i]['perms']);
    	      	unset($list[$i]['group']);
    	      	unset($list[$i]['inode']);
    	      	unset($list[$i]['isLink']);
    	      	unset($list[$i]['isImg']);
    	      	unset($list[$i]['atime']);
    	      	unset($list[$i]['ctime']);
                unset($list[$i]['pathname']);
    	    }
    	    $last_names = _array_column($list, 'filename');
    		array_multisort($last_names, SORT_DESC, $list);

    	    $parentpath = substr($path, 0, strrpos($path, '/'));
    	    $url = url('api/browsefile', array('spath'=> base64_encode($parentpath),'encodeflag' => 1, 'stype' => $stype, 'imgtype' => $imgtype));
            $data = [
                'purl'=> strpos($url, 'http') !== false ? $url: config('sys.site_protocol')."://".config('sys.site_url') .$url,
                'infolist'=> $list,
            ];
    	    return json_encode($data);
        }
	}

    public function linklist(){
        if ($this->checkrequest()) {
            $link = new LinkModel();
            $infolist = $link->getAllLink("site_exist asc"); 
            return json_encode($infolist);
        }
    }
    public function linkadd()
    {
        if ($this->checkrequest()) {
            $param = input('post.');
            $param['add_type'] = 2;

            if (config('sys.seo_default_area')) {
            	$param['area'] = ",".config('sys.seo_default_area').",";
            }else{
            	$param['area'] = ",88888888,";
            }
            
            foreach ($param as $k => $v) {
                $param[$k] = addslashes(strip_tags(htmlspecialchars($param[$k])));
            }
            $link = new LinkModel();
            $flag = $link->insertLink($param);
            @unlink("./index.html");
            return json_encode(['code' => $flag['code'],'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
    }
    public function linkdel()
    {
        if ($this->checkrequest()) {
            $id = input('param.id');
            $link = new LinkModel();
            $flag = $link->delLink($id);
            return json_encode(['code' => $flag['code'], 'msg' => $flag['msg']]);
        }
    }
    public function linkcount()
    {
        if ($this->checkrequest()) {
            $link = new LinkModel();
            $flag = $link->getCountLink();
            return json_encode(['data' => $flag ? $flag : 0]);
        }
    }
    public function resetlink(){
        $link = new LinkModel();
        $infolist = $link->getAllLink();
        $db = db('link');
        foreach ($infolist as $k => $v) {
            $isczarea = true;
            $temp = $v['area'];
            for($i=0; $i<strlen($temp); $i++)
            {
                if (substr($temp,$i,1) != ",") {
                    $isczarea = false;
                }
            }
            $create_time = is_numeric($v['create_time']) ? $v['create_time'] : strtotime($v['create_time']);
            $data = [
            'create_time' => $create_time < 9999 ? time() : $create_time,
            'area' => $isczarea ? '' : $v['area'],
            ];
            $flag = $db->where(['id'=>$v['id']])->update($data);
        }
        header('Content-Type: text/html; charset=utf-8'); 
        echo "修复完成！";
    }
    public function editlink(){
        if ($this->checkrequest()) {
            $id = input('param.id');
            $site_exist = input('param.site_exist');
            $link = new LinkModel();
            $info = $link->getOneLink($id);
            if (!$info) {
                return json(['code' => 0, 'msg' => "友情链接信息不存在"]);
            }
            $isczarea = true;
            $temp = $info['area'];
            for($i=0; $i<strlen($temp); $i++)
            {
                if (substr($temp,$i,1) != ",") {
                    $isczarea = false;
                }
            }
            $create_time = is_numeric($info['create_time']) ? $info['create_time'] : strtotime($info['create_time']);
            $data = [
                'site_exist' => $site_exist,
                'create_time' => $create_time < 9999 ? time() : $create_time,
                'area' => $isczarea ? '' : $info['area'],
            ];
            $flag = db('link')->where(['id'=>$id])->update($data);
            return false === $flag ? json(['code' => 0, 'msg' => '编辑失败']) : json(['code' => 1, 'msg' => '编辑成功']);
        }
    }
    //百度URL推送
    public function bdautots(){
        $db = Db::name('content');
        if (config('sys.api_bdautots') && config('sys.seo_bdurl')) {
            $start = strtotime(date('Y-m-d 00:00:00', strtotime("-1 day")));
            $end = strtotime(date('Y-m-d 23:59:59', strtotime("-1 day")));
            $flag = $db->where('create_time', 'between', $start.','.$end)->select();
            $urls = array();
            $indcon = new \app\index\model\ContentModel();
            foreach ($flag as $k => $v) {
            	if ($v['jumpurl'] == '') {
	            	if ($v['area']) {
	            		$arealist = explode(",", $v['area']);
	            		foreach ($arealist as $k1 => $v1) {
	            			if ($v1) {
                                if ($v1 == '88888888') {
                                    $htmlurl = $indcon->getContentUrl($v);
                                    if (config('sys.url_model') == 3) {
                                        $htmlurl = $htmlurl.'html';
                                    }
                                    $urls[] = $htmlurl;
                                }else{
                                    $areadata = db('area')->where(['id'=>$v1])->find();
                                    if ($areadata) {
                                        $htmlurl = $indcon->getContentUrl($v,'',$areadata);
                                        if (config('sys.url_model') == 3) {
                                            $htmlurl = $htmlurl.'html';
                                        }
                                        $urls[] = $htmlurl;
                                    }
                                }
	            			}
	            		}
	            	}else{
	            		$htmlurl = $indcon->getContentUrl($v);
	                    if (config('sys.url_model') == 3) {
	                        $htmlurl = $htmlurl.'html';
	                    }
	                    $urls[] = $htmlurl;
	            	}
	            }
            }
            
            $api[] = trim(config('sys.seo_bdurl'));
            if (config('sys.seo_bdurl_ziurl')) {
                $ztsurl = config('sys.seo_bdurl_ziurl');
                $urlarr = explode("\n",$ztsurl);
                $api = array_merge($api, $urlarr);
            }
            $numb = 0;
            if ($urls) {
            	foreach ($api as $k => $v) {
	                $ch = curl_init();
	                $options =  array(
	                    CURLOPT_URL => $v,
	                    CURLOPT_POST => true,
	                    CURLOPT_RETURNTRANSFER => true,
	                    CURLOPT_POSTFIELDS => implode("\n", $urls),
	                    CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
	                );
	                curl_setopt_array($ch, $options);
	                $result = curl_exec($ch);
	                
	                $jg = json_decode($result, true);
	                if (isset($jg['error'])) {
	                    
	                }else{
	                    $success = $jg['success'] ? $jg['success'] : 0;
	                    $numb = $numb + $success;
	                }
	            }
            }
            return json_encode(['code' => 1, 'msg' => "成功推送：".$numb." 条URL"]);
        }else{
            return json_encode(['code' => 0, 'msg' => '请先开启百度自动推送']);
        }
    }
    public function version(){
        $version = include_once(ROOT_PATH.'version.php');
        echo $version['yunucms']['version'];
    }
    //获取百度统计URL
    public function getbdurl(){
    	if (config('sys.bdcx_url')) {
    		$res = ['status'=>1, 'data'=>config('sys.bdcx_url')]; 
    	}else{
    		$res = ['status'=>0, 'data'=>'']; 
    	}
    	return json_encode($res);
    } 
    //获取百度推送URL
    public function getbdtsurl(){
    	if (config('sys.seo_bdurl')) {
    		$res = ['status'=>1, 'data'=>config('sys.seo_bdurl')]; 
    	}else{
    		$res = ['status'=>0, 'data'=>'']; 
    	}
    	return json_encode($res);
    }
    //获取主站首页，主站栏目页，主站详情页，主站tag页，城市分站首页
    public function getsiteurl(){
    	try {
    		$category = new \app\admin\model\CategoryModel;
	        $content = new \app\admin\model\ContentModel;
	        $homecate = new \app\index\model\CategoryModel;
	        $homecon = new \app\index\model\ContentModel;
	        //index_list
	        $areahomelist = db('area')->where(['isopen'=>1,'isurl'=>0])->select();
	        $siteurl = config('sys.site_protocol')."://".config('sys.site_url');
	        //cateurl_list
	        $cateurl_list = [];

	        $catelist = $category->getAllcategory(); 
	        foreach($catelist as $k=>$v){
	            $cateurl = $homecate->getCategoryUrl($v);
	            $cateurl = $cateurl;
	            $cateurl_list[] = [
	                'cateurl' => $cateurl
	            ];
	        }
	        //conurl_list
	        $conurl_list = [];
	        $conlist = db("content")->where(['create_time' =>['LT', time()]])->orderRaw('create_time desc')->select();
	        foreach($conlist as $k1=>$v1){
	            if ($v1['jumpurl']) {
	                continue;
	            }

	            if ($v1['area']) {
	            	if ($v1['mainurl']) { //内容同步主站
				        $conurl = $homecon->getContentUrl($v1, '', [], false);
				        $conurl_list[] = [
		                    'title' => $v1['title'],
		                    'create_time' => $v1['create_time'],
		                    'seo_desc' => $v1['seo_desc'],
		                    'ys_conurl' => $conurl,
		                    'conurl' => $conurl
		                ];
	            	}else{
	            		$arealist = explode(",", $v1['area']);
		                foreach ($arealist as $k2 => $v2) {
		                    if ($v2) {
		                        $areadata = db('area')->where(['id'=>$v2, 'isopen'=>1,'isurl'=>0])->find();
		                        if ($areadata) {
		                            $conurl = $homecon->getContentUrl($v1, '', $areadata);
		                            $conurl = config('sys.url_model') == 3 ? $conurl.'html' : $conurl;

		                            $conurl_list[] = [
		                                'title' => $areadata['stitle'].$v1['title'],
		                                'create_time' => $v1['create_time'],
		                                'seo_desc' => $v1['seo_desc'],
		                                'ys_conurl' => $conurl,
		                                'conurl' => $conurl
		                            ];
		                        }else{
		                            if ($v2 == '88888888') {
		                                $indexurl = $homecon->getContentUrl($v1);
		                                $indexurl = config('sys.url_model') == 3 ? $indexurl.'html' : $indexurl;

		                                $conurl_list[] = [
		                                    'title' => $v1['title'],
		                                    'create_time' => $v1['create_time'],
		                                    'seo_desc' => $v1['seo_desc'],
		                                    'ys_conurl' => $indexurl,
		                                    'conurl' => $indexurl
		                                ];
		                            }
		                        }
		                    }
		                }
	            	}
	                
	            }else{
	                $indexurl = $homecon->getContentUrl($v1);
	                $indexurl = config('sys.url_model') == 3 ? $indexurl.'html' : $indexurl;

	                $conurl_list[] = [
	                    'title' => $v1['title'],
	                    'create_time' => $v1['create_time'],
	                    'seo_desc' => $v1['seo_desc'],
	                    'ys_conurl' => $indexurl,
	                    'conurl' => $indexurl
	                ];
	            }
	        }
	        
	        //txt
	        $urllist[] = $siteurl;
	        foreach ($areahomelist as $k => $v) {
	        	$areahomeurl = getHomeurl($v);
	            $urllist[] = $areahomeurl;
	        }
	        foreach ($cateurl_list as $k => $v) {
	        	$urllist[] = $v['cateurl'];
	        }
	        foreach ($conurl_list as $k => $v) {
	            $urllist[] = $v['ys_conurl'];
	        }
	        $taglist = db('tagurl')->select();
	        foreach ($taglist as $k => $v) {
	        	if (config('sys.url_model') == 1) {
	        		$urllist[] = config('sys.site_protocol')."://".config('sys.site_url')."/index.php?s=index/tag/index&title=".$v['tagurl'];
	        	}else{
	        		$urllist[] = config('sys.site_protocol')."://".config('sys.site_url')."/tag/".$v['tagurl'];
	        	}
	            
	        }
	        return json_encode(['code' => 1, 'data' => $urllist, 'msg' => '获取成功']);
    	} catch (Exception $e) {
    		return json_encode(['code' => 0,  'msg' => '获取失败']);
    	}
    }
    public function checkrequest(){
        $encrypt = input('encrypt');
        $html = send_post("http://control.yunucms.com/Index/Api/cms_login_check", ['encrypt'=>$encrypt,'host'=>config('sys.site_url')]);
        if ($html) {
            $html = json_decode($html, true);
            if ($html['result'] == 1) {
                return true;
            }
        }
        return false;
    }
}