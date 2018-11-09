<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class DiyformModel extends Model
{
    protected $name = 'diyform';

    public function getAlldiyform()
    {
        return $this->order('id desc')->select();
    }
    public function insertDiyform($param)
    {
        try{
            $param['mailwarn'] = array_key_exists("mailwarn", $param) ? 1 : 0;
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $result = $this->validate('DiyformValidate')->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加表单成功'];
            }
        }catch( PDOException $e){
            
        }
    }

    public function editDiyform($param)
    {
        try{
            $param['mailwarn'] = array_key_exists("mailwarn", $param) ? 1 : 0;
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $result =  $this->validate('DiyformValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){ 
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑表单失败',2);
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑表单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '编辑表单成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneDiyform($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function copyDiyformField($ytabname, $ntabname)
    {
        try{
            $yid = $this->where('tabname', $ytabname)->find();
            $nid = $this->where('tabname', $ntabname)->find();
            $db = db('diyfield');

            $fieldlist = $db->where(['mid'=>$yid['id']])->select();
            foreach ($fieldlist as $k => $v) {
                unset($fieldlist[$k]['id']);
                $fieldlist[$k]['mid'] = $nid['id'];
            }
            $db->insertAll($fieldlist);
            return ['code' => 1, 'data' => '', 'msg' => ''];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function delDiyform($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】删除表单成功',1);
            return ['code' => 1, 'data' => '', 'msg' => '删除表单成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

}