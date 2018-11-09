<?php
namespace app\index\model;
use think\Model;
use think\Db;

class ContentModel extends Model
{
    protected $name='content';
    
    public function getContentByCon($con)
    {
        $tabname = db('diymodel')->where(['id'=>$con['mid']])->value('tabname');
        $info = db('diy_'.$tabname)->where(['conid'=>$con['vid']])->find();
        
        if ($info) {

            $con = array_merge($con, $info);
        }
        foreach ($con as $k => $v) {
            $con[$k] = disablewords($v);//替换禁用词 
        }
        return $con;
    }

    public function getContentArea($con, $area = [])
    {
        if (!$area) {
            $area = session('sys_areainfo');
        }
        if ($area ) {
            $misarea = db('category')->where(['id'=>$con['cid']])->value('isarea');
            //$con['title'] = array_key_exists("ys_title", $con) ? $con['ys_title'] : $con['title'];

            $con['alltitle'] = array_key_exists("alltitle", $con) ? $con['alltitle'] : $con['title'];
            $con['alltitle'] = $misarea ? $area['stitle'].$con['alltitle'] : $con['alltitle'];

            //地区分站下情况
            $mainurlopen = false;
            if (!config('sys.seo_default_area')) { //未设置默认地区情况下启用
                $areastr = isset($con['area']) ? $con['area'] : '';
                if (!$areastr || $areastr == ',,') {
                    //不存在地区
                    $mainurlopen = true;
                }else{
                    if (strstr($areastr, ',88888888,')) {
                        $mainurlopen = true;
                    }
                }
            }

            if ($mainurlopen && $con['mainurl']) {
                $con['url'] = $this->getYsContentUrl($con);
            }else{
                $con['url'] = $this->getContentUrl($con, '', $area);
                $con['title'] = $misarea ? $area['stitle'].$con['title'] : $con['title'];
            }
        

        }else{
            $con['url'] = $this->getContentUrl($con, '', $area);
        }
        return $con;
    }

    public function getContentPrev($cid, $id){
        $where['id'] = ['LT', $id];
        $where['cid'] = ['EQ', $cid];
        $where['create_time'] = ['LT', time()];
        //地区独立内容
        $area = session('sys_areainfo');
        if ($area) {
            $where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,'.$area['id'].',%'], 'or'];
        }else{
            $where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,88888888,%'], 'or'];
        }

    	$info = $this->where($where)->order('id desc')->find();
    	$infojg = [
            'infourl'   => '',
            'infotitle'   => '没有了',
            'infostr'   => '没有了'
        ];
    	if ($info) {
            $info = $this->getContentArea($info);
            $infojg = [
                'infourl'   => $info['url'],
                'infotitle'   => $info['title'],
                'infostr'   => "<a href='".$info['url']."'>".$info['title']."</a>",
            ];
    	}
    	return $infojg;
    }
    public function getTaglist(){
        $where['create_time'] = ['lt',time()];
        $where['tag'] = ['neq',''];

        $taglist = $this->where($where)->order('id desc')->column('tag');
        $tagstr = [];
        $tagnum = [];
        foreach ($taglist as $k => $v) {
            $jgf = ',';
            $jgf = strpos($v, '，') ? '，' : $jgf;
            $strlist = explode($jgf, $v);
            foreach ($strlist as $k1 => $v1) {
                if (in_array($v1, $tagstr)) {
                    $tagnum[array_search($v1, $tagstr)] =  $tagnum[array_search($v1, $tagstr)] + 1;
                }else{
                    $tagstr[] = $v1;
                    $tagnum[] = 1;
                }
            }
        }
        $infolist = [];
        foreach ($tagstr as $k => $v) {
            $infolist[] = ['title'=>$v, 'num'=>$tagnum[$k]];
        }
        array_multisort($tagnum, SORT_DESC, $infolist);//二维排序
        return $infolist;
    }
    public function getContentNext($cid, $id){
        $where['id'] = ['GT', $id];
        $where['cid'] = ['EQ', $cid];
        $where['create_time'] = ['LT', time()];
        //地区独立内容
        $area = session('sys_areainfo');
        if ($area) {
            $where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,'.$area['id'].',%'], 'or'];
        }else{
            $where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,88888888,%'], 'or'];
        }
    	$info = $this->where($where)->order('id asc')->find();
    	$infojg = [
            'infourl'   => '',
            'infotitle'   => '没有了',
            'infostr'   => '没有了'
        ];
    	if ($info) {
            $info = $this->getContentArea($info);
            $infojg = [
                'infourl'   => $info['url'],
                'infotitle'   => $info['title'],
                'infostr'   => "<a href='".$info['url']."'>".$info['title']."</a>",
            ];
    	}
    	return $infojg;
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
            $area = session('sys_areainfo');
        }

	    switch (config('sys.url_model')) {
	    	case '1'://动态
	    		$cw = $cw !== '' ? "&cw=".$cw : $cw;
                $url = "/index.php/index/show/index?id=".$con['id'].$cw;
                if ($area) {
    	    		if ($area['isurl']) {
    	    			$url = $area['etitle'].'.'.config('sys.site_levelurl').$url;
    	    		}else{
    	    			$url = config('sys.site_url').$url. "&area=".$area['etitle'];
    	    		}
                }else{
                    $url = config('sys.site_url').$url;
                }
	    		break;
	    	case '2'://静态
	    		# code...
	    		break;
	    	case '3'://伪静态
		        $cw = $cw !== '' ? "_".$cw : $cw;
                $url = $con['etitle'] ? $con['etitle'].$cw : $con['id'].$cw;
                if ($area) {
    		        if ($area['isurl']) {
    	    			$url = $area['etitle'].'.'.config('sys.site_levelurl').'/'.$cname.'/'.$url.".".config('url_html_suffix');
    	    		}else{
    	    			$url = config('sys.site_url')."/".$area['etitle']."_".$cname.'/'.$url.".".config('url_html_suffix');
    	    		}
                }else{
                    $url = config('sys.site_url')."/".$cname."/".$url.".".config('url_html_suffix');
                }
	    		break;
	    }
	    $url = config('sys.site_protocol')."://".$url;
	    return $url;
	}

    public function getYsContentUrl($con, $cw = '') {
        $url = '';
        //如果是跳转，直接就返回跳转网址
        if (!empty($con['jumpurl'])) {
            return $con['jumpurl'];
        }
        $cate = db('category')->where(['id'=>$con['cid']])->find();
        $cname = $cate['etitle'] ? $cate['etitle'] : $cate['id'];

        switch (config('sys.url_model')) {
            case '1'://动态
                $cw = $cw !== '' ? "&cw=".$cw : $cw;
                $url = "/index.php/index/show/index?id=".$con['id'].$cw;
                $url = config('sys.site_url').$url;
                break;
            case '2'://静态
                # code...
                break;
            case '3'://伪静态
                $cw = $cw !== '' ? "_".$cw : $cw;
                $url = $con['etitle'] ? $con['etitle'].$cw : $con['id'].$cw;
                $url = config('sys.site_url')."/".$cname."/".$url.".".config('url_html_suffix');
                break;
        }
        $url = config('sys.site_protocol')."://".$url;
        return $url;
    }
}