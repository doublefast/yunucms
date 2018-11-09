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
        	$infolist[$k]['top'] = 0;//$count['top']
        }
        $this->assign('infolist', $infolist);
        $this->assign('pid', $pid);
        return $this->fetch();
    }

    public function showurl()
    {        
        $infolist = db('area')->where(['isurl'=>1])->order('sort asc')->select();
        foreach ($infolist as $k => $v) {
            echo config('sys.site_protocol')."://".$v['etitle'].".".config('sys.site_levelurl').'<br/>';
        }
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

    public function stateopen()
    {
        $id = input('param.id');
        $db = Db::name('area');
        $status =  $db->where(array('id'=>$id))->value('isopen');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(array('id'=>$id))->setField(['isopen'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(array('id'=>$id))->setField(['isopen'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
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
    //一键快速推荐百强市
    public function openbqs()
    {
        $db = Db::name('area');
        $titlearr = ['北京','上海','广州','深圳','天津','成都','杭州','苏州','重庆','武汉','南京','大连','沈阳','长沙','郑州','西安','青岛','无锡','济南','宁波','佛山','南通','哈尔滨','东莞','福州','长春','石家庄','烟台','合肥','唐山','常州','太原','昆明','潍坊','南昌','泉州','温州','绍兴','嘉兴','厦门','贵阳','淄博','徐州','南宁','扬州','呼和浩特','鄂尔多斯','乌鲁木齐','金华','台州','镇江','威海','珠海','东营','大庆','中山','盐城','包头','保定','济宁','泰州','廊坊','兰州','洛阳','宜昌','沧州','临沂','泰安','鞍山','邯郸','惠州','江门','襄阳','湖州','吉林','芜湖','德州','聊城','漳州','株洲','淮安','榆林','常德','咸阳','衡阳','滨州','柳州','遵义','菏泽','南阳','新乡','湛江','岳阳','郴州','许昌','连云港','枣庄','茂名','周口','宿迁'];
        $status = $db->where(['title'=>['IN', $titlearr]])->setField(['istop'=>1]);
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
