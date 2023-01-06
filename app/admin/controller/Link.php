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

        //resetlink_start
        $db = db('link');
        foreach ($infolist as $k => $v) {
            $isczarea = true;
            $temp = $v['area'];
            for($i=0; $i<strlen($temp); $i++)
            {
                if (substr($temp,$i,1) != ",") {
                    $isczarea = false;
                }
            }
            $create_time = is_numeric($v['create_time']) ? $v['create_time'] : strtotime($v['create_time']);
            $data = [
                'create_time' => $create_time < 9999 ? time() : $create_time,
                'area' => $isczarea ? '' : $v['area'],
            ];
            $flag = $db->where(['id'=>$v['id']])->update($data);
        }
        //resetlink_end
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
            $infolist[$k]['add_time'] = date('Y-m-d', strtotime($v['create_time']));
            $infolist[$k]['add_type'] = $v['add_type'] == 1 ? "主动添加" : "自动添加";
        }
        $this->assign('infolist', $infolist);
        $siteurl = config('sys.site_protocol')."://".config('sys.site_url');
        $update_path = ROOT_PATH.'data'.DS.'uppack'.DS;
        $cloud = new \com\Cloud(config('cloud.identifier'), $update_path);
        $flinkinfo = $cloud->data(['domain'=>get_host($siteurl)])->api('flinksitefind');
        if (isset($flinkinfo['state']) && $flinkinfo['state'] == 1) {
            $flinkdata = $flinkinfo['data'];
            $keyword = explode("\r\n", $flinkdata['keyword']);
            $flinkdata['keyword1'] = isset($keyword[0]) ? $keyword[0] : "";
            $flinkdata['keyword2'] = isset($keyword[1]) ? $keyword[1] : "";
            $flinkdata['keyword3'] = isset($keyword[2]) ? $keyword[2] : "";

        }else{
            $flinkdata = null;
        }

        $this->assign('siteurl', $siteurl);
        $this->assign('flinkdata', $flinkdata);
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
            return json(['code' => 1, 'data' => '', 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => '', 'msg' => '已开启']);
        }
    }

    public function movearea()
    {
        $ids = input('param.ids');
        $aid = input('param.aid');
        $aid = $aid ? ','.$aid.',' : '';
        $db = Db::name('Link');
        $flag = $db->where('id', 'IN', $ids."0")->setField(['area'=>$aid]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }

    public function sortlink()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('link');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
        
    }
    public function autolink()
    {
        $param = input();
        $param['url'] = config('sys.site_protocol')."://".config('sys.site_url');
        $param['domain'] = get_host($param['url']);
        $update_path = ROOT_PATH.'data'.DS.'uppack'.DS;
        $cloud = new \com\Cloud(config('cloud.identifier'), $update_path);
        $flinkinfo = $cloud->data($param)->api('flinksiteedit');
        if (isset($flinkinfo['state'])) {
            return json(['code' => $flinkinfo['state'], 'msg' => $flinkinfo['info']]);
        }else{
            return json(['code' => 0, 'msg' => "服务器异常，稍后再试"]);
        }
    }
    public function delautolink()
    {
        $param = input();
        $param['url'] = config('sys.site_protocol')."://".config('sys.site_url');
        $param['domain'] = get_host($param['url']);
        $update_path = ROOT_PATH.'data'.DS.'uppack'.DS;
        $cloud = new \com\Cloud(config('cloud.identifier'), $update_path);
        $flinkinfo = $cloud->data($param)->api('flinksitedel');
        if (isset($flinkinfo['state'])) {
            return json(['code' => $flinkinfo['state'], 'msg' => $flinkinfo['state'] ? "已成功取消自动友链功能" : $flinkinfo['info']]);
        }else{
            return json(['code' => 0, 'msg' => "服务器异常，稍后再试"]);
        }
    }
}
