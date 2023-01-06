<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class RedirecturlModel extends Model
{
    protected $name = 'redirecturl';

    public function getAllRedirecturl()
    {
        return $this->orderRaw('id desc')->select();
    }

    public function insertRedirecturl($param)
    {
        try{
            $result = $this->insert($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                $this->editcache();
                return ['code' => 1, 'data' => '', 'msg' => '添加301重定向成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editRedirecturl($param)
    {
        try{
            $result =  $this->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                $this->editcache();
                return ['code' => 1, 'data' => '', 'msg' => '编辑301重定向成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneRedirecturl($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delRedirecturl($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            $this->editcache();
            return ['code' => 1, 'data' => '', 'msg' => '删除301重定向成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editcache(){
        $urllist = $this->orderRaw('id desc')->select();
        cache('urllist', $urllist, 7200);
    }
}