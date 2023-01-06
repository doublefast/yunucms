<?php
namespace app\index\controller;
use app\index\model\ContentModel;
use app\index\model\CategoryModel;
use think\Db;

class Show extends Common
{
	public function index(){
		$id = input('id');
		$etitle = input('etitle', '', 'trim');
		$ctitle = input('ctitle', '', 'trim');
		$cw = input('cw', '', 'trim');
		if (is_numeric($etitle)) {
			$id = (int)$etitle;
		}
		if (empty($id) && empty($etitle)) {
			$this->error('参数错误'); exit();
		}
		if ($etitle) {
			$where = ['etitle'=>$etitle];
		}
		if ($id) {
			$where = ['id'=>$id];
		}

		$content = db('content')->where($where)->find();
		if (empty($content)) {
			abort(404); exit();
		}

		if ($ctitle) {
			$categoryinfo = db('category')->where(['etitle'=>$ctitle])->find();
			if (!$categoryinfo) {
				abort(404); exit();
			}
			if ($content['cid'] != $categoryinfo['id']) {
				abort(404); exit();
			}
		}
		
		$conmodel = new ContentModel();
		$content = $conmodel->getContentByCon($content);
		if ($cw && config("sys.seo_cwkeyword")) {
			$encode = mb_detect_encoding($cw, array("ASCII",'UTF-8',"GB2312","GBK",'BIG5')); 
			$cw = mb_convert_encoding($cw, 'UTF-8', $encode);

			$iscwok = true;
			$cwlist = explode(",", config("sys.seo_cwkeyword"));
			$ctlist = explode(",", config("sys.seo_ctkeyword"));
			
			$checktitle = session('sys_areainfo') ? session('sys_areainfo')['title'].$content['title'] : $content['title'];
			foreach ($cwlist as $k => $v) {
				if ($cw == $checktitle.$v || $cw == $content['title'].$v) {
					$iscwok = false;
				}
				foreach ($ctlist as $k1 => $v1) {
					if ($cw == $v1.$checktitle.$v || $cw == $v1.$content['title'].$v) {
						$iscwok = false;
					}
				}
			}
			foreach ($ctlist as $k => $v) {
				if ($cw == $v.$checktitle || $cw == $v.$content['title']) {
					$iscwok = false;
				}
			}
			if ($iscwok) {
				abort(404); exit();
			}
		}
		db('content')->where(['id'=>$content['id']])->setInc('click');//增加浏览
		//显示静态
		$confilename = $cw ? $content['id']."_".substr(md5($cw), 8, 16) : $content['id'];
		$htmlfilename = session('sys_areainfo') ? $confilename."_".session('sys_areainfo')['etitle'] : $confilename;
		$htmlfilestr = "./caches/content/".$htmlfilename.".html";
		if (file_exists($htmlfilestr)) {
	        if ((date('d', filemtime($htmlfilestr)) != date('d', time())) && (config('sys.indexhtml_time') < date('H:i:s',time()))) {
	            unlink($htmlfilestr);
	        }else{
	            return $this->fetch($htmlfilestr); exit();
	        }
		}

	    if ($content['area'] != '') {
	    	$area = session('sys_areainfo');
	    	if ($area) {
	    		if (!strstr($content['area'], ','.$area['id'].',') || $content['mainurl']) {
		    		$this->error('当前内容所属区域不正确，无法显示'); exit();
		    	}
	    	}else{
	    		if (!strstr($content['area'], ',88888888,') && !$content['mainurl']) {
	    			$this->error('当前内容所属区域不正确，无法显示'); exit();
	    		}
	    	}
	    }

		$catemodel = new CategoryModel();
		$category = $catemodel->getOneCategory($content['cid']);
		if (empty($category)) {
			abort(404); exit();
		}
		if ($category['tpl_show'] == '') {
			$this->error('模版不存在'); exit();
		}

		$content = $conmodel->getContentArea($content);
		if ($cw !== '') {
			if (is_numeric($cw)) {
				$cwkey = explode(',', config('sys.seo_cwkeyword'));
				$content['title'] = $content['title'].$cwkey[$cw];
			}else{
				$content['title'] = $cw;
			}
		}
		
		$prev = $conmodel->getContentPrev($category['id'], $content['id']);
		$next = $conmodel->getContentNext($category['id'], $content['id']);

		$content['prev'] = $prev['infostr'];
		$content['prevurl'] = $prev['infourl'];
		$content['prevtitle'] = $prev['infotitle'];

		$content['next'] = $next['infostr'];
		$content['nexturl'] = $next['infourl'];
		$content['nexttitle'] = $next['infotitle'];

		$content = update_str_dq($content, session('sys_areainfo'));

		//{标题名称}
		foreach ($content as $k1 => $v1) {
            $content[$k1] = str_replace('{标题名称}', $content['title'], $v1);;
        }
        $category['url'] = $catemodel->getCategoryUrl($category);
		$this->assign([
			'content' => $content,
			'category' => $category,
			'cid' => $category['id'],
			'parent' => $category['pid'] != 0 ? $catemodel->getOneCategory($category['pid']): null
		]);
		$tplfile = !empty($content['tpl_show']) && $content['tpl_show'] != "选择模板" ? $content['tpl_show'] : $category['tpl_show'];
		runhook('sys_index_category');
		/*if (config('sys.indexhtml')) {
			$dir = "./caches/content/";
		    if(!is_dir($dir)){
		        mkdir($dir, 0777, true);
		    }
	       	$info = $this->buildHtml($htmlfilename, $dir, $this->tpl_file.$tplfile);
		}*/
		return $this->fetch($this->tpl_file.$tplfile);
	}
	private function buildHtml($htmlfile='', $htmlpath='', $templateFile='') {
        $content = $this->fetch($templateFile);
        $htmlpath = !empty($htmlpath) ? $htmlpath : APP_PATH.'/html';
        $htmlfile = $htmlpath.$htmlfile.'.html';
        if(file_put_contents($htmlfile, $content) === false) {
            return false;
        } else {
            return true;
        }
    }
}

?>