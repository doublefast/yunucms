<?php
namespace app\model;
use think\Model;
use think\Request;

class Admin extends Model
{
	protected static function init()
    {

    }
	protected $pk = 'id';
	//设置只读字段
	protected $readonly = ['id','username'];

	protected $auto = ['login_ip','login_time'];
    protected $insert = [];  
    protected $update = [];

    protected function setLoginIpAttr()
    {
        return request()->ip();
    }
    protected function setLoginTimeAttr()
    {
        return time();
    }
}
