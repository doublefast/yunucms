<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class AreaModel extends Model
{
    protected $name = 'area';

    public function getAllAreaByPid($id)
    {
        $infolist = $this->where(['pid'=>$id])->orderRaw('sort,id asc')->select();
        return $infolist;
    }

    public function getAllIdByPid($id)
    {
        $ids = $this->where(['pid'=>['IN', $id]])->column('id');
        if (count($ids) != 0) {
            $zj = $this->getAllIdByPid(implode(',', $ids));
            $ids = array_merge($ids, $zj);
        }
        return $ids;
    }

    public function getIdByLevel($ids, $level)
    {
        $idslevel2 = $this->where(['pid'=>['IN', $ids]])->column('id');
        $idslevel2str = implode(',', $idslevel2);
        if($level == 2){
            return $idslevel2str;
        }
        $idslevel3 = $this->where(['pid'=>['IN', $idslevel2str]])->column('id');
        $idslevel3str = implode(',', $idslevel3);
        if($level == 3){
            return $idslevel3str;
        }
    }


    public function getAllArea($where = [])
    {
        return $this->where($where)->orderRaw('sort asc')->column(['id','title','pid','iscon']);
    }

    public function getAreaCount($id)
    {
        $list = $this->where(['pid'=>$id])->column(['id','pid','istop']);
        $count = count($list);
        $top = 0;
        /*foreach ($list as $k => $v) {
            $top = $v['istop'] ? $top+1 : $top;
            $list2 =  $this->where(['pid'=>$v['id']])->column(['id','pid','istop']);
            if ($list2) {
                $count = $count + count($list2);
                foreach ($list2 as $k2 => $v2) {
                    $top = $v2['istop'] ? $top+1 : $top;
                    $list3 =  $this->where(['pid'=>$v2['id']])->column(['id','pid','istop']);
                    if ($list3) {
                        $count = $count + count($list3);
                        foreach ($list3 as $k3 => $v3) {
                            $top = $v3['istop'] ? $top+1 : $top;
                        }
                    }
                }

            }
        }*/
        return ['count'=>$count, 'top'=>$top];
    }

    public function insertArea($param)
    {
        try{
            $param['isopen'] = array_key_exists("isopen", $param) ? 1 : 0;
            $param['istop'] = array_key_exists("istop", $param) ? 1 : 0;
            $param['iscon'] = array_key_exists("iscon", $param) ? 1 : 0;
            $param['isurl'] = array_key_exists("isurl", $param) ? 1 : 0;

            if ($param['isopen'] && config("sys.openarea")) {
                return ['code' => -1, 'data' => '', 'msg' => '请先关闭主站缓存提速，再开通地区'];
            }
            $validate = validate('AreaValidate');
            if (!$validate->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }

            $result = $this->validate('AreaValidate')->allowField(true)->insert($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加地区成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editArea($param)
    {
        try{
            $param['isopen'] = array_key_exists("isopen", $param) ? 1 : 0;
            $param['istop'] = array_key_exists("istop", $param) ? 1 : 0;
            $param['iscon'] = array_key_exists("iscon", $param) ? 1 : 0;
            $param['isurl'] = array_key_exists("isurl", $param) ? 1 : 0;
            
            if ($param['isopen']) {
                if (config("sys.openarea")) {
                    return ['code' => -1, 'data' => '', 'msg' => '请先关闭主站缓存提速，再开通地区'];
                }
                if (!config('cloud.grant')) {
                    $opencount = $this->where(['isopen'=>1])->count();
                    if ($opencount >= 3) {
                        return ['code' => -1, 'data' => '', 'msg' => '请绑定授权域名后再开启'];
                    }
                }
            }

            $result =  $this->validate('AreaValidate')->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑地区成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneArea($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delArea($id)
    {
        try{
            if (!is_array($id)) {
               $id = strpos($id,',') ?  $id."999999" : $id;
            }
            
            $areaids = $this->where(['pid'=>['IN', $id]])->column('id');
            if ($areaids ) {
                $this->delArea($areaids);
            }
            $this->where(['id'=>['IN', $id]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除地区成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function statecon($area){
        if ($area['pid'] != 0) {
            $info = $this->where(['id'=>$area['pid']])->find();
            $this->where(['id'=>$info['id']])->setField(['iscon'=>1]);
            $this->statecon($info);
        }
    }

    public function getAreaByCon($area, $pid = 0, $con = ''){
        $arr = array();
        foreach ($area as $v) {
            if ($v['pid'] == $pid && $v['iscon']) {
                $ischk = 0;
                if ($con) {
                    $ischk = strpos($con, ','.$v['id'].',') !== false ? 1 : 0;
                }
                $v['ischk'] = $ischk;
                $v['node'] = $this->getAreaByCon($area, $v['id'], $con);
                $arr[] = $v;
            }

        }
        return $arr;

    }
}