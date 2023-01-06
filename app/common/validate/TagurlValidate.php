<?php
namespace app\common\validate;
use think\Validate;

class TagurlValidate extends Validate
{
	protected $rule = [
        'tagname|TAG名称'  =>  'require|unique:tagurl',
        'tagurl|URL别名'  =>  'require|unique:tagurl',
    ];
}
  