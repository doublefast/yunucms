<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class TagurlModel extends Model
{
    protected $name = 'tagurl';

    public function getAllTagurl()
    {
        return $this->orderRaw('id desc')->select();
    }

    public function insertTagurl($param)
    {
        try{
            $validate = validate('TagurlValidate');
            if (!$validate->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }
            $result = $this->allowField(true)->insert($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加TAG成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editTagurl($param)
    {
        try{
            $result =  $this->validate('TagurlValidate')->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' =>  -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑TAG成功'];
            }
        }catch( PDOException $e){
            return ['code' =>  -1, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneTagurl($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delTagurl($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除TAG成功'];
        }catch( PDOException $e){
            return ['code' => -1, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}