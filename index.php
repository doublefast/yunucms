<?php
if (version_compare("5.4", PHP_VERSION, ">")) {
     die("PHP 5.4 or greater is required!!!");
}
if (version_compare("5.7", PHP_VERSION, "<")) {
     die("PHP version should not exceed 5.6!!!");
}
// 定义项目路径
define('APP_PATH', __DIR__ . '/app/');
define('APP_AUTO_BUILD',true);
define('APP_DEBUG',TRUE); 
define('CONF_PATH', __DIR__.'/config/');
// 加载框架引导文件
require './system/start.php';
?>