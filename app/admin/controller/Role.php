<?php
namespace app\admin\controller;
use app\admin\model\Node;
use app\admin\model\UserType;
use app\admin\model\CategoryModel;
use think\Db;

class Role extends Common
{
    public function index(){
        $user = new UserType();       
        $infolist = $user->getRoleByWhere([], 1, 20);
        $this->assign('infolist', $infolist); 
        return $this->fetch();
    }

    public function addrole()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $role = new UserType();
            $flag = $role->insertRole($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editrole()
    {
        $role = new UserType();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $role->editRole($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $this->assign('info', $role->getOneRole($id));
        return $this->fetch();
    }

    public function delrole()
    {
        $id = input('param.ids');
        $role = new UserType();
        $flag = $role->delRole($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function staterole()
    {
        $id = input('param.id');
        $db = Db::name('auth_group');
        $status = $db->where(['id'=>$id])->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }

    public function giveAccess()
    {
        if(request()->isAjax()) {
            $param = input('param.');
            $node = new Node();
            //获取现在的权限
            if ('get' == $param['type']) {
                $nodeStr = $node->getNodeInfo($param['id']);
                return json(['code' => 1, 'data' => $nodeStr, 'msg' => 'success']);
            }
            //分配新权限
            if ('give' == $param['type']) {
                $doparam = [
                    'id' => $param['id'],
                    'rules' => $param['rule']
                ];
                $user = new UserType();
                $flag = $user->editAccess($doparam);
                return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
            }
        }
        return $this->fetch();
    }
    //获取栏目权限管理
    public function giveAccessCat()
    {
        if(request()->isAjax()) {
            $param = input('param.');
            $category = new CategoryModel();
            //获取现在的权限
            if ('get' == $param['type']) {
                $nodeStr = $category->getNodeInfo($param['id']);
                return json(['code' => 1, 'data' => $nodeStr, 'msg' => 'success']);
            }
            //分配新权限
            if ('give' == $param['type']) {
                $doparam = [
                    'id' => $param['id'],
                    'catlist' => $param['rule']
                ];
                $user = new UserType();
                $flag = $user->editAccess($doparam);
                return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
            }
        }
        return $this->fetch();
    }

    //获取权限列表
    public function permissionsList(){
        $param = input('param.');
        $node = new Node();
        $nodeStr = $node->getNodeInfo($param['id']);
        dump($nodeStr);
    }
}