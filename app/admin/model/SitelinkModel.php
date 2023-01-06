<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class SitelinkModel extends Model
{
    protected $name = 'sitelink';

    public function getAllSitelink()
    {
        return $this->select();
    }

    public function getSitelinkByWhere($where, $Nowpage, $limits)
    {
        return $this->where($where)->page($Nowpage, $limits)->orderRaw('id desc')->select();
    }

    public function getSitelinkCount($where)
    {
        return $this->where($where)->count();
    }
    
    public function insertSitelink($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        $param['areapre'] = array_key_exists("areapre", $param) ? 1 : 0;
        try{
            $result = $this->strict(false)->insertGetId($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加热门标签成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editSitelink($param)
    {
        $param['status'] = array_key_exists("status", $param) ? 1 : 0;
        $param['areapre'] = array_key_exists("areapre", $param) ? 1 : 0;
        try{
            $result =  $this->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑热门标签成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneSitelink($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delSitelink($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除热门标签成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}