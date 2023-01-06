<?php
namespace app\admin\controller;
use app\admin\model\ContentModel;
use app\admin\model\CategoryModel;
use app\admin\model\DiyfieldModel;
use app\admin\model\AreaModel;
use think\Config;
use think\Db;
use Aip\AipNlp;

use Qiniu\Auth as Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;

class Content extends Common
{
    public function index()
    {
        $this->checkrecordapi();
    	$category = new CategoryModel();
        $content = new ContentModel();

        $allcate = $category->getAllcategory();

    	$cid = input('cid');
        $key = input('key');
        $gopage = input('gopage') ? input('gopage') : 1;

        $where = [];
        if($key && $key !== ""){
            $where['title'] =  ['like', "%$key%"];          
        }

        $cidlist = $category->getChildsId($allcate, $cid, 1);//构造包含子分类ID
        $where['cid'] = ['IN', $cidlist];  

        $Nowpage = input('get.page') ? input('get.page') : 1;
        $limits = config("sys.admin_list_rows") ? config("sys.admin_list_rows") : 10;//config("paginate.list_rows");
        $count = $content->getContentCount($where);// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面
        $infolist = $content->getContentByWhere($where, $Nowpage, $limits);      

        foreach($infolist as $k=>$v){
            $infolist[$k]['isyy'] = strtotime($v['create_time']) > time() ? 1 : 0;
            $infolist[$k]['time'] = date('Y-m-d', strtotime($v['create_time']));
            $infolist[$k]['gopage'] = $Nowpage;
            $cate = $category->getOneCategory($v['cid']);
            $infolist[$k]['ctitle'] = $cate['title'];
            $infolist[$k]['indexurl'] = $content->getHomeContentUrl($v);
        }  

    	$nav = new \org\Leftnav;
        $maincatlist = [];
        if (!$cid) {
            //内容主页面显示栏目分类
            $topcat = $category->getCategoryByPid(0);
            foreach ($topcat as $k => $v) {
                $v['concount'] = $content->getContentCount(['cid'=>$v['id']]);
                $maincat['parentcat'] = $v;
                $childcat = $nav::rule($allcate, '--', $v['id']);
                foreach ($childcat as $k1 => $v1) {
                    $childcat[$k1]['concount'] = $content->getContentCount(['cid'=>$v1['id']]);
                }
                $maincat['childcat'] = $childcat;
                $maincatlist[] = $maincat;
            }
        } 
        $catlist = $nav::rule($allcate);
        $cate = $category->getOneCategory($cid);
        $this->assign([
            'addcatelist' => $cate ? $category->getCategoryAddCon($cate['id'], $cate['mid']) : null,
        	'cate' => $cate ? $cate : ['id'=>0],
        	'catlist' => $catlist,
            'infolist' => $infolist,
            'Nowpage' => $Nowpage,
            'allpage' => $allpage,
            'count' => $count,
            'gopage' => $gopage,
            'maincatlist' => $maincatlist
       	]);
        runhook('sys_admin_content');
        if(input('get.page')){
            return json($infolist);
        }
        if ($cate && $cate['cover'] ) {
            return $this->fetch("./app/admin/view/content/editcontentcate.html");
        }else{
            return $this->fetch();
        }
        
    }

