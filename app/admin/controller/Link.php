<?php
namespace app\admin\controller;
use app\admin\model\LinkModel;
use app\admin\model\AreaModel;
use think\Db;

class Link extends Common
{
    public function index(){
        $link = new LinkModel();
        $infolist = $link->getAllLink(); 
        foreach ($infolist as $k => $v) {
            $wz = "";
            switch ($v['type']) {
                case '1':
                    $wz = "首页";
                    break;
                case '2':
                    $wz = "内页";
                    break;
                case '3':
                    $wz = "其他";
                    break;
            }
            $infolist[$k]['wz'] = $wz;
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function addlink()
    {
        if(request()->isAjax()){
            $param = input('post.');
           	$link = new LinkModel();
            $flag = $link->insertLink($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $area = new AreaModel();
        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist);
        $this->assign('arealist', $arealist);
        return $this->fetch();
    }

    public function editlink()
    {
        $link = new LinkModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $link->editLink($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $info = $link->getOneLink($id);
        $area = new AreaModel();
        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist, 0, $info['area']);
        $this->assign('arealist', $arealist);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function dellink()
    {
        $id = input('param.ids');
        $link = new LinkModel();
        $flag = $link->delLink($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function statelink()
    {
        $id = input('param.id');
        $db = Db::name('Link');
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

    public function sortlink()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('link');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
        
    }
}
