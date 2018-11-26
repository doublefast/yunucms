<?php
namespace org;
class leftnav{
	static public function rule($cate ,$lefthtml = '— — ', $pid=0 ,$lvl=0, $leftpin=0 ){
		$arr=array();
		foreach ($cate as $v){
			if($v['pid'] == $pid){
				$v['lvl'] = $lvl + 1;
				$v['leftpin'] = $leftpin + $lvl*10;//左边距
				$v['lefthtml'] = str_repeat($lefthtml,$lvl);
				$v['leftkong'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;',$lvl);
				$arr[] = $v;
				$arr = array_merge($arr,self::rule($cate,$lefthtml,$v['id'] ,$lvl+1, $leftpin+15));
			}
		}
		return $arr;
	}
}
?>