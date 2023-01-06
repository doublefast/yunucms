<?php
namespace app\common\validate;
use think\Validate;

class AreaValidate extends Validate
{
	protected $rule = [
        'etitle|英文名称'  =>  'require|unique:area',
    ];
}
  