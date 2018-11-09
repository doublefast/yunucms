<?php
namespace app\admin\controller;
use think\Controller;
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
    if (config('sys.qiniu')) {
      try {
        require_once  ROOT_PATH.'app/extend/Qiniu/autoload.php';
        $file = request()->file(input('file'));
        $filePath = $file->getRealPath();
        $ext = pathinfo($file->getInfo('name'), PATHINFO_EXTENSION);  //后缀
        // 上传到七牛后保存的文件名
        $key =substr(md5($file->getRealPath()) , 0, 5). date('YmdHis') . rand(0, 9999) . '.' . $ext;

        // 需要填写你的 Access Key 和 Secret Key
        $accessKey = config('sys.qiniu_accesskey');
        $secretKey = config('sys.qiniu_secretkey');
        $auth = new Auth($accessKey, $secretKey);
        $bucket = config('sys.qiniu_bucket');
        $domain = config('sys.qiniu_domain');
        $token = $auth->uploadToken($bucket);

        $uploadMgr = new UploadManager();
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
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
      $file = request()->file(input('file'));
      $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH.'uploads/image/');
      if($info){
        $fileinfo = $info->getInfo();
        $res['name'] = mb_substr($fileinfo['name'], 0,  -4, "UTF-8"); 
        $res['status'] = 1;
        $res['image_name'] = '/uploads/image/'.str_replace("\\", "/", $info->getSaveName());
      }else{
        $res['status'] = 0; 
        $res['error_info'] = $file->getError();
      }
    }
    return json_encode($res);
  }

  //文件上传
  public function uploadfile(){
    if (config('sys.qiniu')) {
      require_once  ROOT_PATH.'app/extend/Qiniu/autoload.php';
      $file = request()->file(input('file'));
      $filePath = $file->getRealPath();
      $ext = pathinfo($file->getInfo('name'), PATHINFO_EXTENSION);  //后缀
      // 上传到七牛后保存的文件名
      $key =substr(md5($file->getRealPath()) , 0, 5). date('YmdHis') . rand(0, 9999) . '.' . $ext;

      // 需要填写你的 Access Key 和 Secret Key
      $accessKey = config('sys.qiniu_ACCESSKEY');
      $secretKey = config('sys.qiniu_SECRETKEY');
      $auth = new Auth($accessKey, $secretKey);
      $bucket = config('sys.qiniu_BUCKET');
      $domain = config('sys.qiniu_DOMAIN');
      $token = $auth->uploadToken($bucket);
      $uploadMgr = new UploadManager();

      list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
      if ($err !== null) {
        $res['status'] = 0;
        $res['error_info'] = $err;
      } else {
        $res['name'] = mb_substr($file->getInfo('name'), 0,  -4, "UTF-8"); 
        $res['status'] = 1;
        $res['image_name'] = $domain . $ret['key'];
      }
    }else{
      $file = request()->file(input('file'));
      $info = $file->validate(['ext'=>'rar,zip,pdf,doc,docx,xls,xlsx'])->move(ROOT_PATH.'uploads/file/');
      if($info){
        $res['status'] = 1;
        $res['file_name'] = $info->getFilename();
        $res['file_path'] = '/uploads/file/'.str_replace("\\", "/", $info->getSaveName());
              
      }else{
        $res['status'] = 0;
        $res['error_info'] = $file->getError();
      }
    }
    return json_encode($res);
  }

  //文件/夹管理
  public function browsefile($spath = '', $stype = 'picture') {
    $spath = input('spath');
    $stype = input('stype');
    $docname = input('docname');

    $base_path = '/uploads/img';
    $enocdeflag = input('encodeflag', 0, 'intval');
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
    if ($enocdeflag) {
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
        if (in_array($ext, array('jpg','png','gif'))) {
          $list[$i]['isImg'] = 1;
        }
      }else {
        $url = url('upload/browsefile', array('docname' => $docname,'spath'=>base64_encode(rtrim($path,'/') . '/'. $list[$i]['filename']),'stype' => $stype, 'encodeflag' => 1 ));
      } 
      $list[$i]['url'] = $url;      
      $list[$i]['size'] = get_byte($list[$i]['size']);
    }
    //p($list);
    $parentpath = substr($path, 0, strrpos($path, '/'));

    $this->assign([
      'purl'=>  url('upload/browsefile', array('docname' => $docname,'spath'=> base64_encode($parentpath),'encodeflag' => 1, 'stype' => $stype)),
      'infolist'=> $list,
      'docname'=> $docname,
      'stype'=> $stype
    ]);
    return $this->fetch();
  }
}