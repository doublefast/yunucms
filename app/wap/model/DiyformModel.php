<?php
namespace app\wap\model;
use think\Model;
use think\Db;

class DiyformModel extends Model
{
    protected $name = 'diyform';

    public function getAlldiyform()
    {
        return $this->order('id desc')->select();
    }

    public function insertDiyform($param)
    {
        try{
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $result = $this->validate('DiyformValidate')->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加表单成功'];
            }
        }catch( PDOException $e){
            
        }
    }

    public function insertForm($param, $mid){
         try{
            $dbfield = DB::name('diyfield');
            foreach ($param as $k => $v) {
                if (is_array($v)) {
                    $param[$k] = implode(',', $v);
                }
                //验证必填
                $fielddata = $dbfield->where(['field'=>$k,'mid'=>$mid])->find();
                if ($fielddata) {
                    if ($fielddata['isnotnull'] == 1) {
                        if (!$v) {
                            return ['status' => 'error', 'msg' => $fielddata['title']."请正确填写！"];
                        }
                    }
                }
                
            }
            //验证验证码
            if (isset($param['__captcha'.$mid."__"])) {
                $captcha = new \tpcaptcha\Captcha();
                if (!$captcha->check($param['__captcha'.$mid."__"], $mid)) {
                    return ['status' => 'error', 'msg' => "验证错误"];
                }
            }
            
            $tabname = DB::name('diyform')->where(['id'=>$mid])->value('tabname');
            $param['fid'] = $mid;
            $param['vid'] = DB::name('form_'.$tabname)->strict(false)->insertGetId($param);
            $param['create_time'] = time();
            $param['update_time'] = time();
            $param['ip'] = request()->ip();

            $result = DB::name('formcon')->strict(false)->insertGetId($param);
            if(false === $result){            
                return ['status' => 'error', 'msg' => $this->getError()];
            }else{
                return ['status' => 'success', 'msg' => '提交成功'];
            }
        }catch( PDOException $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }
    }

    public function getOneDiyform($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function getOneFormcon($info)
    {
        $tabname = $this->where(['id'=>$info['fid']])->value('tabname');
        $info2 = DB::name('form_'.$tabname)->where(['conid'=>$info['vid']])->find();
        return array_merge($info, $info2);
    }
}