<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class CategoryModel extends Model
{
    protected $name = 'category';
    private $sysfield = ['app','caches','config','data','system','template','uploads'];

    public function getAllCategory()
    {
        $groupid = db('admin')->where(['id'=>session('admin_uid')])->value('groupid');
        $role = new UserType();
        $catlist = $role->getCatlistById($groupid);

        $where = $catlist ? ['id'=>['IN',$catlist]] : 1;
        return $this->where($where)->order('sort asc')->select();
    }

    public function getNodeInfo($id)
    {
        $groupid = db('admin')->where(['id'=>session('admin_uid')])->value('groupid');
        $role = new UserType();
        $catlist = $role->getCatlistById($groupid);

        $where = $catlist ? ['id'=>['IN',$catlist]] : 1;
        $result = $this->where($where)->field('id,title,pid')->select();
        $str = "";
        $role = new UserType();
        $rule = $role->getCatlistById($id);

        if(!empty($rule)){
            $rule = explode(',', $rule);
        }
        foreach($result as $key=>$vo){
            $str .= '{ "id": "' . $vo['id'] . '", "pId":"' . $vo['pid'] . '", "name":"' . $vo['title'].'"';

            if(!empty($rule) && in_array($vo['id'], $rule)){
                $str .= ' ,"checked":1';
            }

            $str .= '},';
        }

        return "[" . substr($str, 0, -1) . "]";
    }

    public function insertCategory($param)
    {
        try{
            if (empty($param['etitle'])) {
                $param['etitle'] = get_pinyin(iconv('utf-8', 'gb2312//ignore', $param['title']), 0);
            }
            
            if (in_array($param['etitle'], $this->sysfield)) {
                return ['code' => -1, 'data' => '', 'msg' => "分类别名不能为系统关键字,关键字列表：".implode(' , ', $this->sysfield)];
            }
            $param['tpl_cover'] = $param['tpl_cover'] == "选择模板" ? '' : $param['tpl_cover'];
            $param['tpl_list'] = $param['tpl_list'] == "选择模板" ? '' : $param['tpl_list'];
            $param['tpl_show'] = $param['tpl_show'] == "选择模板" ? '' : $param['tpl_show'];

            $param['isarea'] = array_key_exists("isarea", $param) ? 1 : 0;
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $param['target'] = array_key_exists("target", $param) ? 1 : 0;

            $result = $this->validate('Category')->allowField(true)->save($param);
            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '添加栏目成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function batchinsertcategory($datalist)
    {
        try{
            foreach ($datalist as $k => $v) {
                if (empty($v['etitle'])) {
                    $datalist[$k]['etitle'] = get_pinyin(iconv('utf-8', 'gb2312//ignore', $v['title']), 0);
                }
                if (in_array($datalist[$k]['etitle'], $this->sysfield)) {
                    unset($datalist[$k]);
                    continue;
                }
                $info = $this->where(['etitle'=>$datalist[$k]['etitle']])->find();
                if ($info) {
                    unset($datalist[$k]);
                    continue;
                }
                $datalist[$k]['isarea'] = 0;
                $datalist[$k]['status'] = 1;
                $datalist[$k]['target'] = 0;
            }
            $result = $this->saveAll($datalist);

            if(false === $result){            
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => count($result), 'msg' => '添加栏目成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function editCategory($param)
    {
        try{
            if (empty($param['etitle'])) {
                $param['etitle'] = get_pinyin(iconv('utf-8', 'gb2312//ignore', $param['title']), 0);
            }

            if (in_array($param['etitle'], $this->sysfield)) {
                return ['code' => -1, 'data' => '', 'msg' => "分类别名不能为系统关键字,关键字列表：".implode(' , ', $this->sysfield)];
            }

            $param['tpl_cover'] = $param['tpl_cover'] == "选择模板" ? '' : $param['tpl_cover'];
            $param['tpl_list'] = $param['tpl_list'] == "选择模板" ? '' : $param['tpl_list'];
            $param['tpl_show'] = $param['tpl_show'] == "选择模板" ? '' : $param['tpl_show'];

            $param['isarea'] = array_key_exists("isarea", $param) ? 1 : 0;
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $param['target'] = array_key_exists("target", $param) ? 1 : 0;
            
            $result =  $this->validate('Category')->allowField(true)->save($param, ['id' => $param['id']]);
            if(false === $result){            
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '编辑栏目成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getOneCategory($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function delCategory($cidlist)
    {
        try{
            $this->where(['id'=>['IN', $cidlist]])->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除栏目成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

    public function getChildsId($cate, $pid, $flag = 0) {
        $arr = array();
        if ($flag) {
            $arr[] = intval($pid);
        }
        foreach ($cate as $v) {
            if ($v['pid'] == $pid) {
                $arr[] = $v['id'];
                $arr = array_merge($arr, $this->getChildsId($cate, $v['id']));
            }
        }
        return $arr;
    }

}