<?php
namespace app\admin\controller;
use app\admin\model\CategoryModel;
use app\admin\model\DiymodelModel;
use app\admin\model\ContentModel;
use think\Config;
use think\Db;

class Category extends Common
{
    public function index(){
        $category = new CategoryModel();
        $diymodel = new DiymodelModel();
        $nav = new \org\Leftnav;
        $infolist = $category->getAllcategory(); 
        $indexCate = new \app\index\model\CategoryModel();
        foreach ($infolist as $k => $v) {
            $minfo = $diymodel->getOneDiymodel($v['mid']);
            $infolist[$k]['mname'] = $minfo['title'];
            $nname = "";
            switch ($v['nav']) {
                case '0':
                    $tname = "不显示";
                    break;
                case '1':
                    $tname = "主导航";
                    break;
                case '2':
                    $tname = "尾导航";
                    break;
                case '3':
                    $tname = "都显示";
                    break;
            }
            $infolist[$k]['tname'] = $tname;
            $infolist[$k]['preview'] = $indexCate->getCategoryUrl($v);
        }

        $arr = $nav::rule($infolist);

        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));
        
        $this->assign('infolist', $arr);
        return $this->fetch();
    }

    public function addcategory()
    {
        $diymodel = new DiymodelModel();
        $category = new CategoryModel();
        $nav = new \org\Leftnav;
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $category->insertcategory($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);

        //模版文件列表

        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
        return $this->fetch();
    }

    public function batchaddcategory()
    {
    	$diymodel = new DiymodelModel();
        $category = new CategoryModel();
        $nav = new \org\Leftnav;

        if(request()->isAjax()){
            $param = input();
            $titlelist = explode('***', $param['titlelist']);
            unset($param['titlelist']);
            $datalist = [];
            foreach ($titlelist as $k => $v) {
                if ($v) {
                    $param['title'] = $v;
                    $datalist[] = $param;
                }
            }
            if ($datalist) {
            	$jg = $category->batchinsertcategory($datalist);
            }
            if ($jg['code'] == 1) {
            	return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加栏目：'.$jg['data'].'个']);
            }else{
            	return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加栏目：0个']);
            }
            
        }
        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);
        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
    	return $this->fetch();
    }
    public function editcategory()
    {
        $category = new CategoryModel();
        $diymodel = new DiymodelModel();
        $content = new ContentModel();
        $nav = new \org\Leftnav;
        $info = $category->getOnecategory(input('param.id'));
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $category->editcategory($param);
            if ($flag['code'] == 1) {
                //判断模型是否变更
                if ($info['mid'] != $param['mid']) {
                    $conlist = $content->moveContentByCid($info['id'], $info['mid'], $param['mid']);
                }
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $this->assign('info', $info);

        //分类列表
        $catelist = $category->getAllCategory();
        $carr = $nav::rule($catelist);
        $this->assign('catelist', $carr);

        //模版文件列表
        $this->assign('listfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'list_*'));
        $this->assign('showfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'show_*'));
        $this->assign('coverfile', getFileFolderList('./template/'.config('sys.theme_style').'/index' , 2, 'cover_*'));

        $this->assign('modellist', $diymodel->getAllDiymodel());
        return $this->fetch();
    }

    public function delcategory()
    {
        $id = input('param.ids');
        $category = new CategoryModel();
        $content = new ContentModel();
        

        $catlist = $category->getAllCategory();

        $cidlist = [];
       	if (strstr($id, ',')) {
	    	$pidarr = explode(',', $id);
	    	foreach ($pidarr as $k => $v) {
	    		if ($v) {
	    			$catzj = $category->getChildsId($catlist, $v, 1);
		    		foreach ($catzj as $k1 => $v1) {
		    			array_push($cidlist, $v1); 
		    		}
	    		}
	    	}
	    }else{
	    	$cidlist = $category->getChildsId($catlist, $id, 1);
	    }
        //删除该文章下的内容
        $content->delContentByCid($cidlist);
        //删除分类
        $flag = $category->delcategory($cidlist);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortcategory()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('category');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
        
    }

    public function etitlecategory()
    {
        $id = input('param.id');
        $etitle = input('param.etitle');
        $db = Db::name('category');
        $flag = $db->where(['id'=>$id])->setField(['etitle'=>$etitle]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function doisarea()
    {
        $ids = input('param.ids');
        $isarea = input('param.isarea');
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['isarea'=>$isarea]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function doisnav()
    {
        $ids = input('param.ids');
        $isnav = input('param.isnav');
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['nav'=>$isnav]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function dotemplate()
    {
        $ids = input('param.ids');
        $tpl_cover = input('param.tpl_cover') == '选择模板' ? '' : input('param.tpl_cover');
        $tpl_list = input('param.tpl_list') == '选择模板' ? '' : input('param.tpl_list');
        $tpl_show = input('param.tpl_show') == '选择模板' ? '' : input('param.tpl_show');
        $db = Db::name('category');
        $flag = $db->where(['id'=>['IN', $ids]])->setField(['tpl_cover'=>$tpl_cover,'tpl_list'=>$tpl_list,'tpl_show'=>$tpl_show]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function statecategory()
    {
        $id = input('param.id');
        $db = Db::name('category');
        $status =  $db->where(['id'=>$id])->value('status');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已关闭']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }
}
