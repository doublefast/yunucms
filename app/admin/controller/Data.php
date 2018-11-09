<?php
namespace app\admin\controller;
use think\Config;
use think\Db;
use think\Session;
use think\Request;
use com\Database;

class Data extends Common
{
    /**
     * 数据备份
     */
    public function index() {
        $Db = Db::connect();
        $tmp = $Db->query('SHOW TABLE STATUS');
        $infolist = array_map('array_change_key_case', $tmp);
        $this->assign('infolist', $infolist);
        return $this->fetch();
    }

    /**
     * 备份数据库
     * @param  String  $ids 表名
     * @param  Integer $id     表ID
     * @param  Integer $start  起始行数
     */
    public function export($ids = null, $id = null, $start = null) {
        $Request = Request::instance();
        if ($Request->isPost() && !empty($ids) && is_array($ids)) { //初始化
            $path = config('data_backup_path');
            is_dir($path) || mkdir($path, 755, true);
            //读取备份配置
            $config = [
                'path' => realpath($path) . DIRECTORY_SEPARATOR,
                'part' => config('data_backup_part_size'),
                'compress' => config('data_backup_compress'),
                'level' => config('data_backup_compress_level'),
            ];

            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if (is_file($lock)) {
                return $this->error('检测到有一个备份任务正在执行，请稍后再试，或手动删除"'.$lock.'"后重试！');
            }
            file_put_contents($lock, $Request->time()); //创建锁文件
            //检查备份目录是否可写
            is_writeable($config['path']) || $this->error('备份目录不存在或不可写，请检查后重试！');
            session('backup_config', $config);

            //生成备份文件信息
            $file = [
                'name' => date('Ymd-His', $Request->time()),
                'part' => 1,
            ];
            session('backup_file', $file);
            //缓存要备份的表
            session('backup_tables', $ids);

            //创建备份文件
            $Database = new \com\Database($file, $config);
            if (false !== $Database->create()) {
                $tab = ['id' => 0, 'start' => 0];
                return $this->success('初始化成功！', '', ['tables' => $ids, 'tab' => $tab]);
            } else {
                return $this->error('初始化失败，备份文件创建失败！');
            }
        } elseif ($Request->isGet() && is_numeric($id) && is_numeric($start)) { //备份数据
            $tables = session('backup_tables');
            //备份指定表
            $Database = new \com\Database(session('backup_file'), session('backup_config'));
            $start = $Database->backup($tables[(int) $id], $start);
            if (false === $start) { //出错
                $this->error('备份出错！');
            } elseif (0 === $start) { //下一表
                if (isset($tables[++$id])) {
                    $tab = ['id' => $id, 'start' => 0];
                    return $this->success('备份完成！', '', ['tab' => $tab]);
                } else { //备份完成，清空缓存
                    unlink(session('backup_config.path') . 'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
                    return $this->success('备份完成！');
                }
            } else {
                $tab = ['id' => $id, 'start' => $start[0]];
                $rate = floor(100 * ($start[0] / $start[1]));
                return $this->success("正在备份...({$rate}%)", '', ['tab' => $tab]);
            }
        } else { 
            return json(['msg' => '请选择要备份的数据表！']);
        }
    }

    /**
     * 优化表
     * @param  String $ids 表名
     */
    public function optimize($ids = null) {
        if (empty($ids)) {
            return $this->error("请指定要优化的表！");
        }
        $Db = Db::connect();
        if (is_array($ids)) {
            $tables = implode('`,`', $ids);
            $list = $Db->query("OPTIMIZE TABLE `{$tables}`");
            if($list){
                $this->success("数据表优化完成！");
            } else {
                $this->error("数据表优化出错请重试！");
            }
        } else {

            $list = $Db->query("OPTIMIZE TABLE `{$ids}`");
            if($list){
                $this->success("数据表'{$ids}'优化完成！");
            } else {
                $this->error("数据表'{$ids}'优化出错请重试！");
            }
        }
    }

    /**
     * 修复表
     * @param  String $ids 表名
     */
    public function repair($ids = null) {
        if (empty($ids)) {
            return $this->error("请指定要修复的表！");
        }
        $Db = Db::connect();
        if (is_array($ids)) {
            $tables = implode('`,`', $ids);
            $list = $Db->query("REPAIR TABLE `{$tables}`");
            if($list){
                $this->success("数据表修复完成！");
            } else {
                $this->error("数据表修复出错请重试！");
            }
        } else {
            $data = $Db->query("REPAIR TABLE `{$ids}`");
            if($list){
                $this->success("数据表'{$ids}'修复完成！");
            } else {
                $this->error("数据表'{$ids}'修复出错请重试！");
            }
        }
    }

    /**
     * 还原数据库
     * @param 类型 参数 参数说明
     */

    public function import() {
        //列出备份文件列表
        $path_tmp = config('data_backup_path');
        is_dir($path_tmp) || mkdir($path_tmp);
        $path = realpath($path_tmp);
        $flag = \FilesystemIterator::KEY_AS_FILENAME;
        $glob = new \FilesystemIterator($path, $flag);

        $list = array();
        foreach ($glob as $name => $file) {
            if (preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)) {
                $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');
                $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                $part = $name[6];
                if (isset($list["{$date} {$time}"])) {
                    $info = $list["{$date} {$time}"];
                    $info['part'] = max($info['part'], $part);
                    $info['size'] = $info['size'] + $file->getSize();
                } else {
                    $info['part'] = $part;
                    $info['size'] = $file->getSize();
                }
                $extension = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
                $info['compress'] = ($extension === 'SQL') ? '-' : $extension;
                $info['time'] = strtotime("{$date} {$time}");
                $list["{$date} {$time}"] = $info;
            }
        }
        $this->assign('infolist', $list);
        return $this->fetch();
    }

