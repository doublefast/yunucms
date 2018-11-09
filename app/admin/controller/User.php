<?php
namespace app\admin\controller;
use app\admin\model\UserModel;
use app\admin\model\UserType;
use think\Db;

class User extends Common
{
    public function index(){
        $key = input('key');
        $map = [];
        if($key&&$key!=="")
        {
            $map['username'] = ['like',"%" . $key . "%"];          
        }       
        $user = new UserModel();
        $infolist = $user->getUsersByWhere($map, 1, 200);
        foreach($infolist as $k=>$v)
        {
            $infolist[$k]['last_login_time'] = $v['last_login_time'] ? date('Y-m-d H:i:s', $v['last_login_time']) : '';
        }    
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function adduser()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $param['password'] = md5(md5($param['password']).config('auth_key'));
            $user = new UserModel();
            $flag = $user->insertUser($param);
            if ($flag['code'] == 1) {
            	$accdata = array(
	                'uid'=> $user['id'],
	                'group_id'=> $param['groupid'],
	            );
	            $group_access = Db::name('auth_group_access')->insert($accdata);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $role = new UserType();
        $this->assign('role',$role->getRole());
        return $this->fetch();
    }

    public function edituser()
    {
        $user = new UserModel();
        if(request()->isAjax()){
            $param = input('post.');
            if(empty($param['password'])){
                unset($param['password']);
            }else{
                $param['password'] = md5(md5($param['password']).config('auth_key'));
            }
            $flag = $user->editUser($param);
            $group_access = Db::name('auth_group_access')->where(['uid'=>$user['id']])->update(['group_id' => $param['groupid']]);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $role = new UserType();
        $this->assign([
            'info' => $user->getOneUser($id),
            'role' => $role->getRole()
        ]);
        return $this->fetch();
    }

    public function myuser()
    {
        $user = new UserModel();
        if(request()->isAjax()){
            $param = input('post.');
            if(empty($param['password'])){
                unset($param['password']);
            }else{
                $param['password'] = md5(md5($param['password']).config('auth_key'));
            }
            $flag = $user->editUser($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = session('admin_uid');
        $this->assign('info', $user->getOneUser($id));
        return $this->fetch();
    }

    public function deluser()
    {
        $id = input('param.ids');
        $role = new UserModel();
        $flag = $role->delUser($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function stateuser()
    {
        $id = input('param.id');
        $db = Db::name('admin');
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

}