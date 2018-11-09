<?php
namespace app\admin\controller;
use app\admin\model\MediaModel;
use think\Config;
use think\Db;
use think\Session;
use think\Request;

class Datacount extends Common
{
	//百度统计
    public function baidutj() {
        return $this->fetch();
    }

    //主词监控
    public function pmjkhq() {
        $this->cloud = new \com\Cloud();
        //主词排名监控获取
        $mainkeywords = null;
        if (config('sys.api_pmjkhq')) {
            $mainkeywords = send_post($this->cloud->yunapiUrl().'/getMainKeywords', ['domain'=>config('sys.site_levelurl')]);
            $mainkeywords = $mainkeywords ? json_decode($mainkeywords, true) : null;
            if ($mainkeywords) {
                $mainkeywords = $mainkeywords['state'] == 1 ? $mainkeywords['data'][0] : null;
            }
        }
        
        $this->assign([
            'mainkeywords' => $mainkeywords,
        ]);
        return $this->fetch();
    }

    //媒体联盟
    public function medialm(){
        $media = new MediaModel(); 
        $domainid = $media->checkmedia(config('sys.api_mediaapikey') ? config('sys.api_mediaapikey') : '');
        if (!$domainid || !config('sys.api_media')) {
            return $this->fetch('mediaerror');
        }

        $gopage = input('gopage') ? input('gopage') : 1;
        $Nowpage = input('get.page') ? input('get.page') : 1;
        $type = input('type') ? input('type') : 0;

        $info = $media->getContentList($domainid, $Nowpage, 10, $type);
        $infolist = [];
        if ($info['status']) {
            $infolist = $info['info'];
            foreach ($infolist as $k => $v) {
                $stateval = '未审核';
                $stateval = $v['state'] == 1 ? '<font style="color:#0099cc;">审核通过</font>' : $stateval;
                $stateval = $v['state'] == 2 ? '<font style="color:red;">审核退回</font' : $stateval;
                $infolist[$k]['stateval'] = $stateval;
            }
        }
        $this->assign([
            'infolist' => $infolist,
            'count' => isset($info['count']) ? $info['count'] : 0,
            'Nowpage' => $Nowpage,
            'gopage' => $gopage,
            'type' => $type,
            'allpage' => isset($info['pagecount']) ? $info['pagecount'] : 0,
        ]);
        if(input('get.page')){
            return json($infolist);
        }
        return $this->fetch();
    }

    //基础信息编辑
    public function mediauser(){
        $media = new MediaModel(); 
        $domainid = $media->checkmedia(config('sys.api_mediaapikey') ? config('sys.api_mediaapikey') : '');
        if (!$domainid || !config('sys.api_media')) {
            return $this->fetch('mediaerror');
        }

        if(request()->isAjax()){
            $parem = input('post.');
            unset($parem['filelogo']);
            unset($parem['filewximg']);
            unset($parem['filebanner1']);
            unset($parem['filebanner2']);
            unset($parem['filebanner3']);

            $info = $media->setUserInfo($domainid, $parem); 
            return json($info);
        }

        $info = $media->getUserInfo($domainid); 

        $this->assign([
            'context' => $media->mediacon(1),
            'userinfo' => $info['status'] ? $info['userinfo'] : null,
        ]);
    	return $this->fetch();
    }

    //编辑媒体内容
    public function editmediacon(){
        $media = new MediaModel(); 
        $domainid = $media->checkmedia(config('sys.api_mediaapikey') ? config('sys.api_mediaapikey') : '');
        if (!$domainid || !config('sys.api_media')) {
            if(request()->isAjax()){
                return json(['code' => 0, 'msg' => '授权帐号未购买媒体联盟服务']);
            }else{
                return $this->fetch('mediaerror');
            }
        }
        if(request()->isAjax()){
            $parem = input('post.');
            
            $info = $media->setContent($domainid, $parem); 
            return json($info);
        }
        $conid = input('param.id');
        $info = $media->getContent($domainid, $conid); 

        if ($info['status']) {
            $this->assign([
                'infodata' => $info['info'],
            ]);
        }
        return $this->fetch();
    }

    //删除媒体内容
    public function delmediacon(){
        $media = new MediaModel(); 
        $domainid = $media->checkmedia(config('sys.api_mediaapikey') ? config('sys.api_mediaapikey') : '');
        if (!$domainid || !config('sys.api_media')) {
            return json(['code' => 0, 'msg' => '授权帐号未购买媒体联盟服务']);
        }

        $conid = input('param.ids');
        $info = $media->delContent($domainid, $conid); 
        return json(['code' => $info['status'], 'msg' => $info['msg']]);
    }

}
