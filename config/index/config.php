<?php
use think\Config;

return [
    'view_replace_str'       => [
        '__PUBLIC__' =>  '/template/'.config('sys.theme_style').'/index',
        '__INSTALL__' =>  '/app/index/view/public',
    ],
    // URL伪静态后缀
    'url_html_suffix'        => 'html',
    'default_filter'         => 'addslashes,strip_tags,htmlspecialchars',
    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => ROOT_PATH.'template'.DS . config('sys.theme_style'). DS . 'index' . DS,
        // 模板后缀
        'view_suffix'  => 'html',
        // 模板文件名分隔符
        'view_depr'    => '_',
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}',
        // 标签库标签开始标记
        'taglib_begin' => '<',
        // 标签库标签结束标记
        'taglib_end'   => '>',
        // 预先加载的标签库
        'taglib_pre_load'   =>  'app\index\taglib\Yunu', 
    ],
];
