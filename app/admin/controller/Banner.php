<?php
namespace app\admin\controller;
use app\admin\model\BannerModel;
use app\admin\model\AreaModel;
use think\Db;

class Banner extends Common
{
    public function index(){
        $banner = new BannerModel();
        $infolist = $banner->getAllBanner(); 
        foreach ($infolist as $k => $v) {
            $infolist[$k]['tname'] = $v['type'] == 1 ? 'PC' : '手机';
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function addbanner()
    {
        if(request()->isAjax()){
            $param = input('post.');
           	$banner = new BannerModel();
            $flag = $banner->insertBanner($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $area = new AreaModel();
        //获取开启独立内容地区列表
        $arealist = $area->getAllArea(['isopen'=>1]);

        $v['pid'] = '0';
        $v['iscon'] = '1';
        $v['id'] = '88888888';
        $v['title'] = '主站';
        $v['stitle'] = '主站';
        array_unshift($arealist, $v);
        
        $arealist = $area->getAreaByCon($arealist);
        $this->assign('arealist', $arealist);
        return $this->fetch();
    }

    public function editbanner()
    {
        $banner = new BannerModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $banner->editBanner($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $info = $banner->getOneBanner($id);
        $area = new AreaModel();
        //获取开启独立内容地区列表
        $arealist = $area->getAllArea(['isopen'=>1]);

        $v['pid'] = '0';
        $v['iscon'] = '1';
        $v['id'] = '88888888';
        $v['title'] = '主站';
        $v['stitle'] = '主站';
        array_unshift($arealist, $v);

        $arealist = $area->getAreaByCon($arealist, 0, $info['area']);
        $this->assign('arealist', $arealist);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function delbanner()
    {
        $id = input('param.ids');
        $banner = new BannerModel();
        $flag = $banner->delBanner($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortbanner()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('banner');

        $flag = $db->where(array('id'=>$id))->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
        
    }
}
