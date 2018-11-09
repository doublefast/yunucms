<?php
namespace app\common\validate;
use think\Validate;

class DiymodelValidate extends Validate
{
    protected $rule = [
        ['title|模型名称', 'require|unique:diymodel|max:60', '模型名称已经存在'],
        ['tabname|数据表名', 'require|unique:diymodel|max:20', '数据表名已经存在']
    ];

}
  