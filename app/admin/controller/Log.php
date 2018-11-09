<?php
namespace app\admin\controller;
use app\admin\model\LogModel;
use think\Db;
use com\IpLocation;

class Log extends Common
{
    /**
     * [operate_log 操作日志]
     */
    public function index()
    {
        $key = input('key');
        $map = [];
        if($key&&$key!==""){
            $map['admin_id'] =  $key;          
        }      
        $arr=Db::name("admin")->column("id,username"); //获取用户列表      
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config("paginate.list_rows");
        $count = Db::name('log')->where($map)->count();// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面
        $lists = Db::name('log')->where($map)->page($Nowpage, $limits)->order('add_time desc')->select();       
        $Ip = new IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
        foreach($lists as $k=>$v){
            $lists[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
            $lists[$k]['ipaddr'] = $Ip->getlocation($lists[$k]['ip']);
        }  
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('count', $count);
        $this->assign("search_user",$arr);
        $this->assign('val', $key);
        if(input('get.page')){
            return json($lists);
        }
        return $this->fetch();
    }

    /**
     * [del_log 删除日志]
     */
    public function dellog()
    {
        $ids = input('param.ids');
        $log = new LogModel();
        $flag = $log->delLog($ids);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
 
}