<?php
namespace app\admin\controller;
use think\Controller;
use think\Log;
use think\Config;
use app\admin\model\ContentModel;
use app\admin\model\CategoryModel;
use app\admin\model\AreaModel;

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
	    	return json_encode($data);
	    	exit();
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
	       		$param['istop'] = isset($param['flag']) ? 1 : 0;
	       		$param['mid'] = $cate['mid'];
	       		$param['content'] = htmlspecialchars_decode($param['content']);
	       		$param['create_time'] = isset($param['release_time']) ? date('Y-m-d H:i:s', $param['release_time']) : date('Y-m-d H:i:s', time());

	       		if ($param['oneimg']) {
	       			$param['pic'] = str2img($param['content']);
	       		}
	       		$content = new ContentModel();
	            $flag = $content->insertContent($param, $cate['mid']);

	            if ($flag['code']) {
	            	$data = ['state'=> 1, 'msg'=>'success'];
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
    	return json_encode($data);
	    exit();
    }

    //图片上传
  	public function imgupload(){
	  	if (request()->isPost()){
            $file = request()->file(input('file'));
            $info = $file->validate(['ext'=>config('sys.upload_image_ext'),'size'=>config('sys.upload_image_size') * 1024])->move(ROOT_PATH.'uploads/image/');
            if($info){
                $fileinfo = $info->getInfo();
                $res['name'] = mb_substr($fileinfo['name'], 0,  -4, "UTF-8"); 
                $res['status'] = 1;
                $res['image_name'] = '/uploads/image/'.str_replace("\\", "/", $info->getSaveName());


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
                            $res['name'] = mb_substr($file->getInfo('name'), 0,  -4, "UTF-8"); 
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

            }else{
                $res['status'] = 0; 
                $res['error_info'] = $file->getError();
            }
            return json_encode($res);
        }
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
        $areahomelist = db('area')->where(['isopen'=>1, 'isurl'=>1])->select();
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
                            $areadata = db('area')->where(['id'=>$v2,'isopen'=>1])->find();
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

  	public function upsitemap(){
  		$this->createSitemap();
    	$data = ['state'=> 1, 'msg'=>'SUCCESS'];
    	return json_encode($data);
  	} 

  	//更新站点地图
    public function createSitemap(){
    	$category = new \app\admin\model\CategoryModel;
        $content = new \app\admin\model\ContentModel;
        $homecate = new \app\index\model\CategoryModel;
        $homecon = new \app\index\model\ContentModel;
        //首页链接
        $areahomelist = db('area')->where(['isopen'=>1, 'isurl'=>1])->select();


        $siteurl = config('sys.site_protocol')."://".config('sys.site_url');
        //站点地图
        $sitemap = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n";  
        $sitemap .= "<url>\r\n"."<loc>".$siteurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";

        foreach ($areahomelist as $k => $v) {
        	$areahomeurl = getHomeurl($v);
        	$sitemap .= "<url>\r\n"."<loc>".$areahomeurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
        }

        $infolist = $category->getAllcategory(); 
        foreach($infolist as $k=>$v){
            $htmlurl = $homecate->getCategoryUrl($v);
            $sitemap .= "<url>\r\n"."<loc>".$htmlurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
            
            $clist = $content->getContentByCid($v['id'], true);

            foreach($clist as $k1=>$v1){
                if ($v1['area']) {
                    $arealist = explode(",", $v1['area']);
                    foreach ($arealist as $k2 => $v2) {
                        if ($v2) {
                            $areadata = db('area')->where(['id'=>$v2,'isopen'=>1])->find();
                            if ($areadata) {
                                $conurl = $homecon->getContentUrl($v1, '', $areadata);
                                if (config('sys.url_model') == 3) {
                                    $conurl = $conurl.'html';
                                }
                                $conurl = str_replace("&", "&amp;", $conurl);
                                $sitemap .= "<url>\r\n"."<loc>".$conurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".$v1['create_time']."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
                            }else{
                                if ($v2 == '88888888') {
                                    $conurl = $homecon->getContentUrl($v1);
                                    if (config('sys.url_model') == 3) {
                                        $conurl = $conurl.'html';
                                    }
                                    $sitemap .= "<url>\r\n"."<loc>".$conurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".$v1['create_time']."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
                                }
                            }
                        }

                    }
                }else{
                    $conurl = $homecon->getContentUrl($v1);
                    if (config('sys.url_model') == 3) {
                        $conurl = $conurl.'html';
                    }
                    $sitemap .= "<url>\r\n"."<loc>".$conurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".$v1['create_time']."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
                }
                
            }
        } 
        $sitemap .= '</urlset>';       
        $file = fopen("sitemap.xml","w");

        fwrite($file, $sitemap);
        fclose($file);

        //rss
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

        foreach($infolist as $k=>$v){
            $clist = $content->getContentByCid($v['id'], true);
            foreach($clist as $k1=>$v1){
                if ($v1['area']) {
                    $arealist = explode(",", $v1['area']);
                    foreach ($arealist as $k2 => $v2) {
                        if ($v2) {
                            $areadata = db('area')->where(['id'=>$v2,'isopen'=>1])->find();
                            if ($areadata) {
                                $conurl = $homecon->getContentUrl($v1, '', $areadata);
                                if (config('sys.url_model') == 3) {
                                    $conurl = $conurl.'html';
                                }
                                $conurl = str_replace("&", "&amp;", $conurl);

                                $rss .= "<item>\r\n";
                                $rss .= "<title><![CDATA[".$areadata['stitle'].$v1['title']."]]></title>\r\n";
                                $rss .= "<description><![CDATA[".$v1['seo_desc']."]]></description>\r\n";
                                $rss .= "<link><![CDATA[".$conurl."]]></link>\r\n";
                                $rss .= "<author><![CDATA[".config('sys.site_title')."]]></author>\r\n";
                                $rss .= "<pubDate><![CDATA[".$v1['create_time']."]]></pubDate>\r\n";
                                $rss .= "<category><![CDATA[]]></category>\r\n";
                                $rss .= "</item>\r\n";
                            }else{
                                if ($v2 == '88888888') {
                                    $indexurl = $homecon->getContentUrl($v1);
                                    if (config('sys.url_model') == 3) {
                                        $indexurl = $indexurl.'html';
                                    }

                                    $rss .= "<item>\r\n";
                                    $rss .= "<title><![CDATA[".$v1['title']."]]></title>\r\n";
                                    $rss .= "<description><![CDATA[".$v1['seo_desc']."]]></description>\r\n";
                                    $rss .= "<link><![CDATA[".$indexurl."]]></link>\r\n";
                                    $rss .= "<author><![CDATA[".config('sys.site_title')."]]></author>\r\n";
                                    $rss .= "<pubDate><![CDATA[".$v1['create_time']."]]></pubDate>\r\n";
                                    $rss .= "<category><![CDATA[]]></category>\r\n";
                                    $rss .= "</item>\r\n";
                                }
                            }
                        }
                    }
                }else{
                    $indexurl = $homecon->getContentUrl($v1);
                    if (config('sys.url_model') == 3) {
                        $indexurl = $indexurl.'html';
                    }

                    $rss .= "<item>\r\n";
                    $rss .= "<title><![CDATA[".$v1['title']."]]></title>\r\n";
                    $rss .= "<description><![CDATA[".$v1['seo_desc']."]]></description>\r\n";
                    $rss .= "<link><![CDATA[".$indexurl."]]></link>\r\n";
                    $rss .= "<author><![CDATA[".config('sys.site_title')."]]></author>\r\n";
                    $rss .= "<pubDate><![CDATA[".$v1['create_time']."]]></pubDate>\r\n";
                    $rss .= "<category><![CDATA[]]></category>\r\n";
                    $rss .= "</item>\r\n";

                }
                
            }
        } 
        

        $rss .= "</channel>\r\n";
        $rss .= "</rss>";
        $rssfile = fopen("rss.xml","w");

        fwrite($rssfile, $rss);
        fclose($rssfile);

        //txt
        $txt = "";

        //html
        $html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n";
        $html .= "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n";
        $html .= "<head>\r\n";
        $html .= "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n";
        $html .= "<title>html网站地图</title>\r\n";
        $html .= "</head>\r\n";
        $html .= "<body id=\"main_page\">\r\n";

        foreach ($areahomelist as $k => $v) {
        	$areahomeurl = getHomeurl($v);
        	$html .= "<li><a href='".$areahomeurl."' target='_blank'>".$v['title'].config('sys.site_title')."</a><span>".date('Y-m-d H:i:s')."</span></li>\r\n";
            $txt .= $areahomeurl."\r\n";
        }

        foreach($infolist as $k=>$v){
            $clist = $content->getContentByCid($v['id'], true);
            foreach($clist as $k1=>$v1){
                if ($v1['area']) {
                    $arealist = explode(",", $v1['area']);
                    foreach ($arealist as $k2 => $v2) {
                        if ($v2) {
                            $areadata = db('area')->where(['id'=>$v2,'isopen'=>1])->find();
                            if ($areadata) {
                            	$conurl = $homecon->getContentUrl($v1, '', $areadata);

                                if (config('sys.url_model') == 3) {
                                    $conurl = $conurl.'html';
                                }
                                $conurl = str_replace("&", "&amp;", $conurl);

                                $html .= "<li><a href='".$conurl."' title='".$areadata['stitle'].$v1['title']."' target='_blank'>".$areadata['stitle'].$v1['title']."</a><span>".$v1['create_time']."</span></li>\r\n";
                                $txt .= $conurl."\r\n";
                            }else{
                                if ($v2 == '88888888') {
                                    $conurl = $homecon->getContentUrl($v1);
                                    if (config('sys.url_model') == 3) {
                                        $conurl = $conurl.'html';
                                    }
                                    $html .= "<li><a href='".$conurl."' title='".$v1['title']."' target='_blank'>".$v1['title']."</a><span>".$v1['create_time']."</span></li>\r\n";
                                    $txt .= $conurl."\r\n";
                                }
                            }
                        }
                    }
                }else{
                    $conurl = $homecon->getContentUrl($v1);
                    if (config('sys.url_model') == 3) {
                        $conurl = $conurl.'html';
                    }
                    $html .= "<li><a href='".$conurl."' title='".$v1['title']."' target='_blank'>".$v1['title']."</a><span>".$v1['create_time']."</span></li>\r\n";
                    $txt .= $conurl."\r\n";
                }
                
            }
        } 

        $html .= "</body>\r\n";
        $html .= "</html>\r\n";

        $file = fopen("sitemap.htm","w");
        fwrite($file, $html);
        fclose($file);

        $file = fopen("sitemap.txt","w");
        fwrite($file, $txt);
        fclose($file);
    }
}
