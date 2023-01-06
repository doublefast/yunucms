<?php
namespace app\admin\controller;
use app\admin\model\MediaModel;
use think\Config;
use think\Db;
use think\Session;
use think\Request;

class Datacount extends Common
{
    //百度统计
    public function baidutj() {
        return $this->fetch();
    }

    //主词监控
    public function pmjkhq() {
        $this->cloud = new \com\Cloud(config('cloud.identifier'));
        $html_status = url_get_contents("http://www.baidu.com");
        $html_status = $html_status ? 1 : 0;
        $mainkeywords = null;
        $keydata = null;
        if ($html_status && config('sys.api_pmjkhq') && config('cloud.identifier')) {
            $domain = config('sys.site_levelurl'); 
            $mainkeywords = send_post($this->cloud->apiUrl().'/getmonitorcmslist', ['domain'=>$domain,'username'=>config('cloud.identifier')]);
            $mainkeywords = $mainkeywords ? json_decode($mainkeywords, true) : null;
            
            if ($mainkeywords) {
                $keydata = $mainkeywords['state'] == 1 ? $mainkeywords['data'] : null;
                if ($keydata) {
                    foreach ($keydata as $k => $v) {
                        $bhstr = "";
                        if ($v['current_rank'] == $v['initial_rank'] || $v['current_rank'] == 0) {
                            $bhstr = '-';
                        } else if ($v['current_rank'] - $v['initial_rank'] > 0) {
                            if ($v['initial_rank'] > 0) {
                                $bhstr = $v['current_rank']-$v['initial_rank'].'&nbsp;<span style="color: #ef2020;">&darr;</span>';
                            } else {
                                $bhstr = $v['current_rank']-$v['initial_rank'].'&nbsp;<span style="color: #36a636;">&uarr;</span>';
                            }
                        } else {
                            $bhstr = $v['initial_rank']-$v['current_rank'].'&nbsp;<span style="color: #36a636;">&uarr;</span>';
                        }
                        $keydata[$k]['bhstr'] = $bhstr;
                    }
                }
            }
        }
        
        $this->assign([
            'keydata' => $keydata,
        ]);
        return $this->fetch();
    }

}
