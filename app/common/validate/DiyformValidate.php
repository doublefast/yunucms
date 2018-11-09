<?php
namespace app\common\validate;
use think\Validate;

class DiyformValidate extends Validate
{
    protected $rule = [
        ['title|表单名称', 'require|unique:diyform|max:60', '表单名称已经存在'],
        ['tabname|数据表名', 'require|unique:diyform|max:20', '数据表名已经存在']
    ];

}
  