<?php
namespace app\common\behavior;
use app\admin\model\Hook as HookModel;
use app\admin\model\HookPlugins as HookPluginsModel;
use app\admin\model\Plugins as PluginsModel;
class Hook
{
    public function run(&$params)
    {
        $lock = 'data/install.lock';
        if(!is_file($lock)){
            return;
        }
        $hook_plugins = cache('hook_plugins');
        $hooks        = cache('hooks');
        $plugins      = cache('plugins');

        if (!$hook_plugins) {
            $hooks = HookModel::where('status', 1)->column('status', 'name');
            $plugins = PluginsModel::where('status', 2)->column('status', 'name');
            $hook_plugins = HookPluginsModel::where('status', 1)->field('hook,plugins')->orderRaw('sort')->select();
            // 非开发模式，缓存数据
            if (config('sys.app_debug') === 0) {
                cache('hook_plugins', $hook_plugins);
                cache('hooks', $hooks);
                cache('plugins', $plugins);
            }
        }
        if ($hook_plugins) {
            foreach ($hook_plugins as $value) {
                if (isset($hooks[$value->hook]) && isset($plugins[$value->plugins])) {
                    \think\Hook::add($value->hook, get_plugins_class($value->plugins));
                }
            }
        }
    }
}
