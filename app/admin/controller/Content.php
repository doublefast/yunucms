<?php
namespace app\admin\controller;
use app\admin\model\ContentModel;
use app\admin\model\CategoryModel;
use app\admin\model\DiyfieldModel;
use app\admin\model\AreaModel;
use think\Config;
use think\Db;

class Content extends Common
{
    public function index()
    {
    	$category = new CategoryModel();
        $content = new ContentModel();
        $area = new AreaModel();

    	$cid = input('cid');

        $key = input('key');

        $where = [];
        if($key && $key !== ""){
            $where['title'] =  ['like', "%$key%"];          
        }
        $where['cid'] = $cid;  

        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config("paginate.list_rows");
        $count = $content->getContentCount($where);// 获取总条数
        $allpage = intval(ceil($count / $limits));//计算总页面
        $infolist = $content->getContentByWhere($where, $Nowpage, $limits);      

        foreach($infolist as $k=>$v){
            $infolist[$k]['isyy'] = strtotime($v['create_time']) > time() ? 1 : 0;
        }  

    	$nav = new \org\Leftnav;
    	$arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist);
        $this->assign([
        	'cate' => $category->getOneCategory($cid),
        	'catlist' => $catlist,
            'infolist' => $infolist,
            'Nowpage' => $Nowpage,
            'allpage' => $allpage,
            'count' => $count,
            'arealist' => $arealist,
       	]);
        if(input('get.page')){
            return json($infolist);
        }
        return $this->fetch();
    }

    public function addcontent()
    {
    	$category = new CategoryModel();
    	$diyfield = new DiyfieldModel();
        $area = new AreaModel();
    	$nav = new \org\Leftnav;
    	$cid = input('cid');
        $cate = $category->getOneCategory($cid);

        if(request()->isAjax()){
            $param = input('post.');
           	$content = new ContentModel();
            $flag = $content->insertContent($param, $cate['mid']);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        $fieldlist = $diyfield->getAllDiyfield($cate['mid']);
        $fieldhtml = $this->fieldformat($fieldlist);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist);

        $this->assign([
        	'cate' => $cate,
        	'catlist' => $catlist,
        	'fieldhtml' => $fieldhtml,
            'arealist' => $arealist,
       	]);
        return $this->fetch();
    }

    public function batchaddcontent()
    {
        $category = new CategoryModel();
        $diyfield = new DiyfieldModel();
        $content = new ContentModel();
        $area = new AreaModel();
        $nav = new \org\Leftnav;
        $cid = input('cid');
        $cate = $category->getOneCategory($cid);

        if(request()->isAjax()){
            $param = input();
            $imgarr = explode('***', $param['imglist']);
            $titlearr = explode('***', $param['titlelist']);
            $sortarr = explode('***', $param['sortlist']);
            $imgfield = $param['field'];
            unset($param['imglist']);
            unset($param['titlelist']);
            unset($param['sortlist']);
            unset($param['file']);
            unset($param['field']);
            $param['conid'] = null;
            foreach ($imgarr as $k => $v) {
                if ($v) {
                    $param[$imgfield] = $v;
                    $param['title'] = $titlearr[$k];
                    $param['sort'] = $sortarr[$k];
                    $content->insertContent($param, $param['mid']);
                }
            }

            return json(['code' => 1, 'data' => '', 'msg' => '成功批量添加内容：'.(count($imgarr)-1).'个']);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist);

        //获取图片字段
        $where = [
            'mid'   => $cate['mid'],
            'ftype' => ['IN','image,images']
        ];
        $imgfield = db('diyfield')->where($where)->select();
        $this->assign([
            'cate' => $cate,
            'catlist' => $catlist,
            'arealist' => $arealist,
            'imgfield' => $imgfield,
        ]);
        return $this->fetch();
    }
    public function editcontent()
    {
        $category = new CategoryModel();
        $diyfield = new DiyfieldModel();
        $content = new ContentModel();
        $area = new AreaModel();

        $nav = new \org\Leftnav;
        $id = input('id');
        $info = $content->getOneContent($id);

        $cate = $category->getOneCategory($info['cid']);
        if(request()->isAjax()){
            $param = input('post.');
            $flag = $content->editContent($param, $cate['mid']);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        
        $arr = $category->getAllcategory();
        $catlist = $nav::rule($arr);

        $fieldlist = $diyfield->getAllDiyfield($cate['mid']);
        $fieldhtml = $this->fieldformat($fieldlist, $info);

        //获取开启独立内容地区列表
        $arealist = $area->getAllArea();
        $arealist = $area->getAreaByCon($arealist, 0, $info['area']);

        $this->assign([
            'info' => $info,
            'cate' => $cate,
            'catlist' => $catlist,
            'fieldhtml' => $fieldhtml,
            'arealist' => $arealist
        ]);
        return $this->fetch();
    }
    
    public function sortcontent()
    {
        $id = input('param.id');
        $sort = input('param.sort');

        $flag = db('content')->where(['id'=>$id])->setField(['sort'=>$sort]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function statecontent()
    {
        $id = input('param.id');
        $db = Db::name('content');
        $istop =  $db->where(['id'=>$id])->value('istop');//判断当前状态
        if($istop == 1)
        {
            $flag = $db->where(['id'=>$id])->setField(['istop'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已关闭']);
        }else
        {
            $flag = $db->where(['id'=>$id])->setField(['istop'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    }
    public function movecategory()
    {
        $ids = input('param.ids');
        $cid = input('param.cid');
        $db = Db::name('content');
        $flag = $db->where('id', 'IN', $ids."0")->setField(['cid'=>$cid]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }
    public function movearea()
    {
        $ids = input('param.ids');
        $aid = input('param.aid');
        $aid = $aid ? ','.$aid.',' : '';
        $db = Db::name('content');
        $flag = $db->where('id', 'IN', $ids."0")->setField(['area'=>$aid]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function stateall()
    {
        $ids = input('param.ids');
        $istop = input('param.istop');
        $db = Db::name('content');

        $flag = $db->where('id', 'in', $ids."0")->setField(['istop'=>$istop]);
        return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已更新']);
    }

    public function baidu()
    {
        $ids = input('param.ids');
        $istop = input('param.istop');
        $db = Db::name('content');

        if (config('sys.seo_bdurl')) {
            $flag = $db->where('id', 'in', $ids."0")->select();

            $urls = array();
            $indcon = new \app\index\model\ContentModel();
            foreach ($flag as $k => $v) {
            	if ($v['jumpurl'] == '') {
	            	if ($v['area']) {
	            		$arealist = explode(",", $v['area']);
	            		foreach ($arealist as $k1 => $v1) {
	            			if ($v1) {

	            				$areadata = db('area')->where(['id'=>$v1])->find();
	            				if ($areadata) {
	            					$htmlurl = $indcon->getContentUrl($v,'',$areadata);
					                //$htmlurl = str_replace("&", "&amp;", $htmlurl);
					               	if (config('sys.url_model') == 3) {
				                        $htmlurl = $htmlurl.'html';
				                    }
				                    $urls[] = $htmlurl;
	            				}
	            			}
	            		}
	            	}else{
	            		$htmlurl = $indcon->getContentUrl($v);
	                    if (config('sys.url_model') == 3) {
	                        $htmlurl = $htmlurl.'html';
	                    }
	                    $urls[] = $htmlurl;
	            	}
	            }
            }

            $api = config('sys.seo_bdurl');
            $ch = curl_init();
            $options =  array(
                CURLOPT_URL => $api,
                CURLOPT_POST => true,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POSTFIELDS => implode("\n", $urls),
                CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
            );
            curl_setopt_array($ch, $options);
            $result = curl_exec($ch);
            
            $jg = json_decode($result, true);
            if (isset($jg['error'])) {
                return json(['code' => 0, 'data' => '', 'msg' => $jg['message']]);
            }else{
                return json(['code' => 1, 'data' => '', 'msg' => "成功推送：".$jg['success']." 条URL"]);
            }
        }else{
            return json(['code' => 0, 'data' => '', 'msg' => '请先设置百度主动推送API']);
        }

    }

    public function delContent()
    {
        $id = input('param.ids');
        $content = new ContentModel();
        $flag = $content->delContent($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    private function fieldformat($fiellist, $vallist = []){
    	$html = '';
    	$script = '';
    	$ueditor = '';
    	foreach ($fiellist as $k => $v) {
    		$req = $v['isnotnull'] ? 'lay-verify="required"' : "";
    		$val = array_key_exists($v['field'], $vallist) ? $vallist[$v['field']] : $v['defval'];
    		switch ($v['ftype']) {
    			case '------'://分组线
    				$html .= '<div class="title_bar mb20">'.$v['remark'].'</div>';
    				break;
    			case 'text'://单行文本
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<input class="layui-input" type="text" name="'.$v['field'].'" value="'.$val.'" placeholder='.$v['title'].' '.$req.'>';
			        $html .= '</div>';
			        $html .= '</div>';
    				break;
    			case 'textarea'://多行文本
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<textarea name="'.$v['field'].'" placeholder="'.$v['title'].'" class="layui-textarea w700" '.$req.'>'.$val.'</textarea>';
			        $html .= '</div>';
			        $html .= '</div>';
    				break;
    			case 'seditor'://简约文本编辑器
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<textarea name="'.$v['field'].'" id="'.$v['field'].'" '.$req.'>'.$val.'</textarea>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $ueditor .= 'UE.getEditor("'.$v['field'].'", option);';
                    break;
                case 'editor'://富文本编辑器
    				$html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<textarea name="'.$v['field'].'" id="'.$v['field'].'" '.$req.'>'.$val.'</textarea>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $ueditor .= 'UE.getEditor("'.$v['field'].'");';
    				break;
    			case 'file'://附件
    				$html .= '<div class="layui-form-item">';
			        $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
			        $html .= '<input class="layui-input" type="text" name="'.$v['field'].'" id="'.$v['field'].'" value="'.$val.'" placeholder="附件上传" '.$req.'>';
			        $html .= '</div>';
			       	$html .= '<input type="file" name="file'.$v['id'].'" lay-type="file" class="layui-upload-file" id="upload-file'.$v['id'].'">';
			        $html .= '</div>';

			        $script .= 'layui.upload({';
			        $script .= 'url: "'.url('Upload/uploadfile',['file'=>'file'.$v['id']]).'"';
			        $script .= ',title:"上传文件"';
			        $script .= ',elem: "#upload-file'.$v['id'].'"';
			        $script .= ',method: "post"';
			        $script .= ',ext: "rar|zip|pdf|doc|docx|xls|xlsx"';
			        $script .= ',success: function(data){';
			        $script .= 'if(data.status == 1){';
			        $script .= '$("#'.$v['field'].'").val(data.file_path);';
			        $script .= '}else{';
			        $script .= 'alert(data.error_info);';
			        $script .= '}';
			        $script .= '}';
			        $script .= '});';
    				break;
    			case 'image'://图片
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input id="path'.$v['id'].'" class="layui-input" type="text" name="'.$v['field'].'" value="'.$val.'"><br>';
                    $html .= '<img id="img_path'.$v['id'].'" class="defimg" src="'.$val.'" onerror="javascript:this.style.display=\'none\';">';
                    $html .= '</div>';
                    $html .= '<div class="layui-input-inline w450">';
                    $html .= '<input type="button" rel="path'.$v['id'].'" value="选择站内图片" class="fl BrowerPicture file_btn" />';
                    $html .= '<div class="site-demo-upload upload-img fl ml5">';
                    $html .= '<div class="site-demo-upbar">';
                    $html .= '<input type="file" name="file" class="layui-upload-file" id="upload-image'.$v['id'].'">';
                    $html .= '</div>';
                    $html .= '</div>';
                    $html .= '</div>';
                    $html .= '</div>';

                    $script .= 'layui.upload({';
                    $script .= 'url: "'.url('Upload/upload',['file'=>'file']).'"';
                    $script .= ',before: function(input){';
                    //$script .= 'console.log("图片上传中");';
                    $script .= '}';
                    $script .= ',title:"上传图片"';
                    $script .= ',elem: "#upload-image'.$v['id'].'" ';
                    $script .= ',method: "post"';
                    $script .= ',ext: "jpg|png|gif"';
                    $script .= ',type:"images"';
                    $script .= ',success: function(data){';
                    $script .= 'if(data.status == 1){';
                    $script .= '$("#path'.$v['id'].'").val(data.image_name);';
                    $script .= '$("#img_path'.$v['id'].'").attr("src", data.image_name).show();';
                    $script .= '}else{';
                    $script .= 'alert(data.error_info);';
                    $script .= '}';
                    $script .= '}';
                    $script .= '});';

/*                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline w450">';

                    $html .= '<img id="img_path'.$v['id'].'" class="defimg" src="'.$val.'" onerror="javascript:this.src=\''.config('view_replace_str.__ADM_PUBLIC__').'/img/tong.jpg\';">';
                    $html .= '<input type="hidden" id="path'.$v['id'].'" value="'.$val.'" name="'.$v['field'].'" /> <input type="button" rel="path'.$v['id'].'" value="选择图片" class="file_btn fl image" />';

                    $html .= '</div>';
                    
                    $html .= '</div>';*/

    				/*$html .= '<div class="layui-form-item">';
			       	$html .= '<label class="layui-form-label">'.$v['title'].'</label>';
			        $html .= '<div class="layui-input-inline">';
                    $html .= '<input type="text" class="layui-input" id="image'.$v['id'].'" name="'.$v['field'].'" placeholder="图片上传" value="'.$val.'" '.$req.'>';
			        $html .= '<img id="img_path'.$v['id'].'" class="defimg" src="'.$val.'" onerror="javascript:this.src=\''.config('view_replace_str.__ADM_PUBLIC__').'/img/tong.jpg\'">';
			        //$html .= '<div class="site-demo-upbar">';
			        //$html .= '</div>';
			        $html .= '</div>';
                    $html .= '<input type="file" name="file'.$v['id'].'" class="layui-upload-file" id="upload-image'.$v['id'].'">';
			        $html .= '</div>';

			        $script .= 'layui.upload({';
			        $script .= 'url: "'.url('Upload/upload',['file'=>'file'.$v['id']]).'"';
			        $script .= ',title:"上传图片"';
			        $script .= ',elem: "#upload-image'.$v['id'].'"';
			        $script .= ',method: "post"';
			        $script .= ',ext: "jpg|png|gif"';
			        $script .= ',type:"images"';
			        $script .= ',success: function(data){';
			        $script .= 'if(data.status == 1){';
			        $script .= '$("#image'.$v['id'].'").val("/uploads/image/"+data.image_name);';
			       	$script .= '$("#img_path'.$v['id'].'").attr("src", "/uploads/image/" + data.image_name).show();';
			        $script .= '}else{';
			        $script .= 'alert(data.error_info);';
			        $script .= '}';
			        $script .= '}';
			        $script .= '});';*/
    				break;
                case 'images'://多图

                	$img_str = "";
                    if ($val) {
                        $imglist = explode('***', $val);
                        foreach ($imglist as $k1 => $v1) {
                            $img_str .= $v1 ? '<div class="picture_item"><img src="'.$v1.'" width="114" height="114"><div class="picture_del">删除</div><div class="picture_go_up">前移</div><input type="hidden" class="imgval'.$v['id'].'" value="'.$v1.'" /></div>' : "";
                        }
                    }

                	$html .= '<div class="layui-form-item">';
	            	$html .= '<label class="layui-form-label">'.$v['title'].'</label>';




	              	$html .= '<div class="layui-input-inline w700">';
	                $html .= '<input type="hidden" name="'.$v['field'].'" value="'.$val.'" id="imglist'.$v['id'].'">';
					/*$html .= '<div class="site-demo-upload upload-img">';
				    $html .= '<div class="site-demo-upbar">';
				    $html .= '<input type="file" name="file" class="layui-upload-file" id="upload-imagelist'.$v['id'].'">';
				    $html .= '</div>';
				    $html .= '</div>';*/
                    $html .= '<div id="upload_imagelist'.$v['id'].'">上传多图</div>';
					$html .= '<div class="picture_tip picture_tip'.$v['id'].'"></div>';
				    $html .= '<div id="picture_show'.$v['id'].'">'.$img_str.'</div>';
	                $html .= '</div>';
	                $html .= '</div>';

	                $script .= 'var picture_show'.$v['id'].' = $("#picture_show'.$v['id'].'");';
					$script .= 'var picture_tip'.$v['id'].' = $(".picture_tip'.$v['id'].'");';

                    $script .= 'var uploader = WebUploader.create({';
                    $script .= 'auto: true,';
                    $script .= 'swf:  "'.config('view_replace_str.__ADM_PUBLIC__').'/js/Uploader.swf",';
                    $script .= 'server: "'.url('Upload/upload',['file'=>'file']).'",';
                    $script .= 'pick: "#upload_imagelist'.$v['id'].'",';
                    $script .= 'accept:{';
                    $script .= 'title: "Images",';
                    $script .= 'extensions: "gif,jpg,jpeg,bmp,png",';
                    $script .= 'mimeTypes: "image/"';
                    $script .= '},';
                    $script .= 'duplicate :true';
                    $script .= '});';
                                            
                    $script .= 'uploader.on( "uploadSuccess", function(file,data){';
                    $script .= 'if(data.status == 1){';
                    $script .= 'picture_tip'.$v['id'].'.html(""+ data.image_name +" 上传成功"); ';              
                    $script .= 'var img = data.image_name;';
                    $script .= 'picture_html= \'<div class="picture_item"><img src="\'+ img +\'" width="114" height="114"><div class="picture_del">删除</div><div class="picture_go_up">前移</div><input type="hidden" class="imgval'.$v['id'].'" value="\'+ img +\'" /></div>\';';
                    $script .= 'picture_show'.$v['id'].'.append(picture_html);';
                    $script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
                    $script .= '}else{';
                    $script .= 'picture_tip'.$v['id'].'.html(data.state);';
                    $script .= '}';
                    $script .= '});';

        			$script .= '$("#picture_show'.$v['id'].'").on("mouseenter",".picture_item",function(){';
					$script .= '$(this).find(".picture_go_up").show();';
					$script .= '$(this).find(".picture_del").show();';
					$script .= '}).on("mouseleave",".picture_item",function(){';
					$script .= '$(this).find(".picture_go_up").hide();';
					$script .= '$(this).find(".picture_del").hide();';
					$script .= '}';
					$script .= '); ';

				    $script .= '$("#picture_show'.$v['id'].'").on("click",".picture_go_up",function () {';
				    $script .= 'var parent = $(this).parent();';
				    $script .= 'if (parent.index() == 0){';
				   	$script .= '}else{';
				  	$script .= 'parent.prev().before(parent);';
				   	$script .= '$(this).hide();';
				    $script .= 'parent.find(".picture_del").hide();';
				   	$script .= '}';
					$script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
				    $script .= '});';

				    $script .= '$("#picture_show'.$v['id'].'").on("click",".picture_del",function () {';
				   	$script .= 'var img = $(this).next().val();';
					$script .= '$(this).parent().remove();';
					$script .= 'updateimg("imgval'.$v['id'].'", "imglist'.$v['id'].'");';
					$script .= 'return;';
				    $script .= '});';

                    break;
    			case 'datetime'://日期和时间
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input class="layui-input" name="'.$v['field'].'" placeholder="'.$v['title'].'" value="'.$val.'" onclick="layui.laydate({elem: this, istime: true, format: \'YYYY-MM-DD hh:mm:ss\'})" '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'number'://数字
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline">';
                    $html .= '<input name="'.$v['field'].'" lay-verify="number" autocomplete="off" value="'.$val.'" placeholder="'.$v['title'].'" class="layui-input" type="text" style="width: 300px;" '.$req.'>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'radio'://单选按钮
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width:450px;">';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "checked" : '';
                        $html .= '<input type="radio" name="'.$v['field'].'" value="'.$v1.'" title="'.$v1.'" '.$check.'>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
                    
    				break;
    			case 'checkbox'://复选框
                    $values = explode("\n", $v['values']);

                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-block" style="width:450px;">';

                    $a = 0;
                    $valarr = $val ? explode(',', $val) : [];
                    foreach ($values as $k1 => $v1) {
                        $check = in_array($v1, $valarr) ? 'checked' : '';
                        $html .= '<input type="checkbox" name="'.$v['field'].'['.$a.']" value="'.$v1.'" title="'.$v1.'"  '.$check.'/>';
                        $a ++ ;
                    }
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			case 'select'://下拉框
    				$values = explode("\n", $v['values']);
                    $html .= '<div class="layui-form-item">';
                    $html .= '<label class="layui-form-label">'.$v['title'].'</label>';
                    $html .= '<div class="layui-input-inline" style="width: 300px">';
                    $html .= '<select data-val="true" name="'.$v['field'].'" '.$req.'>';
                    $a = 0;
                    foreach ($values as $k1 => $v1) {
                        $check = ($v1 == $val) || ($v['isnotnull'] && $a == 0) ? "selected" : '';
                        $html .= '<option value="'.$v1.'" '.$check.'>'.$v1.'</option>';
                        $a ++ ;
                    }
                                
                    $html .= '</select>';
                    $html .= '</div>';
                    $html .= '</div>';
    				break;
    			default:
    				break;
    		}
    	}
    	return ['html'=>$html, 'script'=>$script, 'ueditor'=>$ueditor];
    }
}
