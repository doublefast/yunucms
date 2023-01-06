<?php
namespace app\admin\controller;
use app\admin\model\RedirecturlModel;
use app\admin\model\CategoryModel;
use think\Db;

class Redirecturl extends Common
{
    public function index(){
        $redirecturl = new RedirecturlModel();
        $infolist = $redirecturl->getAllRedirecturl(); 
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function addredirecturl()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $redirecturl = new RedirecturlModel();
            $flag = $redirecturl->insertRedirecturl($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editredirecturl()
    {
        $redirecturl = new RedirecturlModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $redirecturl->editRedirecturl($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $info = $redirecturl->getOneRedirecturl($id);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function delredirecturl()
    {
        $id = input('param.ids');
        $redirecturl = new RedirecturlModel();
        $flag = $redirecturl->delRedirecturl($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    //一键导入栏目跳转
    public function cateredirecturl()
    {
        $category = new CategoryModel();
        $redirecturl = new RedirecturlModel();
        $catelist = $category->getAllCategory();
        foreach ($catelist as $k => $v) {
        	if (!$v['jumpurl']) {
        		$param['source_url'] = config('sys.site_protocol')."://".config('sys.site_url')."/".$v['etitle'];
        		$param['target_url'] = config('sys.site_protocol')."://".config('sys.site_url')."/".$v['etitle']."/";
        		$redirecturl->insertRedirecturl($param);
        	}
        }
        return json(['code' => 1, 'msg' => '已更新']);
    }
}
