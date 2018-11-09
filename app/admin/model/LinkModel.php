<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class LinkModel extends Model
{
    protected $name = 'link';

    public function getAllLink()
    {
        return $this->order('sort asc')->select();
    }

    public function insertLink($param)
    {
        try{
            $param['area'] = isset($param['area']) ? ','.$param['area'].',' : '';
            $result = $this->allowField(true)->save($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加友情链接成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editLink($param)
    {
        try{
            $param['area'] = isset($param['area']) ? ','.$param['area'].',' : '';
            $result =  $this->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑友情链接成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneLink($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delLink($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除友情链接成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}