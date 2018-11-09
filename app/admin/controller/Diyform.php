<?php
namespace app\admin\controller;
use app\admin\model\DiyformModel;
use app\admin\model\DiyfieldModel;
use app\admin\model\FormconModel;
use think\Config;
use think\Db;
use PHPMailer\PHPMailer;

class Diyform extends Common
{
    public $fields;
    public function __construct()
    {
        parent::__construct();
        $this->fields = ['text' => '单行文本','number' => '数字', 'textarea' => '多行文本','radio' => ' 单选按钮', 'checkbox' => '复选框', 'select' => '下拉框'];
        $this->formtype = [
            'text'=>'varchar',
            'textarea'=>'text',
            'radio'=>'text',
            'checkbox'=>'text',
            'number'=>'int',
            'select'=>'text'
        ];
    }

    public function index(){

        $diyform = new diyformModel();
        $diyfield = new diyfieldModel();
        $formcon = new formconModel();
        $infolist = $diyform->getAlldiyform(); 
        foreach ($infolist as $k => $v) {
            $infolist[$k]['fcount'] = $diyfield->getCountDiyfield($v['id'], 3);
            $infolist[$k]['wdcount'] = $formcon->getCountFormcon(['fid'=>$v['id'],'look'=>0]);
            $infolist[$k]['xxcount'] = $formcon->getCountFormcon(['fid'=>$v['id']]);
        }
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    public function adddiyform()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $diyform = new diyformModel();
            $flag = $diyform->insertdiyform($param);
            if ($flag['code'] == 1) {
                //创建数据表
                $sql = "CREATE TABLE `".config('database.prefix')."form_".$param['tabname']."` (`conid` INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT)";
                Db::execute($sql);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }

    public function editdiyform()
    {
        $id = input('param.id');
        $diyform = new diyformModel();
        $info = $diyform->getOnediyform($id);
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $diyform->editdiyform($param);
            if ($flag['code'] == 1 && ($info['tabname'] != $param['tabname'])) {
                //修改数据表名
                $sql = "ALTER TABLE `".config('database.prefix')."form_".$info['tabname']."` RENAME TO `".config('database.prefix')."form_".$param['tabname']."`";
                Db::execute($sql);
            }
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $diyfield = new diyfieldModel();
        $fieldlist = $diyfield->getAllDiyfield($id, 3);

        $this->assign('info', $info);
        $this->assign('fieldlist', $fieldlist);
        return $this->fetch();
    }

    public function deldiyform()
    {
        $id = input('param.ids');
        $diyform = new diyformModel();
        $info = $diyform->getOnediyform($id);
        $flag = $diyform->deldiyform($id);
        if ($flag['code']) {
            //删除数据表名
            $sql = "DROP TABLE `".config('database.prefix')."form_".$info['tabname']."`";
            Db::execute($sql);
        }
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    //复制模型
    public function copydiyform()
    {
        $id = input('param.id');
        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($id)->toArray();
        unset($info['id']);
        $ytabname = $info['tabname'];
        $copytabname = "copy".rand_str(3);
        $info['title'] = $info['title'].$copytabname;
        $info['tabname'] = $info['tabname'].$copytabname;

        $flag = $diyform->insertdiyform($info);
        if ($flag['code'] == 1) {
            //复制数据表
            $sql = "CREATE TABLE `".config('database.prefix')."form_".$info['tabname']."` SELECT * FROM `".config('database.prefix')."form_".$ytabname."` where 0";
            Db::execute($sql);
            //设置主键
            $sql = "ALTER TABLE `".config('database.prefix')."form_".$info['tabname']."` modify conid int AUTO_INCREMENT PRIMARY KEY";
            Db::execute($sql);
            //复制字段管理数据
            $jg = $diyform->copyDiyformField($ytabname, $info['tabname']);
            if ($jg['code'] != 1) {
            	return $jg;
            }
        }

        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
    //表单内容管理
    public function formcon()
    {
        $id = input('param.fid');
        $map = ['fid'=>$id];
        $formcon = new formconModel();
        //是否导出
        if (input('param.type') == 'daochu') {
            $infolist = Db::name('formcon')->where($map)->select();
            foreach($infolist as $k=>$v){
                $infolist[$k] = $formcon->getOneFormcon($v['id']);
                $infolist[$k]['create_time']=date('Y-m-d H:i:s',$v['create_time']);
            }

            //显示抬头
            $fieldlist = Db::name('diyfield')->where(['mid'=>$id,'type'=>3])->select();

            $filesname = iconv("utf-8", "gb2312", "data".time());
            header("Content-type:application/vnd.ms-excel");
            header("Content-Disposition:attachment;filename="."data".time().".xls");

            echo "ID\t";
            echo "提交时间\t";
            echo "IP\t";
            echo "已读\t";
            foreach ($fieldlist as $k => $v) {
                echo $v['title']."\t";
            }
            echo "\n";
            if (!empty($infolist)){
                foreach($infolist as $k=>$v){
                    echo $v['id']."\t";
                    echo $v['create_time']."\t";
                    echo $v['ip']."\t";
                    if ($v['look']) {
                        echo "已读\t";
                    }else{
                        echo "未读\t";
                    }

                    foreach ($fieldlist as $k1 => $v1) {
                        echo $v[$v1['field']]."\t";
                    }
                    echo "\n";
                }
            }
            exit();
        }else{
            $Nowpage = input('get.page') ? input('get.page'):1;
            $limits = config("paginate.list_rows");
            $count = Db::name('formcon')->where($map)->count();// 获取总条数
            $allpage = intval(ceil($count / $limits));//计算总页面
            $lists = Db::name('formcon')->where($map)->page($Nowpage, $limits)->order('create_time desc')->select();       
            foreach($lists as $k=>$v){
                $lists[$k] = $formcon->getOneFormcon($v['id']);
                $lists[$k]['create_time']=date('Y-m-d H:i:s',$v['create_time']);
            }
            $this->assign('Nowpage', $Nowpage); //当前页
            $this->assign('allpage', $allpage); //总页数 
            $this->assign('count', $count);
            $this->assign('fid', $id);
            if(input('get.page')){
                return json($lists);
            }

            //显示抬头
            $fieldlist = Db::name('diyfield')->where(['mid'=>$id,'remark'=>1,'type'=>3])->order('sort asc')->select();
            $this->assign([
                'fieldlist' => $fieldlist,
            ]);
            return $this->fetch();
        }
    }
    public function delformcon(){
        $ids = input('param.ids');
        $formcon = new FormconModel();
        $flag = $formcon->delFormcon($ids);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
    public function editformcon(){
        $diyform = new DiyformModel();
        $diyfield = new DiyfieldModel();
        $formcon = new formconModel();

        $id = input('id');
        $info = $formcon->getOneFormcon($id);
        $formcon->editlook($id);
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $formcon->editFormcon($param,$info['fid']);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        
        $fieldlist = $diyfield->getAllDiyfield($info['fid'], 3);
        $fieldhtml = $this->admfieldformat($fieldlist, $info);

        $this->assign([
            'info' => $info,
            'fieldhtml' => $fieldhtml,
        ]);
        return $this->fetch();
    }
    //------------------------------------------------------
    
    public function diyfield(){
        $mid = input('mid');
        $diyfield = new DiyfieldModel();
        $infolist = $diyfield->getAllDiyfield($mid,3);
        foreach ($infolist as $k => $v) {
            $infolist[$k]['tname'] = $this->fields[$v['ftype']];
        }

        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($mid);

        $this->assign('infolist', $infolist);
        $this->assign('mid', $mid);
        $this->assign('info', $info);
        return $this->fetch();
    }

    public function adddiyfield(){
        $mid = input('mid');
        if (request()->isAjax()) {
            $param = input('post.');
            $param['type'] = 3;
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
    public function showcode(){
        $id = input('param.id');
        $diyfield = new DiyfieldModel();
        $infolist = $diyfield->getAllDiyfield($id,3);

        $html = $this->fieldformat($infolist, $id);
        $html = htmlentities($html);
        $html = str_replace('&lt;br&gt;','<br/>', $html);
        echo $html;
    }
    private function admfieldformat($fiellist,$vallist = []){
        $html = '';
        $script = '';
        foreach ($fiellist as $k => $v) {
            $req = $v['isnotnull'] ? 'lay-verify="required"' : "";
            $val = array_key_exists($v['field'], $vallist) ? $vallist[$v['field']] : $v['defval'];

            switch ($v['ftype']) {
                case 'text'://单行文本
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input class="layui-input" type="text" name="'.$v['field'].'" value="'.$val.'" placeholder='.$v['title'].' '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                case 'textarea'://多行文本
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<textarea name="'.$v['field'].'" placeholder="'.$v['title'].'" class="layui-textarea w700" '.$req.'>'.$val.'</textarea>';
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                case 'number'://数字
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input name="'.$v['field'].'" lay-verify="number" autocomplete="off" value="'.$val.'" placeholder="'.$v['title'].'" class="layui-input" type="text" style="width: 300px;" '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                case 'radio'://单选按钮
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width:450px;">';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "checked" : '';
                        $html .= '<input type="radio" name="'.$v['field'].'" value="'.$v1.'" title="'.$v1.'" '.$check.'>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
                    
                    break;
                case 'checkbox'://复选框
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-block" style="width:450px;">';

                    $a = 0;
                    $valarr = $val ? explode(',', $val) : [];
                    foreach ($values as $k1 => $v1) {
                        $check = in_array($v1, $valarr) ? 'checked' : '';
                        $html .= '<input type="checkbox" name="'.$v['field'].'['.$a.']" value="'.$v1.'" title="'.$v1.'"  '.$check.'/>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                case 'select'://下拉框
                    $values = explode("\n", $v['values']);
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width: 300px">';
                    $html .= '<select data-val="true" name="'.$v['field'].'" '.$req.'>';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "selected" : '';
                        $html .= '<option value="'.$v1.'" '.$check.'>'.$v1.'</option>';
                        $a ++ ;
                    }
                                
                    $html .= '</select>';
                    $html .= '</div>';
                    $html .= '</div>';
                    break;
                default:
                    break;
            }
        }
        return ['html'=>$html, 'script'=>$script];
    }
    private function fieldformat($fiellist, $id){
        $html = '';
        $html = '<form id="myform'.$id.'" method="post" action="<yunu:url name=\'form\'>"><br><br>';
        $html .= '<input type="hidden" name="__token__" value="{$Request.token}" ><br><br>';
        $html .= '<input type="hidden" name="__formid__" value="'.$id.'" ><br><br>';
        $html .= '<input type="hidden" name="__returntype__" value="default" ><!--返回类型可选 default/json --><br><br>';
        foreach ($fiellist as $k => $v) {
            $val = $v['defval'];
            $html .= $v['title']."：";
            switch ($v['ftype']) {
                case 'text'://单行文本
                    $html .= '<input type="text" name="'.$v['field'].'" value="'.$val.'" >';
                    $html .= '<br><br>';
                    break;
                case 'textarea'://多行文本
                    $html .= '<textarea name="'.$v['field'].'">'.$val.'</textarea>';
                    $html .= '<br><br>';
                    break;
                case 'radio'://单选按钮
                    $values = explode("\n", $v['values']);
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "checked" : '';
                        $html .= '<input type="radio" name="'.$v['field'].'" value="'.$v1.'" title="'.$v1.'" '.$check.'>&nbsp;'.$v1;
                        $a ++ ;
                    }
                    $html .= '<br><br>';
                    break;
                case 'number'://数字
                    $val = $val == 0 ? '' : $val;
                    $html .= '<input name="'.$v['field'].'" value="'.$val.'" type="text" >';
                    $html .= '<br><br>';
                    break;
                case 'checkbox'://复选框
                    $values = explode("\n", $v['values']);
                    $a = 0;
                    $valarr = $val ? explode(',', $val) : [];
                    foreach ($values as $k1 => $v1) {
                        $check = in_array($v1, $valarr) ? 'checked' : '';
                        $html .= '<input type="checkbox" name="'.$v['field'].'['.$a.']" value="'.$v1.'" title="'.$v1.'"  '.$check.'/>&nbsp;'.$v1;
                        $a ++ ;
                    }
                    $html .= '<br><br>';
                    break;
                case 'select'://下拉框
                    $values = explode("\n", $v['values']);
                    $html .= '<select name="'.$v['field'].'" >';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "selected" : '';
                        $html .= '<option value="'.$v1.'" '.$check.'>'.$v1.'</option>';
                        $a ++ ;
                    }       
                    $html .= '</select>';
                    $html .= '<br><br>';
                    break;
                default:
                    break;
            }
        }
        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($id);
        if ($info['yzcode'] == 1) {
            $html .= '验证码：<input type="text" name="__captcha'.$id.'__" value="" ><br><br>';
            $html .= '<img src="<yunu:url name=\'captcha\' id=\''.$id.'\'>" onclick="this.src=\'<yunu:url name=\'captcha\' id=\''.$id.'\'>\'" /><br><br>';
        }

        $html .= '<input type="submit" value="提交">';
        $html .= '<br><br>';
        $html .= '</form>';
        return $html;
    }

    private function addSql($param)
    {
        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($param['mid']);
        $tablename = config('database.prefix')."form_".$info['tabname'];
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
        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($param['mid']);
        $tablename = config('database.prefix')."form_".$info['tabname'];
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
        $diyform = new diyformModel();
        $info = $diyform->getOneDiyform($param['mid']);
        $tablename = config('database.prefix')."form_".$info['tabname'];
        $field = $param['field'];

        Db::execute("ALTER TABLE `{$tablename}` DROP `{$field}`;");
    }

    public function remind()
    {
        $coffile = CONF_PATH.DS.'extra'.DS.'sys.php';
        if(request()->isAjax()){
            Config::load($coffile, '', 'sys');
            $conflist = Config::get('','sys');
            $param = input('post.');  
            unset($param['mail_demo']);
            $param = add_slashes_recursive($param);

            setConfigfile($coffile, add_slashes_recursive(array_merge($conflist, $param)));
            return json(['code' => 1, 'data' => '', 'msg' => '更新设置成功']);
            exit();
        }

        return $this->fetch();
    }
    public function demomail(){
        
            $param = input('param.');

            $mail = new PHPMailer(true);
            $mail->CharSet = 'UTF-8';           //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
            $mail->IsSMTP();                    // 设定使用SMTP服务
            $mail->SMTPDebug = 0;               // SMTP调试功能 0=关闭 1 = 错误和消息 2 = 消息
            $mail->SMTPAuth = true;             // 启用 SMTP 验证功能
            $mail->SMTPSecure = 'ssl';          // 使用安全协议
            $mail->Host = $param['mail_smtp']; // SMTP 服务器
            $mail->Port = $param['mail_smtpport'];                  // SMTP服务器的端口号
            $mail->Username = $param['mail_username'];    // SMTP服务器用户名
            $mail->Password = $param['mail_password'];     // SMTP服务器密码
            $mail->SetFrom($param['mail_username'], $param['mail_setname']);

            $mail->Subject = "云优CMS_测试邮件";
            $mail->MsgHTML("当您看到此封邮件时，说明邮件提醒配置参数已经配置成功，感谢您的使用！");
            $mail->AddAddress($param['mail_demo'], '');
            $jg =  $mail->Send() ? true : $mail->ErrorInfo;
            if ($jg != true) {
                return json(['code' => 2, 'data' => '', 'msg' => '测试邮件发送失败：'.$jg]);
            }else{
                return json(['code' => 1, 'data' => '', 'msg' => '测试邮件发送成功']);
            }
        
    }
}