    public function getarea()
    {
        //获取开启独立内容地区列表
        $area = new AreaModel();
        $arealist = $area->getAllArea(['isopen'=>1]);
        $zhuzhan = [
            'pid' => '0',
            'iscon' => '1',
            'id' => '88888888',
            'title' => '主站',
            'stitle' => '主站'
        ];
        array_unshift($arealist, $zhuzhan);
        $arealist = $area->getAreaByCon($arealist);
        $html = "";
        $html .= '<ul>';
        if ($arealist) {
            $html .='<li>&nbsp;&nbsp;<button type="button" class="btn diqu_select">全选</button></li>';
            foreach ($arealist as $k => $v) {
                $html .='<li>';
                $vchk = $v['ischk'] ? "checked" : '';
                $html .='<label class="diqu_checkbox"><input type="checkbox" '.$vchk.' value="'.$v['id'].'" name="diqu[]" lay-ignore><i class="layui-icon">&#xe605;</i><span>'.$v['title'].'</span></label>';
                if ($v['node']) {
                    $html .= '<ul>';
                    foreach ($v['node'] as $k1 => $v1) {
                        $html .='<li>';
                        $v1chk = $v1['ischk'] ? "checked" : '';
                        $html .='<label class="diqu_checkbox"><input type="checkbox" '.$v1chk.' value="'.$v1['id'].'" name="diqu[]" lay-ignore><i class="layui-icon">&#xe605;</i><span>'.$v1['title'].'</span></label>';
                        if ($v1['node']) {
                            $html .= '<ul>';
                            foreach ($v1['node'] as $k2 => $v2) {
                                $v2chk = $v2['ischk'] ? "checked" : '';
                                $html .= '<label class="diqu_checkbox"><input type="checkbox" '.$v2chk .' value="'.$v2['id'].'" name="diqu[]" lay-ignore><i class="layui-icon">&#xe605;</i><span>'.$v2['title'].'</span></label>';
                            }
                            $html .= '</ul>';
                        }
                        $html .='</li>';
                    }
                    $html .= '</ul>';
                }
                $html .='</li>';
            }
        }
        $html .= '</ul>';
        echo $html;
    }
    public function baiduqc(){
        if(request()->isAjax()){
            $title = input('title');
            $content = new ContentModel();
            $flag = $content->baiduqc($title);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
    }

    public function wxcaiji(){
        if(request()->isAjax()){
            $wxurl = input('wxurl');
            if (config('sys.qiniu')) {
                header("Content-type:text/html;charset=utf-8");
                set_time_limit(1800);
                require_once  ROOT_PATH.'app/extend/Qiniu/autoload.php';
                // 需要填写你的 Access Key 和 Secret Key
                $accessKey = config('sys.qiniu_accesskey');
                $secretKey = config('sys.qiniu_secretkey');
                $auth = new Auth($accessKey, $secretKey);
                $bucket = config('sys.qiniu_bucket');
                $domain = config('sys.qiniu_domain');
                $bucketManager = new BucketManager($auth);

                $html = curl($wxurl);
                preg_match('/id="js_share_source".*?href="(.*?)"/i', $html, $match);
                if (!empty($match[1])) {
                    $match[1] = str_replace("http://", "https://", htmlspecialchars_decode($match[1]));
                    $html = curl($match[1]);
                }
                preg_match('/(?<=id="activity-name">).*?(?=<\/h2>)/is', $html, $match);
                if (empty($match[0])){
                    return json(['code' => 0, 'msg' => "获取微信文章标题Error"]);
                };
                $title = $match[0];
                preg_match('/(?<=id="js_content">).*?(?=<\/div>)/is', $html, $match);
                if (empty($match[0])){
                    return json(['code' => 0, 'msg' => "获取微信文章内容Error"]);
                };
                $content = $match[0];
                $content = preg_replace_callback(
                    '/(?<=data-src="|url\(&quot;).*?(?="|&quot;\))/i',
                    function ($matches) use ($bucketManager, $bucket, $domain) {
                        list($ret, $err) = $bucketManager->fetch($matches[0], $bucket, null);
                        if ($err !== null) {
                            return $matches[0];
                        } else {
                            return $domain.$ret['key'];
                        }
                    },
                    $content
                );
                $content = str_replace("data-src","src",$content);
                return json(['code' => 1, 'title' => trim($title), 'content' => $content]);
            }else{
                return json(['code' => 0, 'msg' => "请先开启七牛云配置"]);
            }
        }
    }

    public function addcontent()
    {
    	$category = new CategoryModel();
    	$diyfield = new DiyfieldModel();
        $area = new AreaModel();
    	$nav = new \org\Leftnav;
    	$cid = input('cid');
        $cate = $category->getOneCategory($cid);

        if(request()->isAjax()){
            $param = input('post.');
           	$content = new ContentModel();
            $flag = $content->insertContent($param, $cate['mid']);
            if ($flag['code'] == 1) {
                $sitemap_auto = config('sys.sitemap_auto') ? intval(config('sys.sitemap_auto')) : 0;
                if ($sitemap_auto) {
                    $api = new Api();
                    $api->createSitemap();
                }
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        $fieldlist = $diyfield->getAllDiyfield($cate['mid']);
        $fieldhtml = $this->fieldformat($fieldlist);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea(['isopen'=>1]);
        
        $zhuzhan = [
            'pid' => '0',
            'iscon' => '1',
            'id' => '88888888',
            'title' => '主站',
            'stitle' => '主站'
        ];
        array_unshift($arealist, $zhuzhan);

        $arealist = $area->getAreaByCon($arealist);
        $this->assign([
            'showfile' => getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'),
            'addcatelist' => $category->getCategoryAddCon($cate['id'], $cate['mid']),
        	'cate' => $cate,
        	'catlist' => $catlist,
        	'fieldhtml' => $fieldhtml,
            'arealist' => $arealist,
            'mainurl' => $cate['conmainurl'] ? 1 : 0,
       	]);
        return $this->fetch();
    }

    public function batchaddcontent()
    {
        $category = new CategoryModel();
        $diyfield = new DiyfieldModel();
        $content = new ContentModel();
        $area = new AreaModel();
        $nav = new \org\Leftnav;
        $cid = input('cid');
        $cate = $category->getOneCategory($cid);

        if(request()->isAjax()){
            $param = input();
            $imgarr = explode('***', $param['imglist']);
            $titlearr = explode('***', $param['titlelist']);
            $sortarr = explode('***', $param['sortlist']);
            $imgfield = $param['field'];
            unset($param['imglist']);
            unset($param['titlelist']);
            unset($param['sortlist']);
            unset($param['file']);
            unset($param['field']);
            $param['conid'] = null;
            foreach ($imgarr as $k => $v) {
                if ($v) {
                    $param[$imgfield] = $v;
                    $param['title'] = $titlearr[$k];
                    $param['sort'] = $sortarr[$k];
                    $content->insertContent($param, $param['mid']);
                }
            }

            return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加内容：'.(count($imgarr)-1).'个']);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $zhuzhan = [
            'pid' => '0',
            'iscon' => '1',
            'id' => '88888888',
            'title' => '主站',
            'stitle' => '主站'
        ];
        array_unshift($arealist, $zhuzhan);
        $arealist = $area->getAreaByCon($arealist);

        //获取图片字段
        $where = [
            'mid'   => $cate['mid'],
            'ftype' => ['IN','image,images']
        ];
        $imgfield = db('diyfield')->where($where)->select();
        $this->assign([
            'cate' => $cate,
            'catlist' => $catlist,
            'arealist' => $arealist,
            'imgfield' => $imgfield,
        ]);
        return $this->fetch();
    }
    public function editcontent()
    {
        $category = new CategoryModel();
        $diyfield = new DiyfieldModel();
        $content = new ContentModel();
        $area = new AreaModel();

        $nav = new \org\Leftnav;
        $id = input('id');
        $gopage = input('gopage') ? input('gopage') : 1;
        $info = $content->getOneContent($id);


        $cate = $category->getOneCategory($info['cid']);
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $content->editContent($param, $cate['mid']);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        $fieldlist = $diyfield->getAllDiyfield($cate['mid']);
        $fieldhtml = $this->fieldformat($fieldlist, $info);
        //获取开启独立内容地区列表
        $arealist = $area->getAllArea(['isopen'=>1]);

        $zhuzhan = [
            'pid' => '0',
            'iscon' => '1',
            'id' => '88888888',
            'title' => '主站',
            'stitle' => '主站'
        ];
        array_unshift($arealist, $zhuzhan);

        $arealist = $area->getAreaByCon($arealist, 0, $info['area']);
        $addcatelist = $category->getCategoryAddCon($cate['id'], $cate['mid']);
        if ($info['addcid']) {
            $addcidarr = explode(',', $info['addcid']);
            foreach ($addcatelist as $k => $v) {
                $addcatelist[$k]['idsel'] = in_array($v['id'], $addcidarr);
            }
        }
        $this->assign([
            'showfile' => getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'),
            'addcatelist' => $addcatelist,
            'info' => $info,
            'cate' => $cate,
            'catlist' => $catlist,
            'fieldhtml' => $fieldhtml,
            'arealist' => $arealist,
            'gopage' => $gopage
        ]);
        return $this->fetch();
    }
    
    public function sortcontent()
    {
        $id = input('param.id');
        $sort = input('param.sort');

        $flag = db('content')->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function statecontent()
    {
        $id = input('param.id');
        $db = Db::name('content');
        $istop =  $db->where(['id'=>$id])->value('istop');//判断当前状态
        if($istop == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['istop'=>0]);
            return json(['code' => 1, 'data' => '', 'msg' => '已关闭']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['istop'=>1]);
            return json(['code' => 0, 'data' => '', 'msg' => '已开启']);
        }
    }
    public function movecategory()
    {
        $ids = input('param.ids');
        $cid = input('param.cid');
        $db = Db::name('content');
        $flag = $db->where('id', 'IN', $ids."0")->setField(['cid'=>$cid]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
    public function movearea()
    {
        $ids = input('param.ids');
        $aid = input('param.aid');
        $aid = $aid ? ','.$aid.',' : '';
        $db = Db::name('content');
        $flag = $db->where('id', 'IN', $ids."0")->setField(['area'=>$aid]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function stateall()
    {
        $ids = input('param.ids');
        $istop = input('param.istop');
        $db = Db::name('content');

        $flag = $db->where('id', 'in', $ids."0")->setField(['istop'=>$istop]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function mainurl()
    {
        $ids = input('param.ids');
        $mainurl = input('param.mainurl');
        $db = Db::name('content');

        $flag = $db->where('id', 'in', $ids."0")->setField(['mainurl'=>$mainurl]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function baidu()
    {
        $ids = input('param.ids');
        $db = Db::name('content');

        if (config('sys.seo_bdurl')) {
            $flag = $db->where('id', 'in', $ids."0")->select();

            $urls = array();
            $indcon = new \app\index\model\ContentModel();
            foreach ($flag as $k => $v) {
            	if ($v['jumpurl'] == '') {
	            	if ($v['area']) {
	            		$arealist = explode(",", $v['area']);
	            		foreach ($arealist as $k1 => $v1) {
	            			if ($v1) {
                                if ($v1 == '88888888') {
                                    $htmlurl = $indcon->getContentUrl($v);
                                    if (config('sys.url_model') == 3) {
                                        $htmlurl = $htmlurl.'html';
                                    }
                                    $urls[] = $htmlurl;
                                }else{
                                    $areadata = db('area')->where(['id'=>$v1])->find();
                                    if ($areadata) {
                                        $htmlurl = $indcon->getContentUrl($v,'',$areadata);
                                        //$htmlurl = str_replace("&", "&amp;", $htmlurl);
                                        if (config('sys.url_model') == 3) {
                                            $htmlurl = $htmlurl.'html';
                                        }
                                        $urls[] = $htmlurl;
                                    }
                                }
	            			}
	            		}
	            	}else{
	            		$htmlurl = $indcon->getContentUrl($v);
	                    if (config('sys.url_model') == 3) {
	                        $htmlurl = $htmlurl.'html';
	                    }
	                    $urls[] = $htmlurl;
	            	}
	            }
            }
            
            $api[] = trim(config('sys.seo_bdurl'));
            if (config('sys.seo_bdurl_ziurl')) {
                $ztsurl = config('sys.seo_bdurl_ziurl');
                $urlarr = explode("\n",$ztsurl);
                $api = array_merge($api, $urlarr);
            }
            $numb = 0;
            foreach ($api as $k => $v) {
                $ch = curl_init();
                $options =  array(
                    CURLOPT_URL => $v,
                    CURLOPT_POST => true,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_POSTFIELDS => implode("\n", $urls),
                    CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
                );
                curl_setopt_array($ch, $options);
                $result = curl_exec($ch);
                
                $jg = json_decode($result, true);
                if (isset($jg['error'])) {
                    
                }else{
                    $success = $jg['success'] ? $jg['success'] : 0;
                    $numb = $numb + $success;
                }
            }
            return json(['code' => 1, 'data' => '', 'msg' => "成功推送：".$numb." 条URL"]);
        }else{
            return json(['code' => 0, 'data' => '', 'msg' => '请先设置百度主动推送API']);
        }

    }

    public function xzh()
    {
        $ids = input('param.ids');
        $tstype = input('param.tstype');
        $db = Db::name('content');

        if ($tstype == 1) {
            $api = trim(config('sys.seo_bdxzhurl'));
        }
        if ($tstype == 3) {
            $api = trim(config('sys.seo_bdmipurl'));
        }

        if ($api) {
            $flag = $db->where('id', 'in', $ids."0")->select();

            $urls = array();
            if (config('sys.seo_bdxzhtype') == 'wap') {
                $indcon = new \app\wap\model\ContentModel();
            }else{
                $indcon = new \app\index\model\ContentModel();
            }
            
            foreach ($flag as $k => $v) {
                if ($v['jumpurl'] == '') {
                    if ($v['area']) {
                        $arealist = explode(",", $v['area']);
                        foreach ($arealist as $k1 => $v1) {
                            if ($v1) {
                                if ($v1 == '88888888') {
                                    $htmlurl = $indcon->getContentUrl($v);
                                    if (config('sys.url_model') == 3) {
                                        $htmlurl = $htmlurl.'html';
                                    }
                                    $urls[] = $htmlurl;
                                }else{
                                    $areadata = db('area')->where(['id'=>$v1])->find();
                                    if ($areadata) {
                                        $htmlurl = $indcon->getContentUrl($v,'',$areadata);
                                        //$htmlurl = str_replace("&", "&amp;", $htmlurl);
                                        if (config('sys.url_model') == 3) {
                                            $htmlurl = $htmlurl.'html';
                                        }
                                        $urls[] = $htmlurl;
                                    }
                                }
                            }
                        }
                    }else{
                        $htmlurl = $indcon->getContentUrl($v);
                        if (config('sys.url_model') == 3) {
                            $htmlurl = $htmlurl.'html';
                        }
                        $urls[] = $htmlurl;
                    }
                }
            }
            
            
            $ch = curl_init();
            $options =  array(
                CURLOPT_URL => $api,
                CURLOPT_POST => true,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POSTFIELDS => implode("\n", $urls),
                CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
            );
            curl_setopt_array($ch, $options);
            $result = curl_exec($ch);
            
            $jg = json_decode($result, true);
            if (isset($jg['error'])) {
                return json(['code' => 0, 'data' => '', 'msg' => $jg['message']]);
            }else{
                if ($tstype == 1) {
                    $numb = isset($jg['success_daily']) ? $jg['success_daily'] : 0;
                    $pe = isset($jg['remain_daily']) ? $jg['remain_daily'] : 0;
                    return json(['code' => 1, 'data' => '', 'msg' => "当天已成功推送：".$numb." 条URL，当天剩余配额：".$pe." 条"]);
                }
                if ($tstype == 3) {
                    $numb = isset($jg['success_mip']) ? $jg['success_mip'] : 0;
                    $pe = isset($jg['reamin_mip']) ? $jg['reamin_mip'] : 0;
                    return json(['code' => 1, 'data' => '', 'msg' => "成功推送：".$numb." 条URL，剩余配额：".$pe." 条"]);
                }
            }
        }else{
            return json(['code' => 0, 'data' => '', 'msg' => '请先设置对应的推送API']);
        }

    }

    public function delContent()
    {
        $id = input('param.ids');
        $content = new ContentModel();
        $flag = $content->delContent($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function copyContent()
    {
        $id = input('param.ids');
        $content = new ContentModel();
        $flag = $content->copyContent($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function edittitle()
    {
        $id = input('param.id');
        $title = input('param.title');
        $db = Db::name('content');
        $flag = $db->where(['id'=>$id])->setField(['title'=>$title]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function createtag(){
        $id = input('param.ids');
        $content = new ContentModel();
        $flag = $content->createtag($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
    public function doaddcid(){
        $ids = input('param.ids');
        $addcidval = input('param.addcidval');
        $db = Db::name('content');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['addcid'=>$addcidval]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
    public function dotdk()
    {
        $ids = input('param.ids');
        $seo_title = input('param.seo_title');
        $seo_keywords = input('param.seo_keywords');
        $seo_desc = input('param.seo_desc');
        $db = Db::name('content');
        $flag = $db->where(['id'=>['IN', $ids]])->select();
        foreach ($flag as $k => $v) {
            $new_seo_title = str_replace("{内容名称}", $v['title'], $seo_title);
            $new_seo_keywords = str_replace("{内容名称}", $v['title'], $seo_keywords);
            $new_seo_desc = str_replace("{内容名称}", $v['title'], $seo_desc);
            $db->where(['id'=>$v['id']])->setField(['seo_title'=>$new_seo_title,'seo_keywords'=>$new_seo_keywords,'seo_desc'=>$new_seo_desc]);
        }
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
    public function dotag(){
        $ids = input('param.ids');
        $tag = input('param.inptag');
        $db = Db::name('content');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['tag'=>$tag]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
    public function showtitle()
    {   
        $cid = input('param.cid');
        $category = new CategoryModel();
        $content = new ContentModel();
        $allcate = $category->getAllcategory();
        $cidlist = $category->getChildsId($allcate, $cid, 1);//构造包含子分类ID
        $where['cid'] = ['IN', $cidlist];  
        $conlist = $content->getContentByWhere($where, 1, 10000); 
        $contxt = "";
        foreach ($conlist as $k => $v) {
            $contxt .= $v['title']."\r\n";
        }
        header("Content-type: application/octet-stream"); 
        header("Accept-Ranges: bytes"); 
        header("Content-Disposition: attachment; filename = keywords.txt");
        header("Expires: 0"); 
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0"); 
        header("Pragma: public"); 
        echo $contxt;
    }

    private function fieldformat($fiellist, $vallist = []){
    	$html = '';
    	$script = '';
    	$ueditor = '';
    	foreach ($fiellist as $k => $v) {
    		$req = $v['isnotnull'] ? 'lay-verify="required"' : "";
    		$val = array_key_exists($v['field'], $vallist) ? $vallist[$v['field']] : $v['defval'];
    		switch ($v['ftype']) {
    			case '------'://分组线
    				$html .= '<div class="title_bar mb20">'.$v['remark'].'</div>';
    				break;
    			case 'text'://单行文本
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<input class="layui-input" type="text" name="'.$v['field'].'" value="'.$val.'" placeholder='.$v['title'].' '.$req.'>';
			        $html .= '</div>';
			        $html .= '</div>';
    				break;
    			case 'textarea'://多行文本
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<textarea name="'.$v['field'].'" placeholder="'.$v['title'].'" class="layui-textarea w700" '.$req.'>'.$val.'</textarea>';
			        $html .= '</div>';
			        $html .= '</div>';
    				break;
    			case 'seditor'://简约文本编辑器
                    $html .= '<div class="layui-form-item layui-form-item-flex">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<script name="'.$v['field'].'" type="text/plain" id="'.$v['field'].'" '.$req.'>'.$val.'</script>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $ueditor .= 'UE.getEditor("'.$v['field'].'", option);';

                    break;
                case 'editor'://富文本编辑器
    				$html .= '<div class="layui-form-item layui-form-item-flex">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<script name="'.$v['field'].'" type="text/plain" id="'.$v['field'].'" '.$req.'>'.$val.'</script>';

                    if (config('sys.api_wyc') && config('sys.api_bdqc')) {
                    $html .= '<br/><a href="javascript:void(\'\');" class="wyc'.$v['field'].'"> -- 点击一键生成同义词 -- </a>';
                    }
                    $html .= '</div>';
                    $html .= '</div>';

                    $ueditor .= 'UE.getEditor("'.$v['field'].'", {initialFrameWidth:"100%"});';//{autoFloatEnabled:true}

                    //同义词
                    if (config('sys.api_wyc') && config('sys.api_bdqc')) {
                    $script .= '$(".wyc'.$v['field'].'").click(function(){';
                    $script .= '$.ajax({';
                    $script .= 'url: "http://tool.yunucms.com/Index/api/tongyici",';
                    $script .= 'type: "POST",';
                    $script .= 'data: {';
                    $script .= 'type: '.config('sys.wyc_type').',';
                    $script .= 'percent: '.config('sys.wyc_percent').',';
                    $script .= 'AipNlp_APP_ID: "'.config('sys.bdqc_appid').'",';
                    $script .= 'AipNlp_API_KEY: "'.config('sys.bdqc_apikey').'",';
                    $script .= 'AipNlp_SECRET_KEY: "'.config('sys.bdqc_arcretkey').'",';
                    $script .= 'content: UE.getEditor("'.$v['field'].'").getContent()';
                    $script .= '},';
                    $script .= '})';
                    $script .= '.done(function(res) {';
                    $script .= 'if (res.state == 200) {';
                    $script .= 'UE.getEditor("'.$v['field'].'").setContent(res.data);';
                    $script .= '}else{';
                    $script .= 'alert("同义词API错误："+res.msg);';
                    $script .= '}';
                    $script .= '});';
                    $script .= '});';
                    }

    				break;
    			case 'file'://附件
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<input class="layui-input" type="text" name="'.$v['field'].'" id="'.$v['field'].'" value="'.$val.'" placeholder="附件上传" '.$req.'>';
			        $html .= '</div>';
			       	$html .= '<input type="file" name="file'.$v['id'].'" lay-type="file" class="layui-upload-file" id="upload-file'.$v['id'].'">';
			        $html .= '</div>';

			        $script .= 'layui.upload({';
			        $script .= 'url: "'.url('Upload/uploadfile',['file'=>'file'.$v['id']]).'"';
			        $script .= ',title:"上传文件"';
			        $script .= ',elem: "#upload-file'.$v['id'].'"';
			        $script .= ',method: "post"';

			        $script .= ',ext: "'.str_replace(',','|',config('sys.upload_file_ext')).'"';
			        $script .= ',success: function(data){';
			        $script .= 'if(data.status == 1){';
			        $script .= '$("#'.$v['field'].'").val(data.file_path);';
			        $script .= '}else{';
			        $script .= 'alert(data.error_info);';
			        $script .= '}';
			        $script .= '}';
			        $script .= '});';
    				break;
    			case 'image'://图片
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input id="path'.$v['id'].'" class="layui-input" type="text" name="'.$v['field'].'" value="'.$val.'"><br>';
                    $html .= '<img id="img_path'.$v['id'].'" class="defimg" src="'.$val.'" onerror="javascript:this.style.display=\'none\';">';
                    $html .= '</div>';
                    $html .= '<div class="layui-input-inline w450">';
                    $html .= '<input type="button" rel="path'.$v['id'].'" value="选择站内图片" class="fl BrowerPicture file_btn" />';
                    $html .= '<div class="site-demo-upload upload-img fl ml5">';
                    $html .= '<div class="site-demo-upbar">';
                    $html .= '<input type="file" name="file" class="layui-upload-file" id="upload-image'.$v['id'].'">';
                    $html .= '</div>';
                    $html .= '</div>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $script .= 'layui.upload({';
                    $script .= 'url: "'.url('Upload/upload',['file'=>'file']).'"';
                    $script .= ',before: function(input){';
                    $script .= '}';
                    $script .= ',title:"上传图片"';
                    $script .= ',elem: "#upload-image'.$v['id'].'" ';
                    $script .= ',method: "post"';
                    $script .= ',ext: "'.str_replace(',','|',config('sys.upload_image_ext')).'"';
                    $script .= ',type:"images"';
                    $script .= ',success: function(data){';
                    $script .= 'if(data.status == 1){';
                    $script .= '$("#path'.$v['id'].'").val(data.image_name);';
                    $script .= '$("#img_path'.$v['id'].'").attr("src", data.image_name).show();';
                    $script .= '}else{';
                    $script .= 'alert(data.error_info);';
                    $script .= '}';
                    $script .= '}';
                    $script .= '});';

    				break;
                case 'images'://多图

                	$img_str = "";
                    if ($val) {
                        $imglist = explode('***', $val);
                        foreach ($imglist as $k1 => $v1) {
                            $img_str .= $v1 ? '<div class="picture_item"><img src="'.$v1.'" width="114" height="114"><div class="picture_del">删除</div><div class="picture_go_up">前移</div><input type="hidden" class="imgval'.$v['id'].'" value="'.$v1.'" /></div>' : "";
                        }
                    }

                	$html .= '<div class="layui-form-item">';
	            	$html .= '<label class="layui-form-label">'.$v['title'].'</label>';
	              	$html .= '<div class="layui-input-inline w700">';
                    $html .= '<input type="button" rel="imglist'.$v['id'].'" value="选择站内图片" class="fl BrowerPicture'.$v['id'].' file_btn mr10" style="height:35px;line-height:35px;" />';
                    $html .= '<input type="hidden" name="'.$v['field'].'" value="'.$val.'" id="imglist'.$v['id'].'">';
                    $html .= '<div id="upload_imagelist'.$v['id'].'" class="fl">上传多图</div>';
                    $html .= '<div style="clear:both;></div>';
					$html .= '<div class="picture_tip picture_tip'.$v['id'].'"></div>';
				    $html .= '<div id="picture_show'.$v['id'].'">'.$img_str.'</div>';
	                $html .= '</div>';
                    $html .= '</div>';

                    $script .= '$(".BrowerPicture'.$v['id'].'").on("click",function(){';
                    $script .= 'var path = "'.$v['id'].'";';
                    $script .= 'layer.open({';
                    $script .= 'type: 2,';
                    $script .= 'title: "选择站内图片",';
                    $script .= 'shadeClose: true,';
                    $script .= 'shade: false,';
                    $script .= 'anim: 2,';
                    $script .= 'area: ["750px", "350px"],';
                    $script .= 'content: ["'.url('upload/browsefile', array('stype' => 'picture','imgtype' => 'duoimg')).'&docname="+path]';
                    $script .= '});';
                    $script .= '});';

	                $script .= 'var picture_show'.$v['id'].' = $("#picture_show'.$v['id'].'");';
					$script .= 'var picture_tip'.$v['id'].' = $(".picture_tip'.$v['id'].'");';

                    $script .= 'var uploader = WebUploader.create({';
                    $script .= 'auto: true,';
                    $script .= 'swf:  "'.config('view_replace_str.__ADM_PUBLIC__').'/js/Uploader.swf",';
                    $script .= 'server: "'.url('Upload/upload',['file'=>'file']).'",';
                    $script .= 'pick: "#upload_imagelist'.$v['id'].'",';
                    $script .= 'accept:{';
                    $script .= 'title: "Images",';
                    $script .= 'extensions: "'.config('sys.upload_image_ext').'",';
                    $script .= 'mimeTypes: "image/"';
                    $script .= '},';
                    $script .= 'compress: false,';
                    $script .= 'resize: false,';
                    $script .= 'duplicate :true';
                    $script .= '});';
                                            
                    $script .= 'uploader.on( "uploadSuccess", function(file,data){';
                    $script .= 'if(data.status == 1){';
                    $script .= 'picture_tip'.$v['id'].'.html(""+ data.image_name +" 上传成功"); ';              
                    $script .= 'var img = data.image_name;';
                    $script .= 'picture_html= \'<div class="picture_item"><img src="\'+ img +\'" width="114" height="114"><div class="picture_del">删除</div><div class="picture_go_up">前移</div><input type="hidden" class="imgval'.$v['id'].'" value="\'+ img +\'" /></div>\';';
                    $script .= 'picture_show'.$v['id'].'.append(picture_html);';
                    $script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
                    $script .= '}else{';
                    $script .= 'alert(data.error_info);';
                    $script .= 'picture_tip'.$v['id'].'.html(data.state);';
                    $script .= '}';
                    $script .= '});';

        			$script .= '$("#picture_show'.$v['id'].'").on("mouseenter",".picture_item",function(){';
					$script .= '$(this).find(".picture_go_up").show();';
					$script .= '$(this).find(".picture_del").show();';
					$script .= '}).on("mouseleave",".picture_item",function(){';
					$script .= '$(this).find(".picture_go_up").hide();';
					$script .= '$(this).find(".picture_del").hide();';
					$script .= '}';
					$script .= '); ';

				    $script .= '$("#picture_show'.$v['id'].'").on("click",".picture_go_up",function () {';
				    $script .= 'var parent = $(this).parent();';
				    $script .= 'if (parent.index() == 0){';
				   	$script .= '}else{';
				  	$script .= 'parent.prev().before(parent);';
				   	$script .= '$(this).hide();';
				    $script .= 'parent.find(".picture_del").hide();';
				   	$script .= '}';
					$script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
				    $script .= '});';

				    $script .= '$("#picture_show'.$v['id'].'").on("click",".picture_del",function () {';
				   	$script .= 'var img = $(this).next().val();';
					$script .= '$(this).parent().remove();';
					$script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
					$script .= 'return;';
				    $script .= '});';

                    break;
    			case 'datetime'://日期和时间
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input class="layui-input" name="'.$v['field'].'" placeholder="'.$v['title'].'" value="'.$val.'" onclick="layui.laydate({elem: this, istime: true, format: \'YYYY-MM-DD hh:mm:ss\'})" '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'number'://数字
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input name="'.$v['field'].'" lay-verify="number" autocomplete="off" value="'.$val.'" placeholder="'.$v['title'].'" class="layui-input" type="text" style="width: 300px;" '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'radio'://单选按钮
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width:450px;">';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "checked" : '';
                        $html .= '<input type="radio" name="'.$v['field'].'" value="'.$v1.'" title="'.$v1.'" '.$check.'>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
                    
    				break;
    			case 'checkbox'://复选框
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-block" style="width:450px;">';

                    $a = 0;
                    $valarr = $val ? explode(',', $val) : [];
                    foreach ($values as $k1 => $v1) {
                        $check = in_array($v1, $valarr) ? 'checked' : '';
                        $html .= '<input type="checkbox" name="'.$v['field'].'['.$a.']" value="'.$v1.'" title="'.$v1.'"  '.$check.'/>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'select'://下拉框
    				$values = explode("\n", $v['values']);
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width: 300px">';
                    $html .= '<select data-val="true" name="'.$v['field'].'" '.$req.'>';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "selected" : '';
                        $html .= '<option value="'.$v1.'" '.$check.'>'.$v1.'</option>';
                        $a ++ ;
                    }
                                
                    $html .= '</select>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			default:
    				break;
    		}
    	}
    	return ['html'=>$html, 'script'=>$script, 'ueditor'=>$ueditor];
    }
    public function disablewordscount()
    {
        if (trim(config("sys.disablewords_content")) == "" || !config('sys.disablewords_status')) {
            $data = ['code' => 0, 'msg' => "更新已有数据，请先开启并设置禁用词！"];
        }else{
            $htmltype = input('post.htmltype'); 
            $filecount = db('content')->field('id')->count();
            $time = 0.05 * $filecount;
            $data = ['code' => 1, 'time' => s_to_hs($time), 'msg' => ""];
        }
        return json($data);
        
    }
    public function disablewordsshow(){
        return $this->fetch();
    }
    public function disablewordsupdate(){
        if(request()->isAjax()){
            $fid =  input("param.fid/d", 0);
            $achievepage = input("param.achieve/d", 0);
            function_exists('set_time_limit') && set_time_limit(0);
            $db = db('content');
            $concount = $db->field('id,jumpurl')->count();
            $data['allpagetotal'] = $concount;
            $data['achievepage'] = $achievepage;
            $limit = 10;
            $conlist = $db->orderRaw("id asc")->limit($fid*$limit.",".$limit)->select();
            $content = new ContentModel();
            foreach ($conlist as $k => $v) {
                $coninfo = $content->getOneContent($v['id']);
                $content->editContent($coninfo, $v['mid']);
                $data['achievepage'] +=  1;
            }
            $data['fid'] = $fid + 1;
            return ['code' => 1, 'data' => $data, 'msg' => ''];
            return json($data);
        }
    }
}
