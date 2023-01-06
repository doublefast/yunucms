<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class CategoryModel extends Model
{
    protected $name='category';
    
    public function getCategory($status = 0,$nav = 0, $isarea = true) {
	    if (!cache('catlist')) {
			$catlist = $this->orderRaw('sort asc')->select();
			cache('catlist', $catlist, 7200);
		}else{
			$catlist = cache('catlist');
		}
    	
	    if ($nav) {
		    $navlist = ($nav == 1 || $nav == 2) ? [$nav, 3] : [1, 2, 3]; 
	    }
	    
	    foreach ($catlist as $k => $v) {
	    	if ($status) {
		        if ($v['status'] != $status) {
		        	unset($catlist[$k]);
		        	continue;
		        }
		    }
		    if ($nav) {
		        if (!in_array($v['nav'], $navlist)) {
		        	unset($catlist[$k]);
		        	continue;
		        }
		    }

	    	$catlist[$k] = $this->getCategoryArea($v, [], $isarea);
	    }
	    return $catlist;
	}

	public function clearLink($cate) {
		$arr = array();
		foreach ($cate as $v) {
			if ($v['jumpurl'] != '') {
				$arr[] = $v;
			}
		}
		return $arr;		
	}
	//组成多维数组
	public function unlimitedForLayer($cate, $name = 'child', $pid = 0){
		$arr = array();
		foreach ($cate as $v) {
			if (is_array($pid)) {
				if (in_array($v['pid'], $pid)) {
					$v[$name] = $this->unlimitedForLayer($cate, $name, $v['id']);
					$arr[] = $v;
				}
			}else{
				if ($v['pid'] == $pid) {
					$v[$name] = $this->unlimitedForLayer($cate, $name, $v['id']);
					$arr[] = $v;
				}
			}
		}
		return $arr;
	}
	//获取指定分类的子集
	public function getChildsId($cate, $pid, $flag = 0) {
	    $arr = array();
	    if ($flag) {
	        $arr[] = $pid;
	    }
	    foreach ($cate as $v) {
	        if ($v['pid'] == $pid) {
	            $arr[] = $v['id'];
	            $arr = array_merge($arr, $this->getChildsId($cate, $v['id']));
	        }
	    }
	    return $arr;
	}
	
	//传递一个分类ID返回该分类相关信息
	public function getSelf($cate, $id) {
		$arr = array();
		foreach ($cate as $v) {
			if ($v['id'] == $id) {
				$arr = $v;
				return $arr;
			}
		}
		return $arr;
	}
	//传递一个子分类ID返回他的所有父级分类
	public function getParents($cate, $id) {
		$arr = array();
		foreach ($cate as $v) {
			if ($v['id'] == $id) {
				$arr[] = $v;
				$arr = array_merge($this->getParents($cate, $v['pid']), $arr);
			}
		}
		return $arr;
	}

	public function getCategoryUrl($cate, $area = [], $openarea = true) {
	    $url = '';
	    //如果是跳转，直接就返回跳转网址
	    if (!empty($cate['jumpurl'])) {
	    	if (substr($cate['jumpurl'], 0,1) == '@') {
	    		$cate = $this->getOneCategory(substr($cate['jumpurl'], 1));
	    	}else{
	    		return $cate['jumpurl'];
	    	}
	    }
	    $cname = $cate['etitle'] ? $cate['etitle'] : $cate['id'];
	    //是否要使用地区
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
	    		if (config('sys.sys_levelurl') == WAP_PRE) {
	    			$url = "/index.php?s=category/index&id=".$cate['id'];
	    		}else{
	    			$url = "/index.php?s=wap/category/index&id=".$cate['id'];
	    		}
	    		if ($area) {
		    		$url = $url. "&area=".$area['etitle'];
	    		}
	    		break;
	    	case '3'://伪静态
	    		$urlqz = config('sys.sys_levelurl') == WAP_PRE ? '' : '/m'; //url前缀
		        $url = $cate['etitle'] ? $cate['etitle'] : $cate['id'];
		        if ($area) {
		        	//集权模式
		    		if (strpos($url, '/')) {
		    			$url = str_replace_limit("/", "/".$area['etitle']."_", $url, 1);
		    		}else{
		    			$url = $area['etitle']."_".$url;
		    		}
		    		$url = $urlqz."/".$url.'/';
		    	}else{
		    		$url = $urlqz."/".$url.'/';
		    	}
	    		break;
	    }
	    return $url;
	}

	public function getOneCategory($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function getCategoryArea($cate, $area = [], $openarea = true)
    {
    	if (!$area) {
    		$area = session('sys_areainfo');
    	}

    	//同步主站URL
    	if ($cate['catmainurl']) {
			$cate['url'] = $this->getCategoryUrl($cate, [] , false);
        }else{
	        if ($area && $openarea) {
	        	$cate['ys_title'] = $cate['title'];
				$cate['title'] = $cate['isarea'] && $cate['areatitle'] ? $area['stitle'].$cate['title'] : $cate['title'];
	        }
	        $cate['url'] = $this->getCategoryUrl($cate, $area);
	    }

        $cate['target'] = $cate['target'] ? '_blank' : '_self';
		if (config('sys.wap_mip')) { 
			foreach ($cate as $k => $v) {
	            $cate[$k] = str_replace("<img", '<mip-img', $v);
	        }
	    }
        return $cate;
    }
    public function getListCategory($ids)
    {
    	return $this->where(['id'=>['IN', $ids]])->select();
    }
    public function getCatlist($cid, $type, $flag, $limit){
    	$cidarr = [];
		if($cid == -1){
			$cidarr[] = input('cid') ? input('cid') : 0;
		}else{
			if (strpos($cid, ',')) {
				$cidarr = explode(',', $cid); 
			}else{
				$cidarr[] = intval($cid);
			}
		}
		if ($type == 'current' && $cid) {
			$catlist = $this->getListCategory($cid);
		}else{
			$catlist = $this->getCategory(1);
			if ($flag == 0) {
				$catlist = $this->clearLink($catlist);//去除外部链接的栏目
			}
			//type为parent
			if ($type == 'parent') {
				$parent  = $this->getParents($catlist, $cidarr[0]);
				$catlist  = $this->unlimitedForLayer($catlist, 'child', $parent[0]['id']);

			}else{
				//type为top,忽略cid
				if($cid == 0 || $type == 'top') {
					$catlist  = $this->unlimitedForLayer($catlist);
				}else {
					
					if ($type == 'self') {
						//同级分类
						$pidarr = [];
						foreach ($cidarr as $k => $v) {
							$typeinfo = $this->getSelf($catlist, $v);
							if ($typeinfo) {
								$pidarr[] = $typeinfo['pid'];
							}
						}
						$catlist  = $this->unlimitedForLayer($catlist, 'child', $pidarr ? $pidarr : 0);
					}else {
						//son，子类列表
						$catlist  = $this->unlimitedForLayer($catlist, 'child', $cidarr);
					}
				}
			}
		}
		$limit_list = explode(',', $limit);
		$returncatlist = []; 
		foreach($catlist as $k => $v){
			if(count($limit_list) > 1){
				if(($k < intval($limit_list[0])) || ($k >= intval($limit_list[1])+intval($limit_list[0]))){
					continue;
				};
			} else{
				if($k >= $limit_list[0]) break;
			}
			$catlist[$k] = update_str_dq($v, session('sys_areainfo'));
			$returncatlist[] = $catlist[$k];
		}
		return json_encode($returncatlist);
    }
}