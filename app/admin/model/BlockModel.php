<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class BlockModel extends Model
{
    protected $name = 'block';

    public function getAllBlock($where, $Nowpage, $limits)
    {
        //return $this->where($where)->select();

        return $this->field(config('database.prefix').'block.*,'.config('database.prefix').'block_category.title as cname')->join(config('database.prefix').'block_category', config('database.prefix').'block.cid = '.config('database.prefix').'block_category.id')
            ->where($where)->page($Nowpage, $limits)->select();//->page($Nowpage, $limits)->orderRaw('id desc')

    }

    public function getCountBlock($id)
    {
        $count = $this->where(['cid'=>$id])->count();
        return $count ? $count : 0;
    }

    public function insertBlock($param)
    {
        try{
            $param['content'] = $param['content'.$param['type']];
            $result = $this->allowField(true)->validate('BlockValidate')->save($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加自定义块成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editBlock($param)
    {
        try{
            $param['content'] = $param['content'.$param['type']];
            $result =  $this->allowField(true)->validate('BlockValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑自定义块成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneBlock($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delBlock($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where(['id'=>['IN', $id]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除自定义块成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function delBlockBycid($cid)
    {
        try{
            $this->where(['cid'=>$cid])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除自定义块成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}