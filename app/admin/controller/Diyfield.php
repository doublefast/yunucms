<?php
namespace app\admin\controller;
use app\admin\model\DiyfieldModel;
use app\admin\model\DiymodelModel;
use think\Config;
use think\Db;

class Diyfield extends Common
{
    public $fields;
    public function __construct()
    {
        parent::__construct();
        $this->fields = ['text' => '单行文本', 'textarea' => '多行文本', 'seditor' => '简约编辑器', 'editor' => '富文本编辑器', 'file' => '附件', 'image' => '单图上传','images' => '多图上传', 'datetime' => '日期和时间', 'number' => '数字', 'radio' => ' 单选按钮', 'checkbox' => '复选框', 'select' => '下拉框'];
        $this->formtype = [
            'text'=>'varchar',
            'textarea'=>'text',
            'seditor'=>'text',
            'editor'=>'text',
            'file'=>'varchar',
            'image'=>'varchar',
            'images'=>'text',
            'datetime'=>'varchar',
            'radio'=>'text',
            'checkbox'=>'text',
            'number'=>'int',
            'select'=>'text'
        ];
    }

    public function index(){
        $mid = input('mid');
        $diyfield = new DiyfieldModel();
        $infolist = $diyfield->getAllDiyfield($mid);
        foreach ($infolist as $k => $v) {
            $infolist[$k]['tname'] = $v['ftype'] == '------' ?  '分组线' : $this->fields[$v['ftype']];
            $infolist[$k]['title'] = $v['ftype'] == '------' ?  '------' : $v['title'];
            $infolist[$k]['field'] = $v['ftype'] == '------' ?  '------' : $v['field'];
        }
        $diymodel = new diymodelModel();
        $info = $diymodel->getOneDiymodel($mid);

        $this->assign('infolist', $infolist);
        $this->assign('mid', $mid);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function adddiyfield(){
        $mid = input('mid');
        if (request()->isAjax()) {
            $param = input('post.');
            $diyfield = new DiyfieldModel();
            $flag = $diyfield->insertdiyfield($param);
            if ($flag['code'] == 1) {
                //增加字段
                $this->addSql($param);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]); 
        }
        $this->assign('ftypelist', $this->fields);
        $this->assign('mid', $mid);
        return $this->fetch();
    }
    public function editdiyfield(){
        $id = input('id');
        $diyfield = new DiyfieldModel();
        $info = $diyfield->getOneDiyfield($id);
        if (request()->isAjax()) {
            $param = input('post.');
            $flag = $diyfield->editDiyfield($param);
            if ($flag['code'] == 1) {
                //编辑字段
                $this->editSql($param, $info['field']);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]); 
        }
        $this->assign('ftypelist', $this->fields);
        
        $def = $this->getinputstr($info['ftype'], $info['defval'], $info['values']);
        $info['defaultTips'] = $def['typename'];
        $info['defaultValue'] = $def['html'];

