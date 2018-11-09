<?php
namespace app\admin\controller;
use app\admin\model\AreaModel;
use think\Config;

class System extends Common
{
    public function basic()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            unset($param['file']);
            $param = add_slashes_recursive($param);

            $param['site_guide'] = array_key_exists("site_guide", $param) ? 1 : 0;
            $param['site_slide'] = array_key_exists("site_slide", $param) ? 1 : 0;

            setConfigfile($coffile, array_merge($conflist, $param));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        /*//获取模版列表
        $temp = getFileFolderList('./template' , 1);
        $templist = [];
        foreach ($temp as $k => $v) {
            if ($v != 'admin') {
                $file_path = "./template/".$v."/index.txt";
                $txt = "";
                if(file_exists($file_path)){
                    $txt = mb_convert_encoding(file_get_contents($file_path), 'utf-8', 'gbk');
                }
                $templist[] = ['name'=>$v, 'txt'=>$txt];
            }
        }

        $this->assign('templist', $templist);*/


        $indexdef = getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'index_default.html');
        $this->assign('indexdef', $indexdef);
        return $this->fetch();
    }

    //生成站点地图
    public function sitemap() {
        $siteurl = config('sys.site_protocol')."://".config('sys.site_url');
        $sitemap = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n";  
        //主页
        $sitemap .= "<url>\r\n"."<loc>".$siteurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
                
        $category = new \app\admin\model\CategoryModel;
        $content = new \app\admin\model\ContentModel;
        $homecate = new \app\index\model\CategoryModel;
        $homecon = new \app\index\model\ContentModel;

        $infolist = $category->getAllcategory(); 
        foreach($infolist as $k=>$v){
            $htmlurl = $homecate->getCategoryUrl($v);
            $sitemap .= "<url>\r\n"."<loc>".$htmlurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".date('Y-m-d')."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
            
            $clist = $content->getContentByCid($v['id']);

            foreach($clist as $k1=>$v1){
            	if ($v1['area']) {
            		$arealist = explode(",", $v1['area']);
            		foreach ($arealist as $k2 => $v2) {
            			if ($v2) {

            				$areadata = db('area')->where(['id'=>$v2])->find();
            				if ($areadata) {
            					$htmlurl = $homecon->getContentUrl($v1,'',$areadata);
				                if (config('sys.url_model') == 3) {
				                    $htmlurl = $htmlurl.'html';
				                }
				                $htmlurl = str_replace("&", "&amp;", $htmlurl);
				                $sitemap .= "<url>\r\n"."<loc>".$htmlurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".$v1['create_time']."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
            				}
            			}
            		}
            	}else{
            		$htmlurl = $homecon->getContentUrl($v1);
	                if (config('sys.url_model') == 3) {
	                    $htmlurl = $htmlurl.'html';
	                }
	                $sitemap .= "<url>\r\n"."<loc>".$htmlurl."</loc>\r\n"."<priority>0.6</priority>\r\n<lastmod>".$v1['create_time']."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
            	}
                
            }
        } 
        $sitemap .= '</urlset>';       
        $file = fopen("sitemap.xml","w");

        fwrite($file,$sitemap);
        fclose($file);


        return $this->fetch();
    }

    public function seo()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            $param = add_slashes_recursive($param);
            $param['seo_area'] = array_key_exists("seo_area", $param) ? 1 : 0;
            setConfigfile($coffile, array_merge($conflist, $param));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        $area = new AreaModel();
        $nav = new \org\Leftnav;
        $arr = $area->getAllArea();
        $arealist = $nav::rule($arr);
        $this->assign('arealist', $arealist);
        return $this->fetch();
    }
    public function qiniu()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            $param = add_slashes_recursive($param);
            $param['qiniu'] = array_key_exists("qiniu", $param) ? 1 : 0;
            setConfigfile($coffile, array_merge($conflist, $param));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }
        return $this->fetch();
    }
}
