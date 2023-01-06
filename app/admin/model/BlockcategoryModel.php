<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class BlockcategoryModel extends Model
{
    protected $name = 'block_category';

    public function getAllBlockcategory()
    {
        return $this->orderRaw('sort asc')->select();
    }

    public function insertBlockcategory($param)
    {
        try{
            $result = $this->save($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加自定义块分类成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editBlockcategory($param)
    {
        try{
            $result =  $this->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑自定义块分类成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneBlockcategory($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delBlockcategory($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where(['id'=>['IN', $id]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除自定义块分类成功,关联数据也已删除'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}