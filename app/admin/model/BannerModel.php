<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class BannerModel extends Model
{
    protected $name = 'banner';

    public function getAllBanner()
    {
        return $this->order('sort asc')->select();
    }

    public function insertBanner($param)
    {
        try{
            $result = $this->allowField(true)->save($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加幻灯片成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editBanner($param)
    {
        try{
            $result =  $this->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑幻灯片成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneBanner($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delBanner($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where(['id'=>['IN', $id]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除幻灯片成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}