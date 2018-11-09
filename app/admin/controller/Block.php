<?php
namespace app\admin\controller;
use app\admin\model\BlockModel;
use app\admin\model\BlockcategoryModel;
use think\Db;

class Block extends Common
{
	public function category(){
        $Bcmodel = new BlockcategoryModel();
        $infolist = $Bcmodel->getAllBlockcategory();
        $Bmodel = new BlockModel();
        foreach ($infolist as $k => $v) {
        	$infolist[$k]['count'] = $Bmodel->getCountBlock($v['id']);
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }
    public function addcategory()
    {
        if(request()->isAjax()){
            $param = input('post.');
           	$Bcmodel = new BlockcategoryModel();
            $flag = $Bcmodel->insertBlockcategory($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editcategory()
    {
        $Bcmodel = new BlockcategoryModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $Bcmodel->editBlockcategory($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $this->assign('info', $Bcmodel->getOneBlockcategory($id));
        return $this->fetch();
    }

    public function delcategory()
    {
        $id = input('param.ids');
        $Bcmodel = new BlockcategoryModel();
        $flag = $Bcmodel->delBlockcategory($id);

        $Bmodel = new BlockModel();
        $flag1 = $Bmodel->delBlockBycid($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortcategory()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('block_category');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
        
    }

    public function index(){

    	$cid = input('cid');
    	$where = ['cid'=>$cid];

        $Block = new BlockModel();

        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config("paginate.list_rows");
        $count = $Block->getCountBlock($cid);// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面

        

        $infolist = $Block->getAllBlock($where, $Nowpage, $limits);   
        foreach ($infolist as $k => $v) {
        	$tname = "";
        	switch ($v['type']) {
        		case '1':
        			$tname = "文本";
        			break;
        		case '2':
        			$tname = "图片";
        			break;
        		case '3':
        			$tname = "丰富";
        			break;
        	}
        	$infolist[$k]['tname'] = $tname;
        }

        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('count', $count);

        $this->assign('cid', $cid);
        if(input('get.page')){

            return json($infolist);
        }
        return $this->fetch();
    }

    public function addblock()
    {
    	$cid = input('cid');
        if(request()->isAjax()){
            $param = input('post.');
            $Block = new BlockModel();
            $flag = $Block->insertBlock($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $Bcmodel = new BlockcategoryModel();
        $this->assign('cid', $cid);
        $this->assign('clist', $Bcmodel->getAllBlockcategory());
        return $this->fetch();
    }

    public function editblock()
    {
        $Block = new BlockModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $Block->editBlock($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $Bcmodel = new BlockcategoryModel();
        $this->assign('info', $Block->getOneBlock($id));
        $this->assign('clist', $Bcmodel->getAllBlockcategory());
        return $this->fetch();
    }

    public function delblock()
    {
        $id = input('param.ids');
        $Block = new BlockModel();
        $flag = $Block->delBlock($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    
}
