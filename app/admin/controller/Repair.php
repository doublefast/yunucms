<?php
namespace app\admin\controller;
use think\Controller;
use think\Log;
use think\Config;
///index.php?s=admin/repair/menu112
class Repair extends Controller
{
	public function _initialize()
    {
    	header("Access-Control-Allow-Origin: *");
    	header("Content-type:text/html;charset=utf-8");
    }

    public function menu112()
    {
		/*echo "YUNUCMS v1.1.2 运营数据 菜单修复<br><br>";
		$menu = db('auth_rule')->where("title = '运营数据'")->find();
		if ($menu) {
			$res = db('auth_rule')->where("title IN ('百度统计','主词监控')")->setField('pid', $menu['id']);
			echo " -- 修复数量：".$res."<br>";
		}else{
			echo " -- 程序非 V1.1.2 版本<br>";
		}*/
    }
    public function conaddtxt()
    {
		echo "YUNUCMS 内容追加TXT文本内容<br><br>";
		$cid = input('cid');
		if (empty($cid)) {
			echo " -- cid异常请携带正确cid参数<br>"; exit();
		}
		$filelist = getFileFolderList('./txt/', 2, '*');
		$filecon = [];
		foreach ($filelist as $k => $v) {
			$file_path = ROOT_PATH."txt/".$v;
			if(file_exists($file_path)){
				$str = file_get_contents($file_path);
				if ($str) {
					$str = iconv("gb2312", "utf-8//IGNORE", $str);
					$str = preg_replace('/\n|\r\n/','</p><p>',$str);
					$filecon[] = "<p>".$str."</p>";
				}
			}
		}

		$filecount = count($filecon);
		if ($filecount > 0) {
			echo " -- txt目录下有效数据：".$filecount."<br>";
		}else{
			echo " -- txt目录下没有有效数据，请通过FTP上传后再尝试<br>"; exit();
		}
		$category = new \app\admin\model\CategoryModel();
        $content = new \app\admin\model\ContentModel();

        $allcate = $category->getAllcategory();

        $cidlist = $category->getChildsId($allcate, $cid, 1);//构造包含子分类ID

        $infolist = $content->getContentByCid($cidlist);      
        echo " -- 需处理数据量：".count($infolist)."<br>";

        $txtxb = 0;
        $success = 0;
        $error = 0;
        echo "<br>";
        foreach($infolist as $k=>$v){
        	$txtxb = $txtxb >= $filecount ? 0 : $txtxb;
        	$condata = $content->getOneContent($v['id']);
        	$condata['content'] = $condata['content'].$filecon[$txtxb];
           	$flag = $content->editContent($condata, $v['mid']);
           	if ($flag['code']) {
           		echo " -- ".$v['title']."：修改成功<br>";
           		$success ++;
           	}else{
           		echo " -- <font color='red'>".$v['title']."：修改失败</font><br>";
           		$error ++;
           	}
           	
           	$txtxb ++;
        }
        echo "<br>";
        echo " -- 处理成功：".$success."&nbsp;&nbsp;&nbsp;&nbsp;处理失败：".$error."<br>";
    }
}
