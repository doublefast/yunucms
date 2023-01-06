<?php
namespace app\admin\controller;
use app\admin\model\MenuModel;
use think\Db;

class Menu extends Common
{	
    public function index()
    {
        $nav = new \org\Leftnav;
        $menu = new MenuModel();
        $admin_rule = $menu->getAllMenu();
        $infolist = $nav::rule($admin_rule);
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

	public function addrule()
    {
        if(request()->isAjax()){
            $param = input('post.');    
            $menu = new MenuModel();
            $flag = $menu->insertMenu($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $nav = new \org\Leftnav;
        $menu = new MenuModel();
        $admin_rule = $menu->getAllMenu();
        $arr = $nav::rule($admin_rule);
        $this->assign('admin_rule',$arr);
        return $this->fetch();
    }

    public function editrule()
    {
        $menu = new MenuModel();

        if(request()->isPost()){
            $param = input('post.');
            $flag = $menu->editMenu($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $nav = new \org\Leftnav;

        $admin_rule = $menu->getAllMenu();
        $arr = $nav::rule($admin_rule);
        $this->assign('admin_rule', $arr);
        $id = input('param.id');
        $this->assign('info', $menu->getOneMenu($id));

        return $this->fetch();
    }

    public function delrule()
    {
        $id = input('param.ids');
        $menu = new MenuModel();
        $flag = $menu->delMenu($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function staterule()
    {
        $id = input('param.id');
        $db = Db::name('auth_rule');
        $status =  $db->where(['id'=>$id])->value('status');//判断当前状态
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

    public function sortrule()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('auth_rule');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
    }
}