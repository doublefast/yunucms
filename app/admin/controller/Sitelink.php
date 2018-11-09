<?php
namespace app\admin\controller;
use app\admin\model\SitelinkModel;
use think\Db;

class Sitelink extends Common
{
    public function index(){
        $Sitelink = new SitelinkModel();
        $infolist = $Sitelink->getAllSitelink(); 
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function addsitelink()
    {
        if(request()->isAjax()){
            $param = input('post.');
           	$Sitelink = new SitelinkModel();
            $flag = $Sitelink->insertSitelink($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editsitelink()
    {
        $Sitelink = new SitelinkModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $Sitelink->editSitelink($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $this->assign('info', $Sitelink->getOneSitelink($id));
        return $this->fetch();
    }

    public function delsitelink()
    {
        $id = input('param.ids');
        $Sitelink = new SitelinkModel();
        $flag = $Sitelink->delSitelink($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function statesitelink()
    {
        $id = input('param.id');
        $db = Db::name('sitelink');
        $status = $db->where(['id'=>$id])->value('status');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }
}
