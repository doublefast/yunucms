<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class ContentModel extends Model
{
    protected $name='content';
    
    public function getContentByCon($con)
    {
        $tabname = db('diymodel')->where(['id'=>$con['mid']])->value('tabname');
        $info = db('diy_'.$tabname)->where(['conid'=>$con['vid']])->find();
        return array_merge($con, $info);
    }

    public function getContentArea($con, $area = [])
    {
        if (!$area) {
            $area = config('sys.sys_area') ? db('area')->where(['etitle'=>config('sys.sys_area')])->find() : [];
        }
        if ($area) {
            $misarea = db('category')->where(['id'=>$con['cid']])->value('isarea');
            //$con['title'] = array_key_exists("ys_title", $con) ? $con['ys_title'] : $con['title'];

            $con['alltitle'] = array_key_exists("alltitle", $con) ? $con['alltitle'] : $con['title'];
            $con['alltitle'] = $misarea ? $area['stitle'].$con['alltitle'] : $con['alltitle'];

            $con['title'] = $misarea ? $area['stitle'].$con['title'] : $con['title'];
        }

        
		$con['url'] = $this->getContentUrl($con, '', $area);

        return $con;
    }

    public function getContentPrev($cid, $id){
    	$info = $this->where(['id'=>['LT', $id], 'cid'=>['EQ', $cid]])->order('id desc')->find();
    	$str = "";
    	if ($info) {
            $info = $this->getContentArea($info);
    		$str = "<a href='".$info['url']."'>".$info['title']."</a>";
    	}else{
    		$str = "没有了";
    	}
    	return $str;
    }

    public function getContentNext($cid, $id){
    	$info = $this->where(['id'=>['GT', $id], 'cid'=>['EQ', $cid]])->order('id asc')->find();
    	$str = "";
    	if ($info) {
            $info = $this->getContentArea($info);
    		$str = "<a href='".$info['url']."'>".$info['title']."</a>";
    	}else{
    		$str = "没有了";
    	}
    	return $str;
    	
    }

    public function getContentUrl($con, $cw = '', $area = []) {
	    $url = '';
	    //如果是跳转，直接就返回跳转网址
	    if (!empty($con['jumpurl'])) {
	        return $con['jumpurl'];
	    }
	    $cate = db('category')->where(['id'=>$con['cid']])->find();
	    $cname = $cate['etitle'] ? $cate['etitle'] : $cate['id'];
        if (!$area) {
            $area = config('sys.sys_area') ? db('area')->where('etitle', config('sys.sys_area'))->find() : [];
        }

	    switch (config('sys.url_model')) {
	    	case '1'://动态
                $urlqz = config('sys.sys_levelurl') == 'm' ? '' : '/wap'; //url前缀
	    		$cw = $cw !== '' ? "&cw=".$cw : $cw;
                $url = "/index.php".$urlqz."/show/index?id=".$con['id'].$cw;
                if ($area) {
    	    		$url = $url. "&area=".$area['etitle'];
                }
	    		break;
	    	case '3'://伪静态
                $urlqz = config('sys.sys_levelurl') == 'm' ? '' : '/m'; //url前缀
		        $cw = $cw !== '' ? "_".$cw : $cw;
                $url = $con['etitle'] ? $con['etitle'].$cw : $con['id'].$cw;
                if ($area) {
    	    		$url = $urlqz."/".$area['etitle']."_".$cname.'/'.$url.".".config('url_html_suffix');
                }else{
                    $url = $urlqz."/".$cname."/".$url.".".config('url_html_suffix');
                }
	    		break;
	    }
	    return $url;
	}
}