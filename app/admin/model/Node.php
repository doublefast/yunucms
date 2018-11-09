<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class Node extends Model
{
    protected $name = "auth_rule";
    /**
     * [getNodeInfo 获取节点数据]
     */
    public function getNodeInfo($id)
    {
        $result = $this->field('id,title,pid')->select();
        $str = "";
        $role = new UserType();
        $rule = $role->getRuleById($id);

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

    /**
     * [getMenu 根据节点数据获取对应的菜单]
     */
    public function getMenu($nodeStr = '')
    {
        //超级管理员没有节点数组
        $where = empty($nodeStr) ? 'status = 1' : 'status = 1 AND id IN('.$nodeStr.')';
        $result = Db::name('auth_rule')->where($where)->order('sort')->select();
        //if(config('template')['theme_name'] == "default"){

            $new_result=array();
            foreach($result as $k=>$v){
                $new_result[$k]['id']=$v['id'];
                $new_result[$k]['pid']=$v['pid'];
                $new_result[$k]['name']=$v['name'];
                $new_result[$k]['title']=$v['title'];
                $new_result[$k]['icon']=$v['css'];
                $new_result[$k]['spread']=false;
            }
            $menu = getMenuList($new_result);

        /*}else{
            $menu = prepareMenu($result);
        }*/

        return $menu;
    }

    /**
     * [getMenu 根据节点URL获取该子孙]
     */
    public function getMenuchild($url, $nodeStr = '')
    {
        //超级管理员没有节点数组
        $where = ["name"=>$url];
        $db = Db::name('auth_rule');
        $result1 = $db->where($where)->find();
        $ztopid = $result1['id'];
        if($result1['pid'] != 0){
            $result = $db->where(["id"=>$result1['pid']])->find();
            if ($result['pid'] != 0) {
                $result = $db->where(["id"=>$result['pid']])->find();
                $ztopid = $result['id'];
            }else{
                $ztopid = $result['id'];
            }
        }

        if (empty($ztopid)) {
            $chkid = $db->where("status='1' AND pid='0' ")->value('id');
        }else{
            $chkid = $ztopid;
        }

        $menu =  $db->where(["id"=>$chkid])->find();
        $where = "pid='".$chkid."'";
        $where = $nodeStr ?  $where." AND id IN(".$nodeStr.")" : $where;
        $menu['child'] =  $db->where($where)->order('sort asc')->select();
        $ischk = 0;
        foreach ($menu['child'] as $k => $v) {
            if ($v['name'] == $url || $v['id'] == $result1['pid']) {
                $menu['child'][$k]['ischk'] = 1;
                $ischk = 1;
            }else{
                $menu['child'][$k]['ischk'] = 0;
            }
            $menu['child'][$k]['href'] = url($v['name']);
        }
        
        return $menu;
    }

    /**
     * [getPosition 获取当前页面在菜单中的当前位置和名称]
     */
    public function getPosition($url)
    {
        $where = ["name"=>$url];
        $result1 = Db::name('auth_rule')->where($where)->find();

        $url = ' &gt; <a href="'.url($result1['name']).'" >'.$result1['title'].'</a>';
        $name = $result1['title'];
        if($result1['pid'] != 0){
            $result2 = Db::name('auth_rule')->where(["id"=>$result1['pid']])->find();
            $url = ' &gt; <a href="'.url($result2['name']).'" >'.$result2['title'].'</a>'.$url;
            if($result2['pid'] != 0){
                $result3 = Db::name('auth_rule')->where(["id"=>$result2['pid']])->find();
                $url = ' &gt; <a href="'.url($result3['name']).'" >'.$result3['title'].'</a>'.$url;
            }
        }
        
        $url = '您当前的位置：<a href="'.url('index/index').'">首页</a>' .$url;
        return ['url'=>$url, 'name'=>$name];
    }
}