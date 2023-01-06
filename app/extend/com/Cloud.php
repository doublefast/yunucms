<?php
namespace com;
use \com\Http;

class Cloud {
    private $error = '出现未知错误 Cloud ！';
    private $data = array();
    private $api = NULL;
    private $identifier = '';
    public $lock = '';
    public $path = './';
    public $type = 'post';
    const main_url = 'http://www.yunucms.com';
    const api_url = 'http://cms.api.yunucms.com';
    const yunapi_url = 'http://api.yunucms.com';
    
    public function __construct($identifier = '', $path = './') {
        $this->identifier = $identifier;
        $this->path = $path;
        $this->lock = ROOT_PATH.'data/cloud.lock';
    }

    public function mainUrl() {
        return self::main_url;
    }
    
    public function apiUrl() {
        return self::api_url;
    }

    public function yunapiUrl() {
        return self::yunapi_url;
    }

    public function getError() {
        return $this->error;
    }

    public function data($data) {
        $this->data = $data;
        return $this;
    }

    public function record($site_title, $version = '') {
        $data['timestamp'] = time();
        $data['domain'] = $_SERVER['HTTP_HOST'];
        $data['identifier'] = $this->identifier;
        $data['site_name'] = $site_title;
        $data['version'] = $version;
        $this->data = $data;
        return $this;
    }

    public function api($api) {
        $this->api = self::api_url.'/'.$api;
        return $this->run($this->data);
    }

    public function type($type){
        $this->type = $type;
        return $this;
    }

    public function down($api) {
        $this->api = self::api_url.'/'.$api;
        $file = time().rand(10,99).'.zip';
        $request = $this->run(false);
        if (!is_dir($this->path)) {
            mkdir($this->path, 0755, true);
        }
        $ch = curl_init();
        $fp = fopen($this->path.$file, 'wb');
        curl_setopt($ch, CURLOPT_URL, $request['url']);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 3600);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_NOPROGRESS, 0);
        curl_setopt($ch, CURLOPT_FILE, $fp);
        if (ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')) {
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
        }
        curl_setopt($ch, CURLOPT_BUFFERSIZE, 64000);
        curl_setopt($ch, CURLOPT_POST, FALSE);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$request['params']);
        $res = curl_exec($ch);
        $curl_info = curl_getinfo($ch);

        if (curl_errno($ch) || $curl_info['http_code'] != 200) {
            curl_error($ch);
            @unlink($this->path.$file);
            return false;
        }else{
            curl_close($ch);
        }
        fclose($fp);
        if (is_file($this->lock)) {
            @unlink($this->lock);
        }
        return $this->path.$file;
    }

    private function run($request = true){
        $params['format'] = 'json';
        $params['timestamp'] = time();
        $params['domain'] = $_SERVER['HTTP_HOST'];
        $params['identifier'] = $this->identifier;
        $params = array_merge($params,$this->data);
        $params = array_filter($params);

        if (is_file($this->lock)) {
            @unlink($this->lock);
        }
        file_put_contents($this->lock, $params['timestamp']);
        if($request === false){
            $result = array();
            $result['url'] = ''.$this->api.'';
            $result['params'] = ''.http_build_query($params).'';
            return $result;
        }

        if($this->type == 'get'){
            $result = http::getRequest($this->api, $params);
        }elseif ($this->type == 'post') {
            $result = http::postRequest($this->api, $params);
        }
        return self::_response($result);
    }

    private function _response($result) {
        if (is_file($this->lock)) {
            @unlink($this->lock);
        }
        $jg = json_decode($result, 1);
        if(!$result || empty($jg)) {
            return ['code' => 0, 'msg' => '请求的接口网络异常，请稍后在试！'];
        } else {
            return json_decode($result, 1);
        }
    }
}