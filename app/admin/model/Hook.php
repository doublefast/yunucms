<?php
namespace app\admin\model;
use think\Model;
use think\Loader;

class Hook extends Model
{
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    protected $autoWriteTimestamp = true;

    public function storage($data = [])
    {
        if (empty($data)) {
            $data = request()->post();
        }

        if (self::where('name', $data['name'])->find()) {
            return true;
        }
        $valid = Loader::validate('Hook');
        if($valid->check($data) !== true) {
            $this->error = $valid->getError();
            return false;
        }

        if (isset($data['id']) && !empty($data['id'])) {
            $res = $this->update($data);
        } else {
            $res = $this->create($data);
        }
        if (!$res) {
            $this->error = '保存失败！';
            return false;
        }
        
        return $res;
    }
      
    public static function delHook($source = '')
    {
        if (empty($source)) {
            return false;
        }
        if (self::where('source', $source)->delete() === false) {
            return false;
        }
        return true;
    }
}