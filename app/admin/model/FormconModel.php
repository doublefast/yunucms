<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class FormconModel extends Model
{
    protected $name = 'formcon';

    public function getContentIdByCid($cid)
    {
        return $this->where(['cid'=>['IN', $cid]])->column('id');
    }

    public function getCountFormcon($where)
    {
        return $this->where($where)->count();
    }
    public function editlook($id)
    {
        return $this->update(['id'=>$id,'look'=>1]);
    }

    public function editFormcon($param, $mid)
    {
        try{
            foreach ($param as $k => $v) {
                if (is_array($v)) {
                    $param[$k] = implode(',', $v);
                }
            }
            $param['istop'] = array_key_exists("istop", $param) ? 1 : 0;

            $tabname = DB::name('diyform')->where(['id'=>$mid])->value('tabname');
            $param['update_time'] = time();
            $result1 =  $this->allowField(true)->save($param, ['id' => $param['id']]);
            $param['conid'] = $param['vid'];
            $result2 =  DB::name('form_'.$tabname)->strict(false)->update($param);

            if(false === $result1 || false === $result2){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑表单成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneFormcon($id)
    {
        $fid = $this->where('id', $id)->value('fid');
        $tabname = DB::name('diyform')->where(['id'=>$fid])->value('tabname');
        $info1 = $this->where('id', $id)->find()->toArray();
        $info2 = DB::name('form_'.$tabname)->where(['conid'=>$info1['vid']])->find();
        return array_merge($info1, $info2);
    }

    public function delFormcon($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $list = $this->where('id', 'IN', $id)->select();
            $mdb = DB::name('diyform');
            foreach ($list as $k => $v) {
                $tabname = $mdb->where(['id'=>$v['fid']])->value('tabname');
                DB::name('form_'.$tabname)->delete($v['vid']);
            }
            $this->where('id', 'IN', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除内容成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function delFormconByCid($cidlist)
    {
        try{
            $list = $this->where(['cid'=>['IN', $cidlist]])->select();
            $mdb = DB::name('diymodel');
            foreach ($list as $k => $v) {
                $tabname = $mdb->where(['id'=>$v['mid']])->value('tabname');
                DB::name('diy_'.$tabname)->delete($v['vid']);
            }
            $this->where(['cid'=>['IN', $cidlist]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除内容成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}