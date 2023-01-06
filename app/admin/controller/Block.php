<?php
namespace app\admin\controller;
use app\admin\model\BlockModel;
use app\admin\model\BlockcategoryModel;
use think\Db;

class Block extends Common
{
	public function blocklist(){
        $Bcmodel = new BlockcategoryModel();
        $infolist = $Bcmodel->getAllBlockcategory();
        $Bmodel = new BlockModel();
        foreach ($infolist as $k => $v) {
            $blocklist = $Bmodel->getAllBlock(['cid'=>$v['id']], 1, 100); 
            if ($blocklist) {
                $infolist[$k]['blockstr'] = $this->fieldformat($blocklist);
            }else{
                unset($infolist[$k]);
            }
            
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

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
        return json(['code' => 1, 'data' => '', 'msg' => '已更新']);
        
    }

    public function index(){
        $cid = input('cid');
        $where = ['cid'=>$cid];

        $Block = new BlockModel();

        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config("sys.admin_list_rows") ? config("sys.admin_list_rows") : 10;
        $count = $Block->getCountBlock($cid);// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面

        

        $infolist = $Block->getAllBlock($where, $Nowpage, $limits);   
        foreach ($infolist as $k => $v) {
            $tname = "";
            switch ($v['type']) {
                case '1':
                    $tname = "多行文本";
                    break;
                case '2':
                    $tname = "图片";
                    break;
                case '3':
                    $tname = "丰富";
                    break;
                case '4':
                    $tname = "单行文本";
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

            $indexact = controller('Index');
            $indexact->cache();

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

            $indexact = controller('Index');
            $indexact->cache();

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

    public function saveblock()
    {
        if(request()->isAjax()){
            $db = db('block');
            $param = input('post.');
            foreach ($param as $k => $v) {
                if ($k != 'file') {
                    $db->where(['title'=>$k])->setField(['content'=>$v]);
                }
            }

            $indexact = controller('Index');
            $indexact->cache();

            return json(['code' => 1, 'data' => '', 'msg' => '更新完成']);
        }
    }
    private function fieldformat($fiellist){
        $html = '';
        $script = '';
        $ueditor = '';
        foreach ($fiellist as $k => $v) {
            $req = "";
            $val = $v['content'];
            switch ($v['type']) {
                case '4'://文本
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['remark'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input class="layui-input" type="text" name="'.$v['title'].'" value="'.$val.'" placeholder='.$v['remark'].' '.$req.'> ';
                    $html .= '</div>';
                    $html .= '<font class="font_tip w150">[ <a class="doshowrel" rel="&lt;yunu:block name=&quot;'.$v['title'].'&quot; /&gt;">获取调用标签</a> ]</font>';
                    $html .= '</div>';
                    break;
                case '2'://图片
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['remark'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input id="path'.$v['id'].'" class="layui-input" type="text" name="'.$v['title'].'" value="'.$val.'">';
                    $html .= '<br><img id="img_path'.$v['id'].'" class="defimg" src="'.$val.'" onerror="javascript:this.style.display=\'none\';">';
                    $html .= '<font class="font_tip w150 clear" style="display:block;">[ <a class="doshowrel" rel="&lt;yunu:block name=&quot;'.$v['title'].'&quot; /&gt;">获取调用标签</a> ]</font>';
                    $html .= '</div>';
                    $html .= '<div class="layui-input-inline w150">';
                    $html .= '<input type="button" rel="path'.$v['id'].'" value="选择站内图片" class="fl BrowerPicture file_btn" />';
                    $html .= '<div class="site-demo-upload upload-img fl ml5">';
                    $html .= '<div class="site-demo-upbar">';
                    $html .= '<input type="file" name="file" class="layui-upload-file" id="upload-image'.$v['id'].'">';
                    $html .= '</div>';

                    $html .= '</div>';
                    $html .= '</div>';

                    $html .= '</div>';

                    $script .= 'layui.upload({';
                    $script .= 'url: "'.url('Upload/upload',['file'=>'file']).'"';
                    $script .= ',before: function(input){';
                    $script .= '}';
                    $script .= ',title:"上传图片"';
                    $script .= ',elem: "#upload-image'.$v['id'].'" ';
                    $script .= ',method: "post"';
                    $script .= ',ext: "'.str_replace(',','|',config('sys.upload_image_ext')).'"';
                    $script .= ',type:"images"';
                    $script .= ',success: function(data){';
                    $script .= 'if(data.status == 1){';
                    $script .= '$("#path'.$v['id'].'").val(data.image_name);';
                    $script .= '$("#img_path'.$v['id'].'").attr("src", data.image_name).show();';
                    $script .= '}else{';
                    $script .= 'alert(data.error_info);';
                    $script .= '}';
                    $script .= '}';
                    $script .= '});';

                    break;
                case '3'://富文本
                    $html .= '<div class="layui-form-item layui-form-item-flex">';
                    $html .= '<label class="layui-form-label">'.$v['remark'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<script name="'.$v['title'].'" type="text/plain" id="'.$v['title'].'" '.$req.'>'.$val.'</script>';
                    $html .= '<font class="font_tip w150">[ <a class="doshowrel" rel="&lt;yunu:block name=&quot;'.$v['title'].'&quot; /&gt;">获取调用标签</a> ]</font>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $ueditor .= 'UE.getEditor("'.$v['title'].'", {initialFrameWidth:"100%"});';//{autoFloatEnabled:true}
                    break;
                case '1'://多行文本
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['remark'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<textarea name="'.$v['title'].'" placeholder="'.$v['remark'].'" class="layui-textarea w700" '.$req.'>'.$val.'</textarea>';
                    $html .= '<font class="font_tip w150">[ <a class="doshowrel" rel="&lt;yunu:block name=&quot;'.$v['title'].'&quot; /&gt;">获取调用标签</a> ]</font>';
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                default:
                    break;
            }
        }
        return ['html'=>$html, 'script'=>$script, 'ueditor'=>$ueditor];
    }
}
