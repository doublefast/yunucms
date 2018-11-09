<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class MediaModel extends Model
{
    protected $yunurl = "http://www.yunucms.com/yunuapi";
    protected $feigeurl = "http://vip.fegyun.com/index.php/api";

    //获取通用内容
    public function mediacon($cid){
        $context = send_post($this->yunurl.'/getMediaCon', ['cid'=>$cid]);
        $context = $context ? json_decode($context, true) : null;
        $text = '';
        if ($context) {
            $text = $context['status'] ? $context['info'] : '';
        }
        return $text;
    }
    //验证用户服务是否已购买
    public function checkmedia($apikey){
        $this->cloud = new \com\Cloud();
        $mediainfo = send_post($this->yunurl.'/checkMedia', ['apikey'=>$apikey]);
        $mediainfo = $mediainfo ? json_decode($mediainfo, true) : null;

        $domainid = 0;
        if ($mediainfo) {
            $domainid = $mediainfo['status'] ? $mediainfo['domainid'] : 0;
        }
        return $domainid;
    }

    //设置用户信息
    public function setUserInfo($domainid, $data){
        $response = $this->getResponse($domainid);
        
        //更新资源文件URL
        $editpath = ['logo', 'wx_img', 'banner1', 'banner2', 'banner3'];
        foreach ($editpath as $k => $v) {
            $data[$v] = $this->editImgSrc($data[$v]);
        }
        $response = array_merge($response, $data);
        $info = send_post($this->feigeurl.'/setUserInfo', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '更新用户信息失败'];
        }
        return $info;
    }

    //获取用户信息
    public function getUserInfo($domainid){
        $response = $this->getResponse($domainid);

        $info = send_post($this->feigeurl.'/getUserInfo', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '获取用户信息失败'];
        }
        return $info;
    }

    //推送内容
    public function pushContent($domainid, $infolist){
    	if (!count($infolist)) {
    		$info = ['status' => 0, 'msg' => '推送内容不能为空'];
    		return $info;
    	}
        $response = $this->getResponse($domainid);

        foreach ($infolist as $k => $v) {
           $infolist[$k]['content'] = $this->editContent($v['content']);
        }
        $response = array_merge($response, ['info'=>$infolist]);

        $info = send_post($this->feigeurl.'/pushContent', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '媒体联盟推送失败'];
        }
        return $info;
    }

    //获取内容列表
    public function getContentList($domainid, $page = 1, $pnum = 20, $type = 0){
        $response = $this->getResponse($domainid);
        $rep = [
        	'page' => $page,
        	'pnum' => $pnum,
        	'type' => $type,
        ];
        $response = array_merge($response, $rep);

        $info = send_post($this->feigeurl.'/getContentList', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '获取媒体联盟内容失败'];
        }
        return $info;
    }

    //获取内容列表
    public function getContent($domainid, $conid){
        $response = $this->getResponse($domainid);
        $rep = [
            'conid' => $conid
        ];

        $response = array_merge($response, $rep);

        $info = send_post($this->feigeurl.'/getContent', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '获取媒体联盟内容失败'];
        }
        return $info;
    }

    //设置内容
    public function setContent($domainid, $condata){
        if (!count($condata)) {
            $info = ['status' => 0, 'msg' => '修改内容不能为空'];
            return $info;
        }
        $response = $this->getResponse($domainid);

        $condata['content'] = $this->editContent($condata['content']);

        $response = array_merge($response, $condata);

        $info = send_post($this->feigeurl.'/setContent', $response);

        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '修改媒体联盟内容失败'];
        }
        return $info;
    }

    //删除内容
    public function delContent($domainid, $conid){
        $response = $this->getResponse($domainid);
        $rep = [
        	'conid' => $conid
        ];
        $response = array_merge($response, $rep);

        $info = send_post($this->feigeurl.'/delContent', $response);
        $info = $info ? json_decode($info, true) : null;

        if (!$info) {
            $info = ['status' => 0, 'msg' => '删除推送内容失败'];
        }
        return $info;
    }

    public function getResponse($domainid){
        $timestamp = time();
        $response = [
            'domainid' => $domainid,
            'timestamp' => $timestamp,
            'code' => md5($timestamp.config('cloud.identifier')),
            'username' => config('cloud.identifier')
        ];
        return $response;
    }

    public function editContent($content){
        //更新资源文件路径
        $pattern="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";  
        preg_match_all($pattern, $content, $matchContent);  
        if ($matchContent[1]) {
            foreach ($matchContent[1] as $k => $v) {
                $newimgsrc = $this->editImgSrc($v);
                if ($newimgsrc != $v) {
                    $content = str_replace($v, $newimgsrc, $content);
                }
            }
        }
        return $content;
    }

    public function editImgSrc($imgsrc){
        if ($imgsrc && !stristr($imgsrc, 'http')) {
            $imgsrc = config('sys.site_protocol').'://'.config('sys.site_url').$imgsrc;
        }
        return $imgsrc;
    }

}