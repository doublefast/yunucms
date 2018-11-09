<?php
$sys = include('config/extra/sys.php');
if ($sys['url_model'] == 3) {
	header('location:/admin/index/login');
}else{
	header('location:/index.php/admin/index/login');
}
?>