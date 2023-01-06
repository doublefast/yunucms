<?php
namespace app\admin\controller;
use app\admin\model\TagurlModel;
use think\Db;

class Tagurl extends Common
{
    public function index(){
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config("sys.admin_list_rows") ? config("sys.admin_list_rows") : 10;
        $key = input('key');

        $where = "";
        if($key && $key !== ""){
            $where =  "tagname LIKE '%".$key."%' OR tagurl LIKE '%".$key."%'";          
        }

        $count = Db::name('tagurl')->where($where)->count();// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面
        $infolist = Db::name('tagurl')->where($where)->page($Nowpage, $limits)->orderRaw('id desc')->select();      
        foreach ($infolist as $k => $v) {
            $infolist[$k]['showurl'] = config('sys.url_model') == 1 ? "/index.php?s=index/tag/index&title=".$v['tagurl'] : "/tag/".$v['tagurl'];
        }
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('count', $count);
        if(input('get.page')){
            return json($infolist);
        }
        return $this->fetch();
    }

    public function addtagurl()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $tagurl = new TagurlModel();
            $flag = $tagurl->insertTagurl($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function batchaddtagurl()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $tagurl = new TagurlModel();

            $names = explode("\n", $param['name']);
            $urls = explode("\n", $param['url']);
            if (count($names) != count($urls)) {
                return json(['code' => -1, 'data' => '', 'msg' => "请检查TAG名称和URL别名是否一一对应"]);
                exit();
            }
            $success = 0;
            $error = 0;
            foreach ($names as $k => $v) {
                if ($v && $urls[$k]) {
                    $data['tagname'] = $v;
                    $data['tagurl'] = $urls[$k];
                    $flag = $tagurl->insertTagurl($data);
                    if ($flag['code']) {
                        $success ++;
                    }else{
                        $error ++;
                    }
                }
            }
            return json(['code' => 1, 'data' => '', 'msg' => "批量添加结果：成功：$success 失败：$error"]);
        }
        return $this->fetch();
    }

    public function edittagurl()
    {
        $tagurl = new TagurlModel();
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $tagurl->editTagurl($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $info = $tagurl->getOneTagurl($id);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function deltagurl()
    {
        $id = input('param.ids');
        $tagurl = new TagurlModel();
        $flag = $tagurl->delTagurl($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function allcontag()
    {
        $where['create_time'] = ['lt',time()];
        $where['tag'] = ['neq',''];
        $taglist = db('content')->where($where)->orderRaw('id desc')->select();
        $tagstrlist = [];
        foreach ($taglist as $k => $v) {
            $str = $v['tag'];
            $str = str_replace("{标题名称}", $v['title'], $str);
            $str = str_replace("[prov]", "", $str);
            $str = str_replace("[city]", "", $str);
            $str = str_replace("[prov_or_city]", "", $str);

            $jgf = strpos($str, '，') ? '，' : ',';
            $strlist = explode($jgf, $str);
            $tagstrlist = array_merge($tagstrlist, $strlist);
        }
        $tagstrlist = array_unique($tagstrlist);
        $tagdb = db('tagurl');
        $tagdblist = $tagdb->orderRaw('id desc')->column('tagname');
        $tagurl = new TagurlModel();
        $num = 0;
        foreach ($tagstrlist as $k => $v) {
            if (!in_array($v, $tagdblist)) {
                $v = trim($v);
                $v = str_replace(" ", "", $v);//特殊字符1
                $v = str_replace(" ", "", $v);//特殊字符2
                $v = urlencode($v);
                $v = str_replace("%E2%80%8B", "", $v);
                $v = urldecode($v);

                $py = get_pinyin(iconv('utf-8', 'gb2312//ignore', $v), 0);
                if(!$tagdb->where(['tagurl'=>$py])->find()){
                    $tagurl->insertTagurl(['tagname'=>$v,'tagurl'=>$py]);
                    $num ++;
                }
            }
        }
        return json(['code' => 1, 'msg' => $num == 0 ? "无数据可更新" : '已新增'.$num."条记录"]);
    }
}
