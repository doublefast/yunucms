<?php
namespace app\common\validate;
use think\Validate;

class Link extends Validate
{
	protected $rule = [
        'title|名称'  =>  'require|max:25',
        'url|链接'  =>  'require|max:200',
    ];
}
  