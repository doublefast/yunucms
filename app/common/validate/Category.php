<?php
namespace app\common\validate;
use think\Validate;

class Category extends Validate
{
	protected $rule = [
        'title|分类名称'  =>  'require',
        'etitle|别名'  =>  'require|unique:category|checkEtitle:thinkphp',
        'mid|模型'  =>  'require',
        'subtitle|副标题'  =>  'max:200',
    ];

    protected function checkEtitle($value, $rule, $data)
    {
    	return is_numeric($value) ? '别名错误，不能为纯数字' : true;
    }
    /*$msg = [
	    'name.max'     => '名称最多不能超过25个字符',
	    'age.number'   => '年龄必须是数字',
	    'age.between'  => '年龄必须在1~120之间',
	    'email'        => '邮箱格式错误',
	];*/
}
  