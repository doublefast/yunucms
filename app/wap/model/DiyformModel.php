<?php
namespace app\wap\model;
use think\Model;
use think\Db;
use PHPMailer\PHPMailer;

class DiyformModel extends Model
{
    protected $name = 'diyform';

    public function getAlldiyform()
    {
        return $this->orderRaw('id desc')->select();
    }

    public function insertDiyform($param)
    {
        try{
            $param['status'] = array_key_exists("status", $param) ? 1 : 0;
            $result = $this->validate('DiyformValidate')->save($param);
            if(false === $result){            
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('admin_uid'),session('admin_username'),'用户【'.session('admin_username').'】创建表单成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加表单成功'];
            }
        }catch( PDOException $e){
            
        }
    }

    public function insertForm($param, $mid){
        try{
            $dbfield = DB::name('diyfield');
            foreach ($param as $k => $v) {
                if (is_array($v)) {
                    $param[$k] = implode(',', $v);
                }
                //验证必填
                $fielddata = $dbfield->where(['field'=>$k,'mid'=>$mid])->find();
                if ($fielddata) {
                    if ($fielddata['isnotnull'] == 1) {
                        if (!$v) {
                            return ['status' => 'error', 'msg' => $fielddata['title']."请正确填写！"];
                        }
                    }
                }
            }

            //验证验证码
            if (isset($param['__captcha'.$mid."__"])) {
                $captcha = new \tpcaptcha\Captcha();
                if (!$captcha->check($param['__captcha'.$mid."__"], $mid)) {
                    return ['status' => 'error', 'msg' => "验证错误"];
                }
            }

            $diyformcon = DB::name('diyform')->where(['id'=>$mid])->find();
            $param['fid'] = $mid;
            $param['vid'] = DB::name('form_'.$diyformcon['tabname'])->strict(false)->insertGetId($param);
            $param['create_time'] = time();
            $param['update_time'] = time();
            $param['ip'] = request()->ip();

            $result = DB::name('formcon')->strict(false)->insertGetId($param);
            if(false === $result){            
                return ['status' => 'error', 'msg' => $this->getError()];
            }else{
                                //触发表单提醒机制
                if ($diyformcon['mailwarn'] && $diyformcon['mailadd'] && $diyformcon['mailcontent']) {
                    try {
                        $mail = new PHPMailer(true);
                        $mail->CharSet = 'UTF-8';           //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
                        $mail->IsSMTP();                    // 设定使用SMTP服务
                        $mail->SMTPDebug = 0;               // SMTP调试功能 0=关闭 1 = 错误和消息 2 = 消息
                        $mail->SMTPAuth = true;             // 启用 SMTP 验证功能
                        $mail->SMTPSecure = 'ssl';          // 使用安全协议
                        $mail->Host = config("sys.mail_smtp"); // SMTP 服务器
                        $mail->Port = config("sys.mail_smtpport");                  // SMTP服务器的端口号
                        $mail->Username = config("sys.mail_username");    // SMTP服务器用户名
                        $mail->Password = config("sys.mail_password");     // SMTP服务器密码
                        $mail->SetFrom(config("sys.mail_username"), config("sys.mail_setname"));

                        $mail->Subject = $this->updateMailCon($param, $diyformcon['mailtitle']);
                        $mail->MsgHTML($this->updateMailCon($param, $diyformcon['mailcontent']));
                        $mail->AddAddress($diyformcon['mailadd'], '');
                        $jg =  $mail->Send() ? true : $mail->ErrorInfo;
                        if ($jg != true) {
                            writelog('','','前台发送邮件提醒失败：'.$jg,2);
                        }else{
                            writelog('','','前台发送邮件提醒成功',1);
                        }
                    } catch (\Exception $e) {
                        return ['status' => 'error', 'msg' => "表单邮箱提醒配置错误，请检查，或关闭表单中邮件提醒功能"];
                        writelog('','','前台发送邮件提醒失败',2);
                    }
                }
                
                return ['status' => 'success', 'msg' => '提交成功'];
            }
        }catch( PDOException $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }
    }

    public function updateMailCon($param, $mailcon)
    {
       
        $preg = '/%[\s\S]*?\%/i';
        preg_match_all($preg, $mailcon, $filelist);
        if ($filelist) {
            foreach ($filelist[0] as $k => $v) {
                $filename = str_replace("%", "", $v);
                if (array_key_exists($filename, $param)) {
                    $mailcon = str_replace($v, $param[$filename], $mailcon);
                } 
            }
        }
        return $mailcon;
    }

    public function getOneDiyform($id)
    {
        return $this->where(['id'=>$id])->find();
    }

    public function getOneFormcon($info)
    {
        $tabname = $this->where(['id'=>$info['fid']])->value('tabname');
        $info2 = DB::name('form_'.$tabname)->where(['conid'=>$info['vid']])->find();
        return array_merge($info, $info2);
    }
}