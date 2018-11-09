<?php
namespace app\admin\controller;
use app\admin\model\DiymodelModel;
use app\admin\model\DiyfieldModel;
use think\Config;
use think\Db;

class Diymodel extends Common
{
    public function index(){
        $diymodel = new diymodelModel();
        $diyfield = new diyfieldModel();
        $infolist = $diymodel->getAlldiymodel(); 
        foreach ($infolist as $k => $v) {
            $infolist[$k]['tname'] = $v['type'] == 1 ? "<font color='#0099cc'>用户模型</font>" : "<font color='red'>系统模型</font>";
            $infolist[$k]['fcount'] = $diyfield->getCountDiyfield($v['id']);
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function adddiymodel()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $diymodel = new diymodelModel();
            $flag = $diymodel->insertdiymodel($param);
            if ($flag['code'] == 1) {
                //创建数据表
                
                $sql = "CREATE TABLE `".config('database.prefix')."diy_".$param['tabname']."` (`conid` INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT)";
                Db::execute($sql);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editdiymodel()
    {
        $id = input('param.id');
        $diymodel = new diymodelModel();
        $info = $diymodel->getOnediymodel($id);
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $diymodel->editdiymodel($param);
            if ($flag['code'] == 1 && ($info['tabname'] != $param['tabname'])) {
                //修改数据表名
                $sql = "ALTER TABLE `".config('database.prefix')."diy_".$info['tabname']."` RENAME TO `".config('database.prefix')."diy_".$param['tabname']."`";
                Db::execute($sql);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function deldiymodel()
    {
        $id = input('param.ids');
        $diymodel = new diymodelModel();
        $info = $diymodel->getOnediymodel($id);
        $flag = $diymodel->deldiymodel($id);
        if ($flag['code']) {
            //删除数据表名
            $sql = "DROP TABLE `".config('database.prefix')."diy_".$info['tabname']."`";
            Db::execute($sql);
        }
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortdiymodel()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('diymodel');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }
    //复制模型
    public function copydiymodel()
    {
        $id = input('param.id');
        $diymodel = new diymodelModel();
        $info = $diymodel->getOnediymodel($id)->toArray();
        unset($info['id']);
        $ytabname = $info['tabname'];
        $copytabname = "copy".rand_str(3);
        $info['title'] = $info['title'].$copytabname;
        $info['tabname'] = $info['tabname'].$copytabname;
        $info['type'] = 1;

        $flag = $diymodel->insertdiymodel($info);
        if ($flag['code'] == 1) {
            //复制数据表
            $sql = "CREATE TABLE `".config('database.prefix')."diy_".$info['tabname']."` SELECT * FROM `".config('database.prefix')."diy_".$ytabname."` where 0";
            Db::execute($sql);
            //设置主键
            $sql = "ALTER TABLE `".config('database.prefix')."diy_".$info['tabname']."` modify conid int AUTO_INCREMENT PRIMARY KEY";
            Db::execute($sql);
            //复制字段管理数据
            $jg = $diymodel->copyDiymodelField($ytabname, $info['tabname']);
            if ($jg['code'] != 1) {
            	return $jg;
            }
        }

        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
}
