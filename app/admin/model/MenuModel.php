<?php
namespace app\admin\model;
use think\Model;

class MenuModel extends Model
{
    protected $name = 'auth_rule';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    public function getAllMenu()
    {
        return $this->orderRaw('sort asc')->select();       
    }

    public function insertMenu($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        try{
            $result = $this->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加菜单失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加菜单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加菜单成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editMenu($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        try{
            $result =  $this->save($param, ['id' => $param['id']]);
            if(false === $result){
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑菜单失败',2);
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑菜单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '编辑菜单成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneMenu($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delMenu($id)
    {
        try{
            $this->where(['id'=>$id])->delete();
            writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】删除菜单成功',1);
            return ['code' => 1, 'data' => '', 'msg' => '删除菜单成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}