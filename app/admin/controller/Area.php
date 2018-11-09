<?php
namespace app\admin\controller;
use app\admin\model\AreaModel;
use think\Db;

class Area extends Common
{
    public function index()
    {
    	$pid = input('id') ? input('id') :0;
    	$area = new AreaModel();
        $infolist = $area->getAllAreaByPid($pid);
        foreach ($infolist as $k => $v) {
        	$count = $area->getAreaCount($v['id']);
        	$infolist[$k]['count'] = $count['count'];
        	$infolist[$k]['top'] = $count['top'];
        }
        $this->assign('infolist', $infolist);
        $this->assign('pid', $pid);
        return $this->fetch();
    }

    public function addarea()
    {
    	$pid = input('pid') ? input('pid') :0;
        if(request()->isAjax()){
            $param = input('post.');
           	$area = new areaModel();
            $flag = $area->insertarea($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $area = new AreaModel();
        $arealist = $area->getAllAreaByPid($pid);
        $this->assign('arealist', $arealist);
        $this->assign('pid', $pid);
        return $this->fetch();
    }

    public function editarea()
    {
        $area = new areaModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $area->editarea($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $info = $area->getOnearea($id);
        $this->assign('info', $info);

        $arealist = $area->getAllArea();
        $nav = new \org\Leftnav;
        $arr = $nav::rule($arealist);
        $this->assign('arealist', $arr);
        return $this->fetch();
    }

    public function delarea()
    {
        $id = input('param.ids');
        $area = new areaModel();
        $flag = $area->delarea($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function stateurl()
    {
        $id = input('param.id');
        $db = Db::name('area');
        $status =  $db->where(array('id'=>$id))->value('isurl');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(array('id'=>$id))->setField(['isurl'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(array('id'=>$id))->setField(['isurl'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }

    public function statecon()
    {
        $id = input('param.id');
        $db = Db::name('area');
        $info =  $db->where(array('id'=>$id))->find();//判断当前状态
        if($info['iscon'] == 1)
        {
            $flag = $db->where(array('id'=>$id))->setField(['iscon'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(array('id'=>$id))->setField(['iscon'=>1]);
            $area = new areaModel();
            $area->statecon($info); //更新所有上级
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }

    public function statetop()
    {
        $id = input('param.id');
        $db = Db::name('area');
        $status =  $db->where(array('id'=>$id))->value('istop');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(array('id'=>$id))->setField(['istop'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(array('id'=>$id))->setField(['istop'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }

    public function statearea()
    {
        $type = input('param.type');
        $val = input('param.val');
        $db = Db::name('area');

        $ids = input('param.ids')."";
        $ids =  substr($ids, 0, strlen($ids)-1);

        $area = new areaModel();
        $idsarr = $area->getAllIdByPid($ids);
        $idsarr = implode(',', $idsarr).','.$ids;
        $status = $db->where(['id'=>['IN', $idsarr]])->setField([$type=>$val]);
        return json(['code' => 1, 'msg' => '已更新']);
    }

    public function sortarea()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('area');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
        
    }
}