        $this->assign('info', $info);
        return $this->fetch();
    }

    public function defaultvalue($defval = '')
    {
        $formtype = input('formtype');
        $strass = $this->getinputstr($formtype);
        return json($strass);
    }

    public function getinputstr($formtype, $defval = '', $values = ''){
        $html = '';
        $typename = '';
        switch ($formtype) {
            case 'text':
                $typename = '默认值';
                $html = '<input class="layui-input" size="60" name="defval" type="text" value="'.$defval.'">';
                break;
            case 'textarea':
                $typename = '默认值';
                $html = '<textarea name="defval" class="layui-textarea">'.$defval.'</textarea>';
                break;
            case 'editor':
                $typename = '默认值';
                $html = '<textarea name="defval" class="layui-textarea">'.$defval.'</textarea>';
                break;
            case 'radio':
                $typename = '单选列表';
                $html = '<textarea name="values" class="layui-textarea">'.$values.'</textarea><font color="red">每行一个值</font>';
                break;
            case 'checkbox':
                $typename = '复选列表';
                $html = '<textarea name="values" class="layui-textarea">'.$values.'</textarea><font color="red">每行一个值</font>';
                break;
            case 'select':
                $typename = '下拉列表';
                $html = '<textarea name="values" class="layui-textarea">'.$values.'</textarea><font color="red">每行一个值</font>';
                break;
            case 'number':
                $typename = '默认值';
                $defval = $defval ? $defval : 0;
                $html = '<input class="layui-input" size="30" lay-verify="number" name="defval" value="'.$defval.'" type="text">';
                break;
        }
        return ['typename' => $typename, 'html' => $html];
    }

    public function deldiyfield()
    {
        $id = input('param.ids');
        $diyfield = new DiyfieldModel();
        $info = $diyfield->getOnediyfield($id);
        $flag = $diyfield->deldiyfield($id);
        if ($flag['code'] == 1) {
            //删除数据表名
            $this->delSql($info);
        }
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    public function sortdiyfield()
    {
        $id = input('param.id');
        $sort = input('param.sort');
        $db = Db::name('diyfield');

        $flag = $db->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    private function addSql($param)
    {
        $diymodel = new diymodelModel();
        $info = $diymodel->getOneDiymodel($param['mid']);
        $tablename = config('database.prefix')."diy_".$info['tabname'];
        $fieldtype = $this->formtype[$param['ftype']];
        $defaultvalue = array_key_exists("defval", $param) ? $param['defval'] : '';
        $length = $param['length'] ? $param['length'] : 0;
        $field = $param['field'];

        switch ($fieldtype) {
            case 'varchar':
                $sql = "ALTER TABLE `{$tablename}` ADD `{$field}` VARCHAR({$length}) DEFAULT '{$defaultvalue}'";
                Db::execute($sql);
                break;
            case 'int':
                $defaultvalue = intval($defaultvalue);
                $sql = "ALTER TABLE `{$tablename}` ADD `{$field}` INT(10) UNSIGNED DEFAULT '{$defaultvalue}'";
                Db::execute($sql);
                break;
            case 'smallint':
                $defaultvalue = intval($defaultvalue);
                $sql = "ALTER TABLE `{$tablename}` ADD `{$field}` SMALLINT(5) UNSIGNED DEFAULT '{$defaultvalue}'";
                Db::execute($sql);
                break;
            case 'text':
                Db::execute("ALTER TABLE `{$tablename}` ADD `{$field}` TEXT");
                break;
        }
    }

    private function editSql($param, $oldfield)
    {
        $diymodel = new diymodelModel();
        $info = $diymodel->getOneDiymodel($param['mid']);
        $tablename = config('database.prefix')."diy_".$info['tabname'];
        $fieldtype = $this->formtype[$param['ftype']];
        $defaultvalue = array_key_exists("defval", $param) ? $param['defval'] : '';
        $length = $param['length'] ? $param['length'] : 0;
        $field = $param['field'];

        switch ($fieldtype) {
            case 'varchar':
                Db::execute("ALTER TABLE `{$tablename}` CHANGE `{$oldfield}` `{$field}` VARCHAR({$length}) DEFAULT '{$defaultvalue}'");
                break;
            case 'int':
                $defaultvalue = intval($defaultvalue);
                Db::execute("ALTER TABLE `{$tablename}` CHANGE `{$oldfield}` `{$field}` INT(10) UNSIGNED  DEFAULT '{$defaultvalue}'");
                break;
            case 'smallint':
                $defaultvalue = intval($defaultvalue);
                Db::execute("ALTER TABLE `{$tablename}` CHANGE `{$oldfield}` `{$field}` SMALLINT(5) UNSIGNED  DEFAULT '{$defaultvalue}'");
                break;
            case 'text':
                Db::execute("ALTER TABLE `{$tablename}` CHANGE `{$oldfield}` `{$field}` TEXT");
                break;
        }
    }

    private function delSql($param)
    {
        $diymodel = new diymodelModel();
        $info = $diymodel->getOneDiymodel($param['mid']);
        $tablename = config('database.prefix')."diy_".$info['tabname'];
        $field = $param['field'];

        Db::execute("ALTER TABLE `{$tablename}` DROP `{$field}`;");
    }

    //添加分组线
    public function adddiyline(){
        $mid = input('mid');
        if (request()->isAjax()) {
            $param = input('post.');
            $param['title'] = "line".rand_str(3);
            $param['field'] = "line".rand_str(3);
            $diyfield = new DiyfieldModel();
            $flag = $diyfield->insertdiyfield($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]); 
        }
        $this->assign('mid', $mid);
        return $this->fetch();
    }
    //编辑分组线
    public function editdiyline(){
        $id = input('id');
        $diyfield = new DiyfieldModel();
        $info = $diyfield->getOneDiyfield($id);
        if (request()->isAjax()) {
            $param = input('post.');
            $flag = $diyfield->editDiyfield($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]); 
        }
        $this->assign('info', $info);
        return $this->fetch();
    }
    //删除分组线
    public function deldiyline()
    {
        $id = input('param.ids');
        $diyfield = new DiyfieldModel();
        $flag = $diyfield->deldiyfield($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

}
