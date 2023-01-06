<?php
namespace app\admin\controller;
use app\admin\model\SitelinkModel;
use think\Db;

class Sitelink extends Common
{
    public function index(){
        $Sitelink = new SitelinkModel();

        $key = input('key');
        $gopage = input('gopage') ? input('gopage') : 1;

        $where = [];
        if($key && $key !== ""){
            $where['name'] =  ['like', "%$key%"];          
        }

        $Nowpage = input('get.page') ? input('get.page') : 1;
        $limits = config("sys.admin_list_rows") ? config("sys.admin_list_rows") : 10;
        $count = $Sitelink->getSitelinkCount($where);
        $allpage = intval(ceil($count / $limits));
        $infolist = $Sitelink->getSitelinkByWhere($where, $Nowpage, $limits); 
        foreach ($infolist as $k => $v) {
            $infolist[$k]['gopage'] = $Nowpage;
        }
        $this->assign([
            'infolist' => $infolist,
            'Nowpage' => $Nowpage,
            'allpage' => $allpage,
            'count' => $count,
            'gopage' => $gopage
        ]);
        if(input('get.page')){
            return json($infolist);
        }
        return $this->fetch();
    }

    public function addsitelink()
    {
        $linktype = input('param.type');
        if(request()->isAjax()){
            $param = input('post.');
            $Sitelink = new SitelinkModel();
            if ($linktype == "") {
                $flag = $Sitelink->insertSitelink($param);
                return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
            }
            if ($linktype == 'manyonesitelink') {
                $names = explode("\n", $param['name']);
                $success = 0;
                $error = 0;
                foreach ($names as $k => $v) {
                	if ($v) {
                		$param['name'] = $v;
	                    $flag = $Sitelink->insertSitelink($param);
	                    if ($flag['code']) {
	                        $success ++;
	                    }else{
	                        $error ++;
	                    }
                	}
                }
                return json(['code' => 1, 'data' => '', 'msg' => "多对一添加结果：成功：$success 失败：$error"]);
            }
           	if ($linktype == 'manymanysitelink') {
                $names = explode("\n", $param['name']);
                $urls = explode("\n", $param['url']);
                $wapurls = explode("\n", $param['wapurl']);
                if (count($names) != count($urls) || count($urls) != count($wapurls)) {
                    return json(['code' => -1, 'data' => '', 'msg' => "请检查关键词名称和链接地址对应关系"]);
                    exit();
                }
                $success = 0;
                $error = 0;
                foreach ($names as $k => $v) {
                	if ($v && $urls[$k] && $wapurls[$k]) {
                		$param['name'] = $v;
	                    $param['url'] = $urls[$k];
	                    $param['wapurl'] = $wapurls[$k];
	                    $flag = $Sitelink->insertSitelink($param);
	                    if ($flag['code']) {
	                        $success ++;
	                    }else{
	                        $error ++;
	                    }
                	}
                }
                return json(['code' => 1, 'data' => '', 'msg' => "多对多添加结果：成功：$success 失败：$error"]);
            }
        }
        $linktype = in_array($linktype, ['', 'manyonesitelink', 'manymanysitelink']) ? $linktype : '';
        return $this->fetch($linktype);
    }

    public function editsitelink()
    {
        $Sitelink = new SitelinkModel();
        $gopage = input('gopage') ? input('gopage') : 1;
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $Sitelink->editSitelink($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $this->assign([
            'info'=>$Sitelink->getOneSitelink($id),
            'gopage' => $gopage
        ]);
        return $this->fetch();
    }

    public function delsitelink()
    {
        $id = input('param.ids');
        $Sitelink = new SitelinkModel();
        $flag = $Sitelink->delSitelink($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function statesitelink()
    {
        $id = input('param.id');
        $db = Db::name('sitelink');
        $status = $db->where(['id'=>$id])->value('status');//判断当前状态
        if($status == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>0]);
            return json(['code' => 1, 'data' => '', 'msg' => '已禁止']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['status'=>1]);
            return json(['code' => 0, 'data' => '', 'msg' => '已开启']);
        }
    }
}
