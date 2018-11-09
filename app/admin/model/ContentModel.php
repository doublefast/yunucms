<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class ContentModel extends Model
{
    protected $name = 'content';

    public function getContentByWhere($where, $Nowpage, $limits)
    {
        return $this->where($where)->page($Nowpage, $limits)->order('id desc')->select();
    }

    public function getContentIdByCid($cid)
    {
        return $this->where(['cid'=>['IN', $cid]])->column('id');
    }

    public function getContentByCid($cid, $daytime = false)
    {
        $where['cid'] = ['IN', $cid];
        if ($daytime) {
            $where['create_time'] = ['LT', time()];
        }
        return $this->where($where)->select();
    }

    public function getContentCount($where)
    {
        return $this->where($where)->count();
    }
    //转移内容对应的模型
    public function moveContentByCid($cid, $mid1, $mid2)
    {
        $conlist = $this->where(['cid'=>$cid])->select();
        

        $diymodeldb = DB::name('diymodel');
        $tabname1 = $diymodeldb->where(['id'=>$mid1])->value('tabname');
        $tabname2 = $diymodeldb->where(['id'=>$mid2])->value('tabname');
        $diydb1 = DB::name('diy_'.$tabname1);
        $diydb2 = DB::name('diy_'.$tabname2);
        foreach ($conlist as $k => $v) {
            $vid = $v['vid'];
            $diycon = $diydb1->where(['conid'=>$v['vid']])->find();
            if ($diycon) {
                unset($diycon['conid']);
                $v['vid'] = $diydb2->strict(false)->insertGetId($diycon);
                $v['mid'] = $mid2;
                $this->update($v->getdata());
                $diydb1->delete($vid);//转移后删除
            }
        }
        return ['code' => 1, 'data' => '', 'msg' => '转移内容成功'];;
    }

    public function insertContent($param, $mid)
    {
        try{
            foreach ($param as $k => $v) {
                if (is_array($v)) {
                    $param[$k] = implode(',', $v);
                }
            }
            $param['istop'] = array_key_exists("istop", $param) ? 1 : 0;
            $param['mainurl'] = array_key_exists("mainurl", $param) ? 1 : 0;
            if (array_key_exists("area", $param)) {
                $param['area'] = $param['area'] ? ','.$param['area'].',' : '';
            }
            
            $tabname = DB::name('diymodel')->where(['id'=>$mid])->value('tabname');
            $param['vid'] = DB::name('diy_'.$tabname)->strict(false)->insertGetId($param);
            $param['create_time'] = $param['create_time'] ? strtotime($param['create_time']) : time();
            $param['update_time'] = time();
            $param['aid'] = session('admin_uid');

            $result = $this->validate('Content')->strict(false)->insertGetId($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加内容成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editContent($param, $mid)
    {
        try{
            foreach ($param as $k => $v) {
                if (is_array($v)) {
                    $param[$k] = implode(',', $v);
                }
            }
            $param['istop'] = array_key_exists("istop", $param) ? 1 : 0;
            $param['mainurl'] = array_key_exists("mainurl", $param) ? 1 : 0;
            if (array_key_exists("area", $param)) {
                $param['area'] = $param['area'] ? ','.$param['area'].',' : '';
            }

            $tabname = DB::name('diymodel')->where(['id'=>$mid])->value('tabname');
            $param['create_time'] = $param['create_time'] ? strtotime($param['create_time']) : time();
            $param['update_time'] = time();
            $result1 =  $this->validate('Content')->allowField(true)->save($param, ['id' => $param['id']]);
            $param['conid'] = $param['vid'];
            $result2 =  DB::name('diy_'.$tabname)->strict(false)->update($param);

            if(false === $result1 || false === $result2){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑内容成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneContent($id)
    {
        $mid = $this->where('id', $id)->value('mid');
        $tabname = DB::name('diymodel')->where(['id'=>$mid])->value('tabname');
        $info1 = $this->where('id', $id)->find()->toArray();
        $info2 = DB::name('diy_'.$tabname)->where(['conid'=>$info1['vid']])->find();
        if ($info2) {
            return array_merge($info1, $info2);
        }else{
            return $info1;
        }
    }

    public function delContent($id)
    {
        try{
            $id = strpos($id,',') ?  $id."0" : $id;
            $list = $this->where('id', 'IN', $id)->select();
            $mdb = DB::name('diymodel');
            foreach ($list as $k => $v) {
                $tabname = $mdb->where(['id'=>$v['mid']])->value('tabname');
                DB::name('diy_'.$tabname)->delete($v['vid']);
            }
            $this->where('id', 'IN', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除内容成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function delContentByCid($cidlist)
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