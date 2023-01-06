<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\File;
use think\Request;
use com\Dir;

use Qiniu\Auth as Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;

class Upload extends Common
{
	//图片上传
  	public function upload(){

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
            runhook('sys_admin_upload');
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
		   	}

	   	}else{
		    $res['status'] = 0; 
		    $res['error_info'] = $file->getError();
	    }
	    return json_encode($res);
	}
	//上传ico
	public function uploadico(){
	    $file = request()->file(input('file'));
	    $info = $file->validate(['ext'=>'ico'])->move(ROOT_PATH, 'favicon.ico');
	    if($info){
		    $fileinfo = $info->getInfo();
		    $res['name'] = ''; 
		 	$res['status'] = 1;
		    $res['image_name'] = '/favicon.ico';

	   	}else{
		    $res['status'] = 0; 
		    $res['error_info'] = $file->getError();
	    }
	    return json_encode($res);
	}

  	//文件上传
  	public function uploadfile(){
	    $file = request()->file(input('file'));
	    $info = $file->validate(['ext'=>config('sys.upload_file_ext'),'size'=>config('sys.upload_file_size')*1024])->move(ROOT_PATH.'uploads/file/');
	    if($info){
		    $res['status'] = 1;
		    $res['file_name'] = $info->getFilename();
		    $res['file_path'] = '/uploads/file/'.str_replace("\\", "/", $info->getSaveName()); 

		    if (config('sys.qiniu')) {
		    	try {
			      	require_once  ROOT_PATH.'app/extend/Qiniu/autoload.php';
			      	// 上传到七牛后保存的文件名
			      	$key = substr($res['file_path'], 1);

			      	// 需要填写你的 Access Key 和 Secret Key
			      	$accessKey = config('sys.qiniu_accesskey');
				    $secretKey = config('sys.qiniu_secretkey');
				    $auth = new Auth($accessKey, $secretKey);
				    $bucket = config('sys.qiniu_bucket');
				    $domain = config('sys.qiniu_domain');
				    $token = $auth->uploadToken($bucket);

				    $uploadMgr = new UploadManager();
			      	list($ret, $err) = $uploadMgr->putFile($token, $key, '.'.$res['file_path']);
			      	if ($err !== null) {
				        $res['status'] = 0;
				        $res['error_info'] = is_object($err) ? "七牛云配置异常，请检查" : $err ;
			      	} else {
				        $res['name'] = mb_substr($file->getInfo('name'), 0,  -4, "UTF-8"); 
				        $res['status'] = 1;
				        $res['file_path'] = $domain . $ret['key'];
			      	}
			    } catch (Exception $e) {
		        	$res['status'] = 0; 
		        	$res['error_info'] = '七牛云配置异常，请检查';
		        	return json_encode($res);
		      	}
	    	}
	    }else{
		    $res['status'] = 0;
		    $res['error_info'] = $file->getError();
	    }
	    return json_encode($res);
  	}

  	//文件/夹管理
  	public function browsefile($spath = '', $stype = 'picture') {
	    $spath = input('spath');
	    $stype = input('stype');
	    $docname = input('docname');
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
		        $url = rtrim($path,'/') . '/'. $list[$i]['filename'];
		        $ext = explode('.', $list[$i]['filename']);
		        $ext = end($ext);
		        if (in_array($ext, explode(',', config('sys.upload_file_ext')))) {
		          	$list[$i]['isImg'] = 1;
		        }
	      	}else {
	        	$url = url('upload/browsefile', array('docname' => $docname,'spath'=>base64_encode(rtrim($path,'/') . '/'. $list[$i]['filename']),'stype' => $stype, 'encodeflag' => 1, 'imgtype' => $imgtype ));
	      	} 
	      	$list[$i]['url'] = $url;      
	      	$list[$i]['size'] = get_byte($list[$i]['size']);
	    }
	    $last_names = _array_column($list, 'filename');
		array_multisort($last_names, SORT_DESC, $list);

	    $parentpath = substr($path, 0, strrpos($path, '/'));
	    $this->assign([
	      	'purl'=>  url('upload/browsefile', array('docname' => $docname,'spath'=> base64_encode($parentpath),'encodeflag' => 1, 'stype' => $stype, 'imgtype' => $imgtype)),
	      	'infolist'=> $list,
	      	'docname'=> $docname,
	      	'stype'=> $stype,
	      	'imgtype'=> $imgtype
	    ]);
	    return $this->fetch();
	}
	//站内图片管理
	public function filemanage(){
		ini_set('memory_limit','1028M');
		$inpis_use = input('is_use', 2);
		if (!cache('filelist')) {
			$filelist = getDir2('./uploads/');
			cache('filelist', $filelist, 7200);
		}else{
			$filelist = cache('filelist');
		}

		$filelistarr = [];
		//组合需检查的字符串
		$checkstr = implode(',', config('sys'));
		$Db = Db::connect();
        $tmp = $Db->query('SHOW TABLE STATUS');
        $infolist = array_map('array_change_key_case', $tmp);
        $tabval = "";
        foreach ($infolist as $k => $v) {
        	$tabval .= gettableval($v['name']);
        }
		$checkstr .= $tabval;

		foreach ($filelist as $k => $v) {
			$filenameall = str_replace("\\", "/", $v);
			$filenameall = str_replace("//", "/", $filenameall);
			$filename = basename($v);
			$is_use = strstr($checkstr, $filename) ? true : false;

			$pathinfo = pathinfo($filename);
			$fileext = strtolower($pathinfo['extension']);
			$filelistinfo = [
				'filenameall' => $filenameall,
				'filename' => $filename,
				'filectime' => date("Y-m-d H:i:s",filectime($v)),
				'filesize' => get_byte(filesize($v)),
				'is_use' => $is_use,
				'is_img' => strstr("|jpg|jpeg|png|gif|bmp", $fileext) ? true : false,
			];

			if ($inpis_use) {
				if ($inpis_use == 1 && $is_use) {
					$filelistarr[] = $filelistinfo;
				}
				if ($inpis_use == 2 && !$is_use) {
					$filelistarr[] = $filelistinfo;
				}
			}else{
				$filelistarr[] = $filelistinfo;
			}
		}
		$this->assign([
	      	'filelistarr'=> $filelistarr
	    ]);
		return $this->fetch();
	}
	public function delfile(){
		$ids = input('ids', "");
	    $filename = input('filename', "");
	    $filecount = 0;
	    dir_del(RUNTIME_PATH.'cache'.DS);
	    if ($ids) {
	    	$filelist = explode(',', $ids);
	    	$filecount = count($filelist)-1;
	    	foreach ($filelist as $k => $v) {
	    		$filename = urldecode($v);
	    		if ($v) {
	    			if ($this->checkfileok($filename) && file_exists($filename)) {
	    				unlink($filename);
	    				$filecount ++;
	    			}
	    		}
	    	}
	    }
	    if ($filename) {
	    	if ($this->checkfileok(urldecode($filename)) && file_exists(urldecode($filename))) {
	    		unlink(urldecode($filename));
	    		$filecount ++;
	    	}
	    }
	    return json(['code' => 1, 'data' => '', 'msg' => "成功删除 $filecount 个文件"]);
	}
	public function checkfileok($filename){
		$ext = pathinfo($filename, PATHINFO_EXTENSION);
		if (in_array($ext, ['php', 'lock', 'html', 'htm'])) {
			return false;
		}
		if (strpos($filename, "../")) {
			return false;
		}
		if (strpos($filename, "./uploads/") !== 0) {
			return false;
		}
		return true;
	}
}