    /**
     * 删除备份文件
     * @param  Integer $time 备份时间
     */
    public function del($time = 0) {
        empty($time) && $this->error('参数错误！');
        $name = date('Ymd-His', $time) . '-*.sql*';
        $path = realpath(config('data_backup_path')) . DIRECTORY_SEPARATOR . $name;
        array_map("unlink", glob($path));
        if (count(glob($path))) {
            return $this->error('备份文件删除失败，请检查权限！');
        } else {
            return $this->success('备份文件删除成功！');
        }
    }

    /**
     * 还原数据库
     */
    public function revert($time = 0, $part = null, $start = null) {
        if (is_numeric($time) && is_null($part) && is_null($start)) { //初始化
            //获取备份文件信息
            $name = date('Ymd-His', $time) . '-*.sql*';
            $path = realpath(config('data_backup_path')) . DIRECTORY_SEPARATOR . $name;
            $files = glob($path);
            $list = [];
            foreach ($files as $name) {
                $basename = basename($name);
                $match = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);
            $last = end($list);//检测文件正确性
            if (count($list) === $last[0]) {
                session('backup_list', $list); //缓存备份列表
                return $this->success('初始化完成,请等待！', '', ['part' => 1, 'start' => 0]);
            } else {
                return $this->error('备份文件可能已经损坏，请检查！');
            }
        } elseif (is_numeric($part) && is_numeric($start)) {
            $list = session('backup_list');
            $db = new \com\Database($list[$part], [
                'path' => realpath(config('data_backup_path')) . DIRECTORY_SEPARATOR,
                'compress' => $list[$part][2]
                ]
            );
            $start = $db->import($start);
            if (false === $start) {
                return $this->error('还原数据出错！');
            } elseif (0 === $start) { //下一卷
                if (isset($list[++$part])) {
                    $data = array('part' => $part, 'start' => 0);
                    $this->success("正在还原...#{$part}", '', $data);
                } else {
                    session('backup_list', null);
                    $this->success('数据库还原完成！');
                }
            } else {
                $data = array('part' => $part, 'start' => $start[0]);
                if ($start[1]) {
                    $rate = floor(100 * ($start[0] / $start[1]));
                    return $this->success("正在还原...#{$part} ({$rate}%)", '', $data);
                } else {
                    $data['gz'] = 1;
                    return $this->success("正在还原...#{$part}", '', $data);
                }
            }
        } else {
            return $this->error('参数错误！');
        }
    }


}
