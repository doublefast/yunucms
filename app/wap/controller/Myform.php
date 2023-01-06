<?php
namespace app\wap\controller;
use think\Db;
use app\wap\model\DiyformModel;

class Myform extends Common
{
	public function index(){
		$param = input();
		$returntype = isset($param['__returntype__']) && $param['__returntype__'] == 'json' ? 'json' : 'default';
		if (!isset($param['__formid__']) || !isset($param['__token__'])) {
			$info = ['status'=>'error','msg'=>'参数异常请不要非法操作!'];
			return $this->onresponse($info, $returntype); exit();
		}
		/*if ($param['__token__'] != session('__token__')) {
			$info = ['status'=>'error','msg'=>'令牌验证验证失败!'];
			return $this->onresponse($info, $returntype);
			exit();
		}*/
		$diyform = new DiyformModel();
		$info = $diyform->getOnediyform($param['__formid__']);
		if (!$info) {
			$info = ['status'=>'error','msg'=>'表单类别不存在!'];
			return $this->onresponse($info, $returntype); exit();
		}
		$info = $diyform->insertForm($param,$info['id']);
		return $this->onresponse($info, $returntype);

	}
	public function captcha(){
		$fid = input('id');
		$captcha = new \tpcaptcha\Captcha();
		return $captcha->entry($fid);
	}
	private function onresponse($info, $returntype){
		if ($returntype == 'default') {
			if ($info['status'] == 'error') {
				$this->error($info['msg']);
			}else{
				$this->success($info['msg']);
			}
			exit();
		}else{
			return json($info);
		}
	}
}
?>