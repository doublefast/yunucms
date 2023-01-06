<?php
namespace app\admin\model;
use think\Model;
use app\admin\model\Hook as HookModel;

class HookPlugins extends Model
{
    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    public static function storage($hooks = [], $plugins = '')
    {
        if (!empty($hooks) && is_array($hooks)) {
            $hook_mod = new HookModel();
            foreach ($hooks as $k => $v) {
                if (is_numeric($k)) {
                    $k = $v;
                }
                if (!$hook_mod->storage(['name' => $k, 'source' => 'plugins.'.$plugins, 'intro' => $v])) {
                    return false;
                }
            }

            $data = [];
            foreach ($hooks as $k => $v) {
                if (is_numeric($k)) {
                    $k = $v;
                }
                if (self::where(['hook' => $k, 'plugins' => $plugins])->find()) {
                    continue;
                }
                $data[] = [
                    'hook'      => $k,
                    'plugins'   => $plugins,
                    'create_time'     => request()->time(),
                    'update_time'     => request()->time(),
                ];
            }
            
            if (empty($data)) {
                return true;
            }

            return self::insertAll($data);
        }
        return false;
    }

    public static function del($plugins = '')
    {
        if (!empty($plugins)) {
            if (!HookModel::delHook('plugins.'.$plugins)) {
                return false;
            }
            if (self::where('plugins', $plugins)->delete() === false) {
                return false;
            }
        }
        return true;
    }
}