<?php
namespace app\common\validate;
use think\Validate;

class Link extends Validate
{
	protected $rule = [
        'title|名称'  =>  'require|max:25',
        'url|链接'  =>  'require|max:200',
    ];

    /*$msg = [
	    'name.max'     => '名称最多不能超过25个字符',
	    'age.number'   => '年龄必须是数字',
	    'age.between'  => '年龄必须在1~120之间',
	    'email'        => '邮箱格式错误',
	];*/
}
  