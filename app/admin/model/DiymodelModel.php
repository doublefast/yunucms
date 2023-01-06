<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class DiymodelModel extends Model
{
    protected $name = 'diymodel';

    public function getAllDiymodel()
    {
        return $this->orderRaw('sort asc')->select();
    }

    public function insertDiymodel($param)
    {
        try{
            $param['tabname'] = strtolower($param['tabname']);
            $result = $this->validate('DiymodelValidate')->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建模型失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建模型成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加模型成功'];
            }
        }catch( PDOException $e){
            
        }
    }

    public function editDiymodel($param)
    {
        try{
            $param['tabname'] = strtolower($param['tabname']);
            $result =  $this->validate('DiymodelValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){ 
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑模型失败',2);
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑模型成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '编辑模型成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneDiymodel($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function copyDiymodelField($ytabname, $ntabname)
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

    public function delDiymodel($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】删除模型成功',1);
            return ['code' => 1, 'data' => '', 'msg' => '删除模型成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}