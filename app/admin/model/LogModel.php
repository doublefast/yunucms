<?php
namespace app\admin\model;
use think\Model;

class LogModel extends Model
{
    protected $name = 'log';

    public function delLog($log_id)
    {
        try{
            $log_id = strpos($log_id,',') ?  $log_id."0" : $log_id;
            $this->where("log_id", 'in',  $log_id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除日志成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

}