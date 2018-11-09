<?php
namespace app\common\validate;
use think\Validate;

class DiyfieldValidate extends Validate
{
	protected $rule = [
        'title|字段名称'  =>  'require|max:20|min:2',
        'field|字段名'  =>  'require|max:20|min:2',
    ];
}
  