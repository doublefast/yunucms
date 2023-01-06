<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class DiyfieldModel extends Model
{
    protected $name = 'diyfield';
    private $sysfield = ['id','cid','mid','title','etitle','jumpurl','click','vid','sort','istop','create_time','update_time','aid','seo_title','seo_keyword','seo_desc','conid'];

    public function getAllDiyfield($mid,$type = 1)
    {
        return $this->where(['mid'=>$mid,'type'=>$type])->orderRaw('sort asc')->select();
    }

    public function getCountDiyfield($mid, $type = 1)
    {
        $count = $this->where(['mid'=>$mid,'type'=>$type])->count();
        return $count ? $count : 0;
    }

    public function insertDiyfield($param)
    {
        try{
            $param['field'] = strtolower($param['field']);
        	if (in_array($param['field'], $this->sysfield)) {
        		writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段失败',2);
                return ['code' => -1, 'data' => '', 'msg' => "字段不能为系统关键字段,关键字段列表：".implode(' , ', $this->sysfield)];
        	}
            if ($this->where("(title = '".$param['title']."' OR field = '".$param['field']."') AND mid=".$param['mid']." AND type=".$param['type'])->find()) {
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段失败',2);
                return ['code' => -1, 'data' => '', 'msg' => "字段已存在"];
            }
            $result = $this->validate('DiyfieldValidate')->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加自定义字段成功'];
            }
        }catch( PDOException $e){
            
        }
    }

    public function editDiyfield($param)
    {
        try{
            $param['field'] = strtolower($param['field']);
        	if (in_array($param['field'], $this->sysfield)) {
        		writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段失败',2);
                return ['code' => -1, 'data' => '', 'msg' => "字段不能为系统关键字段,关键字段列表：".implode(' , ', $this->sysfield)];
        	}

            if ($this->where("id <> ".$param['id']." AND (title = '".$param['title']."' OR field = '".$param['field']."') AND mid=".$param['mid']." AND type=".$param['type'])->find()) {
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】添加自定义字段失败',2);
                return ['code' => -1, 'data' => '', 'msg' => "字段已存在"];
            }
            $result =  $this->validate('DiyfieldValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){ 
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑自定义字段失败',2);
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】编辑自定义字段成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '编辑自定义字段成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneDiyfield($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delDiyfield($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $this->where('id', 'IN', $id)->delete();
            writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】删除自定义字段成功',1);
            return ['code' => 1, 'data' => '', 'msg' => '删除自定义字段成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}