<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class UserType extends Model
{
    protected $name = 'auth_group';
    protected $autoWriteTimestamp = true;

    public function getRoleByWhere($map, $Nowpage, $limits)
    {
        return $this->where($map)->page($Nowpage, $limits)->order('id desc')->select();
    }

    public function getAllRole($where)
    {
        return $this->where($where)->count();
    }
  
    public function insertRole($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        try{
            $result =  $this->validate('RoleValidate')->save($param);
            if(false === $result){               
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加角色成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
 
    public function editRole($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        try{
            $result =  $this->validate('RoleValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑角色成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneRole($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delRole($id)
    {
        try{
            $this->where(['id'=>$id])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除角色成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getRole()
    {
        return $this->select();
    }

    public function getRuleById($id)
    {
        $res = $this->field('rules')->where(['id'=>$id])->find();
        return $res['rules'];
    }

    public function getCatlistById($id)
    {
        $res = $this->field('catlist')->where(['id'=>$id])->find();
        return $res['catlist'];
    }

    public function editAccess($param)
    {
        try{
            $this->save($param, ['id' => $param['id']]);
            return ['code' => 1, 'data' => '', 'msg' => '分配权限成功'];

        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getRoleInfo($id){

        $result = Db::name('auth_group')->where(['id'=>$id])->find();
        if(empty($result['rules'])){
            $where = '';
        }else{
            $where = 'id in('.$result['rules'].')';
        }
        $res = Db::name('auth_rule')->field('name')->where($where)->select();

        foreach($res as $key=>$vo){
            if('#' != $vo['name']){
                $result['name'][] = $vo['name'];
            }
        }

        return $result;
    }
}