<?php
namespace org;
class leftnav{
	static public function rule($cate ,$lefthtml = '— — ', $pid=0 ,$lvl=0, $leftpin=0 ){
		$arr=array();
		foreach ($cate as $v){
			if($v['pid']==$pid){
				$v['lvl']=$lvl + 1;
				$v['leftpin']=$leftpin + $lvl*20;//左边距
				$v['lefthtml']=str_repeat($lefthtml,$lvl);
				$arr[]=$v;
				$arr= array_merge($arr,self::rule($cate,$lefthtml,$v['id'] ,$lvl+1, $leftpin+15));
			}
		}
		return $arr;
	}
}
?>