<?php
namespace app\common\validate;
use think\Validate;

class BlockValidate extends Validate
{
    protected $rule = [
        ['title', 'unique:block', '自定义块名称已经存在']
    ];
}