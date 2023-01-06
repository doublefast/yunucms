<?php
namespace app\admin\model;
use think\Model;
use think\Loader;

class Plugins extends Model
{
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    protected $autoWriteTimestamp = true;

    public function setConfigAttr($value)
    {
        if (empty($value)) return '';
        return json_encode($value, 1);
    }

    public static function getConfig($name = '', $update = false)
    {
        $result = cache('plugins_config');
        if (!$result || $update == true) {
            $rows = self::where('status', 2)->column('name,config', 'name');
            $result = [];
            foreach ($rows as $k => $r) {
                if (empty($r)) {
                    continue;
                }
                $config = json_decode($r, 1);
                if (!is_array($config)) {
                    continue;
                }
            }
            cache('plugins_config', $result);
        }
        return $name != '' ? $result[$name] : $result;
    }
}
