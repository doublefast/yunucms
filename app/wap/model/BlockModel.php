<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class BlockModel extends Model
{
    protected $name='block';
    
	public function getInfodata($title){
		if (!cache('blocklist')) {
			$blockdata = $this->select();
			$blockdatalist = json_decode(json_encode($blockdata),true);
			$blocklist = [];
			foreach ($blockdatalist as $k => $v) {
				$blocklist[$v['title']] = $v;
			}
			cache('blocklist', $blocklist, 7200);
		}else{
			$blocklist = cache('blocklist');
		}
		return $blocklist[$title];
	}

	public function getBlock($name, $infolen, $textflag){
		$blockdata = $this->getInfodata($name);
		$blockdata = update_str_dq($blockdata, session('sys_areainfo'));
		$block_content = '';
		if ($blockdata) {
			if ($blockdata['type'] == 2) {
				if (!$textflag) {
					$block_content = '<img src="'. $blockdata['content'] .'" />';
				}else {
					$block_content = $blockdata['content'];
				}
			}else {
				if($infolen) {
					$block_content = str2sub(strip_tags($blockdata['content']), $infolen, 0);//清除html再截取
				}else {
					$block_content = $blockdata['content'];
				}
			}

			$blockurl = '';
			if (isset($blockdata['url']) && $blockdata['url']) {
				$blockurl = $blockdata['url'];
				if (substr($blockurl, 0,1) == '@') {
					$categorymodel = new CategoryModel();
		            $category = $categorymodel->getOneCategory(substr($blockurl, 1));
		            if ($category) {
		                $blockurl = $categorymodel->getCategoryUrl($category);
		            }
		        }
				$block_content= "<a href='".$blockurl."' target='_blank'>".$block_content."</a>";
			}
		}
		return $block_content;
	}
}