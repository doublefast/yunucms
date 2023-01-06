<?php
use think\Route;
use think\Config;
if (config('sys.wap_levelurl')) {
	Route::domain(WAP_PRE.'.'.config('sys.site_levelurl'), 'wap');
}
