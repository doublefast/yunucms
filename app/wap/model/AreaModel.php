<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class AreaModel extends Model
{
    protected $name='area';
    
    public function getAreaUrl($area) {
	    $url = '';
	    switch (config('sys.url_model')) {
	    	case '1'://动态
	    		if (config('sys.sys_levelurl') == WAP_PRE) {
	    			$url = "/index.php?area=".$area['etitle'];
	    		}else{
	    			$url = "/index.php?s=wap&area=".$area['etitle'];
	    		}
	    		break;
	    	case '3'://伪静态
	    		$urlqz = config('sys.sys_levelurl') == WAP_PRE ? '' : '/m'; //url前缀
	    		$url = $urlqz.'/'.$area['etitle'].".html";
	    		break;
	    }
	    return $url;
	}
	public function getDefArea(){
		if (!cache('defareaetitle')) {
			$etitle = $this->where(['id'=>config('sys.seo_default_area')])->value('etitle');
			cache('defareaetitle', $etitle, 7200);
		}else{
			$etitle = cache('defareaetitle');
		}
		return $etitle;
	}

	public function getInfo($where=[], $field='*'){
        return $this->where($where)->field($field)->find();
    }
}