<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class ContentModel extends Model
{
    protected $name='content';
    
    public function getContentByCon($con)
    {
        $diymodelmodel = new DiymodelModel();
        $tabname = $diymodelmodel->where(['id'=>$con['mid']])->value('tabname');
        $info = db('diy_'.$tabname)->where(['conid'=>$con['vid']])->find();

        if ($info) {
            $con = array_merge($con, $info);
        }
        $con = $this->getContentStr($con);
        return $con;
    }
    public function getContentStr($con)
    {
        $con['alltitle'] = $con['title'];
        $con['ys_title'] = $con['title'];

        foreach ($con as $k => $v) {
            if (config('sys.pc_mip')) { 
                $con[$k] = str_replace("<img", '<mip-img', $v);
            }
        }
        $con = update_str_dq($con, session('sys_areainfo')); //替换地区词
        return $con;
    }

    public function getContentArea($con, $area = [])
    {
        if (!$area) {
            $area = session('sys_areainfo');
        }
        if ($area) {
            $misarea = db('category')->where(['id'=>$con['cid']])->value('areacontitle');
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
                $con['url'] = $this->getContentUrl($con, '', [], false);
            }else{
                $con['url'] = $this->getContentUrl($con, '', $area);
                $con['title'] = $misarea ? $area['stitle'].$con['title'] : $con['title'];
            }
        }else{
             $con['url'] = $this->getContentUrl($con, '', $area);
        }

        return $con;
    }

    public function getTaglist(){
        $where['create_time'] = ['lt',time()];
        $where['tag'] = ['neq',''];

        $taglist = $this->where($where)->orderRaw('id desc')->column('tag');
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

    public function getContentPrev($cid, $id, $orderby = 'id'){
        $where['id'] = ['LT', $id];
        $where['cid'] = ['EQ', $cid];
        $where['create_time'] = ['LT', time()];
        //地区独立内容
        $area = session('sys_areainfo');
        if ($area) {
            $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,'.$area['id'].',%'],null, 'or'];
        }else{
            $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,88888888,%'],null, 'or'];
        }

        $info = $this->where($where)->orderRaw($orderby." desc")->find();
        
        if ($info) {
            $info = $this->getContentArea($info);
            $info['infourl'] = $info['url'];
            $info['infotitle'] = $info['title'];
            $info['infostr'] = "<a href='".$info['url']."'>".$info['title']."</a>";
        }else{
            $info['url'] = '';
            $info['title'] = '没有了';
            $info['infourl'] = '';
            $info['infotitle'] = '没有了';
            $info['infostr'] = '没有了';
        }
        return $info;
    }

    public function getContentNext($cid, $id, $orderby = 'id'){
        $where['id'] = ['GT', $id];
        $where['cid'] = ['EQ', $cid];
        $where['create_time'] = ['LT', time()];
        //地区独立内容
        $area = session('sys_areainfo');
        if ($area) {
            $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,'.$area['id'].',%'],null, 'or'];
        }else{
            $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,88888888,%'],null, 'or'];
        }
        $info = $this->where($where)->orderRaw($orderby.' asc')->find();
        if ($info) {
            $info = $this->getContentArea($info);
            $info['infourl'] = $info['url'];
            $info['infotitle'] = $info['title'];
            $info['infostr'] = "<a href='".$info['url']."'>".$info['title']."</a>";
        }else{
            $info['url'] = '';
            $info['title'] = '没有了';
            $info['infourl'] = '';
            $info['infotitle'] = '没有了';
            $info['infostr'] = '没有了';
        }
        return $info;
    }

    public function getContentUrl($con, $cw = '', $area = [], $openarea = true) {
	    $url = '';
	    //如果是跳转，直接就返回跳转网址
	    if (!empty($con['jumpurl'])) {
	        if (substr($con['jumpurl'], 0,1) == '@') {
                $catemodel = new CategoryModel();
                $cate = $catemodel->getOneCategory(substr($con['jumpurl'], 1));
                $cateurl = $catemodel->getCategoryUrl($cate);
                return $cateurl;
            }else{
                return $con['jumpurl'];
            }
	    }
	    $cate = db('category')->where(['id'=>$con['cid']])->find();
	    $cname = $cate['etitle'] ? $cate['etitle'] : $cate['id'];
        if ($openarea) {
            if (!$area) {
                $area = session('sys_areainfo');
            }
        }
        //默认地区修正
        if ($area && config('sys.seo_default_area') == $area['id']) {
            $area = null;
        }
	    switch (config('sys.url_model')) {
	    	case '1'://动态
                $urlqz = config('sys.wap_levelurl') ? WAP_PRE.".".config('sys.site_levelurl') : config('sys.site_url');//url前缀
                $urlcen = config('sys.wap_levelurl') ? '?s=' : '?s=wap/';//url前缀
	    		$cw = $cw !== '' ? "&cw=".$cw : $cw;
                $url = $urlqz."/index.php".$urlcen."show/index&id=".$con['id'].$cw;
                if ($area) {
    	    		$url = $url. "&area=".$area['etitle'];
                }
	    		break;
	    	case '3'://伪静态
                $urlqz = config('sys.wap_levelurl') ? WAP_PRE.".".config('sys.site_levelurl') : config('sys.site_url').'/m';
		        $cw = $cw !== '' ? "_".$cw : $cw;
                $url = $con['etitle'] ? $con['etitle'].$cw : $con['id'].$cw;
                if ($area) {
                    //集权模式
                    if (strpos($cname, '/')) {
                        $cname = str_replace_limit("/", "/".$area['etitle']."_", $cname, 1);
                    }else{
                        $cname = $area['etitle']."_".$cname;
                    }
    	    		$url = $urlqz."/".$cname.'/'.$url.".".config('url_html_suffix');
                }else{
                    $url = $urlqz."/".$cname."/".$url.".".config('url_html_suffix');
                }
	    		break;
	    }
        $url = config('sys.site_protocol')."://".$url;
	    return $url;
	}
    public function getContentlist($param){
        if($param['cid'] == -1) $param['cid'] = input('cid');
        if ($param['cid'] > 0 || substr($param['cid'], 0, 1) == '$') {
            $categorymodel = new CategoryModel();
            if (strpos($param['cid'], ',')) {
                $cidarr = explode(',', $param['cid']); 
                $ids = [];
                foreach ($cidarr as $k => $v) {
                    $ids = array_merge($ids, $categorymodel->getChildsId($categorymodel->getCategory(), $v, true));
                }
            }else{
                $ids = $categorymodel->getChildsId($categorymodel->getCategory(), $param['cid'], true);
            }
            $where = ['create_time' => ['LT', time()]];
            $where[] = function ($q) use($ids){
                $q->where(['cid' => ['IN', $ids]])->whereor("CONCAT(',',addcid,',') REGEXP CONCAT(',(',REPLACE('".implode(',', $ids)."',',','|'),'),')");
            };
        }else {
            $where = array('create_time' => array('LT', time()));
        }

        if ($param['keyword'] != -1) {
            $where['title'] = array('LIKE','%'.$param['keyword'].'%');
        }

        if ($param['flag']) {  
            $where['istop'] = $param['flag'];
        }
        if ($param['time']) {  
            $where['update_time'] = ['GT', time()-$param['time']];
        }
        if ($param['top']) {   
            $where['top'] = $param['top'];
        }
        if ($param['image'] != -1) {
            $where['pic'] = $param['image'] ? ['NEQ', ''] : ['EQ', ''];
        }
        
        if ($param['tag'] != -1) {
            $jgf = ',';
            $jgf = strpos($param['tag'], '，') ? '，' : $jgf;
            $taglist = explode($jgf, $param['tag']);
            if (count($taglist) > 1) {
                $tagarr = array();
                foreach ($taglist as $k => $v) {
                    $tagarr[] = ['LIKE','%'.$v.'%'];
                }
                $tagarr[] = 'or';
                $where['tag'] = $tagarr;
            }else{
                $where['tag'] = ['LIKE','%'.$param['tag'].'%'];
            }
        }
        $where['create_time'] = ['LT', time()];
        //地区独立内容
        if ($param['areaid']) {
            $arealist = explode(',', $param['areaid']);
            $areawhere = [];
            foreach ($arealist as $k => $v) {
                if ($v) {
                    $areawhere[] = ['LIKE','%,'.$v.',%'];
                }
            }
            if (count($areawhere) > 1) {
                $areawhere[] = 'or';
                $where['area'] = $areawhere;
            }else{
                $where['area'] = $areawhere[0];
            }
        }else{
            $area = session('sys_areainfo');
            if ($area) {
                $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,'.$area['id'].',%'],null, 'or'];
            }else{
                $where['area'] = [['eq',''],['eq',',,'],['LIKE','%,88888888,%'],null, 'or'];
            }
        }
        
        $wheresql = '';
        $pageurlarr = [];
        if ($param['sql'] != -1) {
            //拼接SQL语句
            $db = db('diyfield');
            $sqlstrlist = explode(" ", $param['sql']);
        
            $sqlstr = ' ';
            if ($sqlstrlist) {
                foreach ($sqlstrlist as $k1 => $v1) {
                    if (is_numeric($v1)) {
                        $fieldname = $db->where(['id'=>$v1])->value('field');
                        $newfieldname = isset($_GET[$fieldname]) ? $_GET[$fieldname] : '';

                        if ($newfieldname != '不限' && $newfieldname != '' && $newfieldname != ',不限') {
                            $filelist = explode(',', $newfieldname);
                            $instr = "";
                            foreach ($filelist as $k2 => $v2) {
                                if ($v2) {
                                    $instr = $instr ? $instr." OR (".$fieldname." LIKE '%".$v2."%')" : "(".$fieldname." LIKE '%".$v2."%')";
                                }
                            }
                            $sqlstr = $sqlstr."(".$instr.") ";
                        }else{
                            $sqlstr = $sqlstr."( 1 = 1 ) ";
                        }
                        $pageurlarr[$fieldname] = $newfieldname;
                        
                    }else{
                        if ($v1 == 'or') {
                            $sqlstr = $sqlstr."or ";
                        }
                        if ($v1 == 'and' ) {
                            $sqlstr = $sqlstr."and ";
                        }
                    }
                }
            }
            $wheresql = $sqlstr;
        }

        //获取模型别名
        $tabname = "";
        if ($param['cid'] != -1 && !empty($param['cid'])) {
            $tabname = db('category')->alias('cat')
                ->join(config('database.prefix').'diymodel'.' diy','cat.mid = diy.id')
                ->where(['cat.id'=>$param['cid']])
                ->value('tabname');
        }

        $page = "";//分页
        if ($param['pagesize'] > 0) {
            $pagearr = [];
            switch (config('sys.url_model')) {
                case '1'://动态
                    $parampage['s'] = request()->pathinfo();
                    $parampage = array_merge($parampage, request()->param());
                    $pagearr = ['query' => $parampage];
                    break;
                case '3'://伪静态
                    $pagearr = ['query' => []];
                    break;
            }
            $pagearr['var_link_rows'] = 7;
            //存在cid情况
            if ($tabname) {
                $infolist = db('content')
                ->alias('con')
                ->join(config('database.prefix').'diy_'.$tabname.' diy','con.vid = diy.conid')
                ->where($where)
                ->where($wheresql)
                ->orderRaw($param['orderby'])
                ->paginate($param['pagesize'], false, $pagearr);

            }else{
                $infolist = db('content')
                ->where($where)
                ->orderRaw($param['orderby'])
                ->paginate($param['pagesize'], false, $pagearr);
            }
            
            $page = $infolist->render();
            $page = preg_replace("#/([\d]*)page/#", '/page/', $page);
            //搜索组合参数
            if (config('sys.url_model') == 3 && $param['keyword'] && !isset($_GET['key']) && input('key')) {
                $page = str_replace("/page/", '/key/'.input('key').'/page/', $page);
            }
            if (config('sys.url_model') == 3 && $area) {
                if ($area['isurl'] == 0) {
                    //\$_ctitle = input('ctitle', '', 'trim');
                    //\$page = str_replace(\$_ctitle."/", \$_area['etitle'].'_'.\$_ctitle."/", \$page);
                }
            }
            if (!$param['pagecss']) {
                $page = preg_replace('#<style([\s\S]*)</style>#', "", $page);
            }

        }else {
            //存在cid情况
            if ($tabname) {
                $infolist = db('content')
                ->alias('con')
                ->join(config('database.prefix').'diy_'.$tabname.' diy','con.vid = diy.conid')
                ->where($where)
                ->where($wheresql)
                ->orderRaw($param['orderby'])
                ->limit($param['limit'])
                ->select();
            }else{
                $infolist = db('content')
                ->where($where)
                ->orderRaw($param['orderby'])
                ->limit($param['limit'])
                ->select();
            }
        }
        //组合筛选修改分页URL
        if ($pageurlarr) {
            $ljstr = config('sys.url_model') == '1' ? "&" : "?";
            $page = preg_replace('/href=[\'|\"](\S+)[\'|\"]/i', 'href=$1'.$ljstr.build_query($pageurlarr), $page);
        }
        foreach ($infolist as $k => $v) {
            $v = $this->getContentByCon($v);
            if($param['titlelen']) $v['title'] = str2sub($v['title'], $param['titlelen'], 0);
            $v = $this->getContentArea($v);
            $infolist[$k] = $v;
        }
        
        if (is_object($infolist)) {
            $infoarr = $infolist->toarray();
            $returndata = $infoarr['data'];
        }else{
            $returndata = $infolist;
        }
        return ['infolist'=>json_encode($returndata), 'page'=>json_encode($page)];
    }
    public function getContentCount($where)
    {
        return $this->where($where)->count();
    }
}