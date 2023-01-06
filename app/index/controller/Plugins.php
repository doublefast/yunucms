<?php
namespace app\index\controller;
use app\admin\model\Plugins as PluginsModel;

class Plugins extends Common
{
    public function index()
    {
        $plugin = input('p', '', 'trim');
        $controller = input('c', '', 'trim');
        $action = input('a', '', 'trim');
        $params = $this->request->except(['p', 'c', 'a'], 'param');

        if (empty($plugin)) {
            return $this->error('插件参数传递错误！');
        }            
        if (!PluginsModel::where(['name' => $plugin, 'status' => 2])->find() ) {
            return $this->error("插件可能不存在或者未安装！");
        }
        if (!plugins_action_exist($plugin.'/'.$controller.'/'.$action, 'index')) {
            return $this->error("插件方法不存在[".$plugin.'/'.$controller.'/'.$action."]！");
        }
        return plugins_run($plugin.'/'.$controller.'/'.$action, $params, 'index');
    }
}
