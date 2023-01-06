<?php
if (version_compare('5.5', PHP_VERSION, '>')) {die('PHP 5.5 or greater is required!!!');}
if (version_compare('7.5', PHP_VERSION, '<')) {die('PHP version should not exceed 7.5!!!');}
define('APP_PATH', __DIR__ . '/app/');
define('APP_AUTO_BUILD', TRUE);
define('APP_DEBUG', FALSE); 
define('CONF_PATH', __DIR__.'/config/');
require './system/start.php';
?>
