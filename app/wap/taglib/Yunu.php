<?php
namespace app\wap\taglib;
use think\template\TagLib;
use think\Db;

class Yunu extends TagLib {
	protected $tags = array(
		'config'  => array(//读取配置信息
			'attr' => 'name', 
			'close' => 0
		), 
		'list'	=> array(//内容列表
			'attr'	=> 'cid,titlelen,orderby,keyword,limit,pagesize,flag,top,tag,sql,area,image',
			'close'	=> 1,
		),
		'form'	=> array(//表单列表
			'attr'	=> 'fid,orderby,top,pagesize,limit',
			'close'	=> 1,
		),
		'link'	=> array(//友情链接
			'attr'	=> 'type,flag,limit,orderby',
			'close'	=> 1,
		),
		'banner'	=> array(//幻灯片
			'attr'	=> 'type,limit,orderby',
			'close'	=> 1,
		),
		'info'	=> array(//单条内容
			'attr'	=> 'conid,type,orderby',
			'close'	=> 1,
		),
		'block'	=> array(//自定义块
			'attr'	=> 'name,infolen,textflag',
			'close'	=> 0,
		),
		'catlist'	=> array(//栏目列表
			'attr'	=> 'cid,type,limit,flag',//flag为是否全部显示
			'close'	=> 1,
		),
		'nav'	=> array(//导航
			'attr'	=> 'typeid, limit',
			'close'	=> 1,
		),
		'type'	=> array(//单个分类信息
			'attr'	=> 'typeid',
			'close'	=> 1,
		),
		'area'	=> array(//地区导航
			'attr'	=> 'top,con,url,limit,conurl',
			'close'	=> 1,
		),
		'position'  => array(//当前位置
			'attr'  => 'cid,sname,surl,delimiter',
			'close' => 0,
		),
		'url'  => array(//获取url
			'attr'  => 'name,id',
			'close' => 0,
		),
		'cwkeywords'  => array(//显示长尾关键词组合列表
			'attr'  => 'type,limit',
			'close' => 1,
		),
		'tag'  => array(//获取url
			'attr'  => 'title,limit',
			'close' => 1,
		),
		'field'  => array(//自定义字段
			'attr'  => 'id,group,noset,active',
			'close' => 1,
		),
	);
	public function tagConfig($attr) {
		$confstr = config('sys.'.$attr['name']);
		//$confstr = htmlspecialchars_decode($confstr);
		$chkarr = ['seo_title', 'seo_keywords', 'seo_description'];
		if (in_array($attr['name'], $chkarr)) {
			$area = session('sys_areainfo');
			if ($area) {
				if (config('sys.seo_area')) {
					$confstr = config('sys.'.$attr['name'].'_area');
				}
				if (isset($area[$attr['name']]) && $area[$attr['name']]) {
					$confstr = $area[$attr['name']];
				}
			}
		}
		if ($attr['name'] == 'wapurl') {
			$confstr = get_wapurl(); //获取手机版当前页面URL
		}
		if ($attr['name'] == 'pcurl') {
			$confstr = get_pcurl($_SERVER['REQUEST_URI']); //获取手机版当前页面URL
		}
		$confstr = update_str_dq($confstr, config('sys.sys_area'));

        $str  = '<?php ';
        $str .= 'echo "'.$confstr.'";';
        $str .= ' ?>';
        return $str;
	}

	public function tagList($attr, $content) {
		$cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : $attr['cid'];
		$titlelen = empty($attr['titlelen']) ? 0 : intval($attr['titlelen']);
		$orderby = empty($attr['orderby']) ? "id DESC" : $attr['orderby'];
		$keyword = empty($attr['keyword']) ? '' : trim($attr['keyword']);
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
		$image = empty($attr['image']) ? '-1' : trim($attr['image']);
		$pagesize = empty($attr['pagesize']) ? 0 : intval($attr['pagesize']);
		$flag = empty($attr['flag']) ? '' : intval($attr['flag']);
		$area = empty($attr['area']) ? '' : intval($attr['area']);
		$top = empty($attr['top']) ? '' : intval($attr['top']);
		$sql = empty($attr['sql']) ? '' : trim($attr['sql']);
		$sql = $sql ? "$sql" : -1;
		$tag = empty($attr['tag']) ? '' : trim($attr['tag']);
		$tag = $tag ? "$tag" : -1;
		$keyword = $keyword ? "$keyword" : -1;

		$str1 = "";
		if (strpos($cid, ',')) {
			$str1 = <<<str
<?php
\$_cid = '$cid';
?>	
str;
		}else{
			$str1 = <<<str
<?php
\$_cid = $cid;
?>	
str;
		}

 		$str = <<<str
<?php
		\$_limit = "$limit";
		\$_keyword = $keyword;
		\$_flag = '$flag';
		\$_areaid = '$area';//指定地区ID
		\$_top = '$top';
		\$_image = '$image';
		\$_pagesize = $pagesize;
		\$_tag = $tag;
		\$_sql = "$sql";

		if(\$_cid == -1) \$_cid = input('cid');
		if (\$_cid > 0 || substr(\$_cid, 0, 1) == '$') {
			
			\$_category = new app\wap\model\CategoryModel();
			if (strpos(\$_cid, ',')) {
				\$_cidarr = explode(',', \$_cid); 
				\$_ids = [];
				foreach (\$_cidarr as \$_k => \$_v) {
					\$_ids = array_merge(\$_ids, \$_category->getChildsId(\$_category->getCategory(), \$_v, true));
				}
			}else{
				\$_ids = \$_category->getChildsId(\$_category->getCategory(), \$_cid, true);
			}
			\$_where = array('create_time' => array('LT', time()), 'cid'=> array('IN', \$_ids));
		}else {
			\$_where = array('create_time' => array('LT', time()));
		}
		if (\$_keyword != -1) {
			\$_where['title'] = array('LIKE','%'.\$_keyword.'%');
		}

		if (\$_flag) {	
			\$_where['istop'] = \$_flag;
		}
		if (\$_top) {	
			\$_where['top'] = \$_top;
		}

		if (\$_image != -1) {
			\$_where['pic'] = \$_image ? ['NEQ', ''] : ['EQ', ''];
		}

		if (\$_tag != -1) {
			\$_jgf = ',';
			\$_jgf = strpos(\$_tag, '，') ? '，' : \$_jgf;
			\$_taglist = explode(\$_jgf,\$_tag);
			if (count(\$_taglist) > 1) {
				\$_tagarr = array();
				foreach (\$_taglist as \$_k => \$_v) {
					\$_tagarr[] = ['LIKE','%'.\$_v.'%'];
				}
				\$_tagarr[] = 'or';
				\$_where['tag'] = \$_tagarr;
			}else{
				\$_where['tag'] = ['LIKE','%'.\$_tag.'%'];
			}
		}


		\$_where['create_time'] = ['LT', time()];
		//地区独立内容
		if (\$_areaid) {
			\$_arealist = explode(',', \$_areaid);
			\$_areawhere = [];
			foreach (\$_arealist as \$key => \$value) {
				if (\$value) {
					\$_areawhere[] = ['LIKE','%,'.\$value.',%'];
				}
			}
			if (count(\$_areawhere) > 1) {
				\$_areawhere[] = 'or';
				\$_where['area'] = \$_areawhere;
			}else{
				\$_where['area'] = \$_areawhere[0];
			}

		}else{
		    \$_area = session('sys_areainfo');
		   	if (\$_area) {
		    	\$_where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,'.\$_area['id'].',%'], 'or'];
		    }else{
		    	\$_where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,88888888,%'], 'or'];
		    }
		}

		\$_wheresql = '';
		\$_pageurlarr = [];
		if (\$_sql != -1) {
			//拼接SQL语句
			\$_db = db('diyfield');
			\$_sqlstrlist = explode(" ", \$_sql);
		
			\$_sqlstr = ' ';
			if (\$_sqlstrlist) {
				foreach (\$_sqlstrlist as \$key1 => \$value1) {
					if (is_numeric(\$value1)) {
						\$_fieldname = \$_db->where(['id'=>\$value1])->value('field');

						if (isset(\$_GET[\$_fieldname]) && \$_GET[\$_fieldname] != '不限' && \$_GET[\$_fieldname] != '') {

							\$_filelist = explode(',', \$_GET[\$_fieldname]);
							\$_instr = "";
							foreach (\$_filelist as \$key2 => \$value2) {
								if (\$value2) {
									\$_instr = \$_instr ? \$_instr." OR (\$_fieldname LIKE '%".\$value2."%')" : "(\$_fieldname LIKE '%".\$value2."%')";
								}
							}
							\$_sqlstr = \$_sqlstr."(\$_instr) ";
						}else{
							\$_sqlstr = \$_sqlstr."( 1 = 1 ) ";
						}

						\$_pageurlarr[\$_fieldname] = isset(\$_GET[\$_fieldname]) ? \$_GET[\$_fieldname] : '';
						
					}else{
						if (\$value1 == 'or') {
							\$_sqlstr = \$_sqlstr."or ";
						}
						if (\$value1 == 'and' ) {
							\$_sqlstr = \$_sqlstr."and ";
						}
					}
				}
			}
			\$_wheresql = \$_sqlstr;
		}

		//获取模型别名
		\$_tabname = "";
		if (\$_cid != -1 && !empty(\$_cid)) {
			\$_mid = db('category')->where(['id'=>\$_cid])->value('mid');
			\$_tabname = db('diymodel')->where(['id'=>\$_mid])->value('tabname');
		}

		\$page = "";//分页
		if (\$_pagesize > 0) {
			\$_pagearr = [];
			switch (config('sys.url_model')) {
		    	case '1'://动态
		    		\$_pagearr = ['query' => request()->param()];
		    		break;
		    	case '3'://伪静态
		    		\$_pagearr = ['path' => ''];
		    		break;
		    }
		    \$_pagearr['var_link_rows'] = 7;
		    //存在cid情况
			if (\$_tabname) {
				\$_infolist = db('content')
				->alias('con')
				->join(config('database.prefix').'diy_'.\$_tabname.' diy','con.vid = diy.conid')
				->where(\$_where)
				->where(\$_wheresql)
				->order("$orderby")
				->paginate(\$_pagesize, false , \$_pagearr);
			}else{
				\$_infolist = db('content')
				->where(\$_where)
				->order("$orderby")
				->paginate(\$_pagesize, false , \$_pagearr);
			}

        	\$page = \$_infolist->render();
        	if (config('sys.url_model') == 3 && \$_area) {
        		if (\$_area['isurl'] == 0) {
        			\$_ctitle = input('ctitle', '', 'trim');
        			\$page = str_replace(\$_ctitle."/", \$_area['etitle'].'_'.\$_ctitle."/", \$page);
        		}
        	}
		}else {
			//存在cid情况
			if (\$_tabname) {
				\$_infolist = db('content')
				->alias('con')
				->join(config('database.prefix').'diy_'.\$_tabname.' diy','con.vid = diy.conid')
				->where(\$_where)
				->where(\$_wheresql)
				->order("$orderby")
				->limit(\$_limit)
				->select();
			}else{
				\$_infolist = db('content')
				->where(\$_where)
				->order("$orderby")
				->limit(\$_limit)
				->select();
			}
		}

		//组合筛选修改分页URL
        if (\$_pageurlarr) {
        	\$_ljstr = config('sys.url_model') == '1' ? "&" : "?";
        	\$page = preg_replace('/href=[\'|\"](\S+)[\'|\"]/i', 'href=$1'.\$_ljstr.build_query(\$_pageurlarr), \$page);
        }
		\$_content = new app\wap\model\ContentModel();

		foreach (\$_infolist as \$k => \$list):
			\$list = \$_content->getContentByCon(\$list);

			\$list['alltitle'] = \$list['title'];
			if($titlelen) \$list['title'] = str2sub(\$list['title'], $titlelen, 0);
			\$list = \$_content->getContentArea(\$list);
			\$list = update_str_dq(\$list, config('sys.sys_area'));
?>		
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str1.$str;
	}

	public function tagInfo($attr, $content) {
		$conid = !isset($attr['conid']) || $attr['conid'] == '' ? -1 : $attr['conid'];
		$type = empty($attr['type']) ? '' : $attr['type'];
		$orderby = empty($attr['orderby']) ? "id" : $attr['orderby'];

 		$str = <<<str
<?php
		\$_conid = $conid;
		\$_type = "$type";
		\$_orderby = "$orderby";


		\$_condata = db('content')->where(['id'=>\$_conid])->find();
		if (\$_condata) {
			\$_content = new app\wap\model\ContentModel();
			if (\$_type == 'prev' || \$_type == 'next') {
				if (\$_type == 'prev') {
					\$_condata = \$_content->getContentPrev(\$_condata['cid'], \$_condata['id'], \$_orderby);
				}else{
					\$_condata = \$_content->getContentNext(\$_condata['cid'], \$_condata['id'], \$_orderby);
				}
				\$_condata = is_object(\$_condata) ? \$_condata->toarray() : \$_condata;
			}else{
				\$_condata = \$_content->getContentArea(\$_condata);
			}
		}
		\$info = \$_condata;
		\$info = update_str_dq(\$info, config('sys.sys_area'));
?>		
str;
		$str .= $content;
		return $str;
	}

	public function tagForm($attr, $content) {
		$fid = !isset($attr['fid']) || $attr['fid'] == '' ? -1 : $attr['fid'];
		$orderby = empty($attr['orderby']) ? "id DESC" : $attr['orderby'];
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
		$pagesize = empty($attr['pagesize']) ? 0 : intval($attr['pagesize']);
		$top = empty($attr['top']) ? '' : intval($attr['top']);

 		$str = <<<str
<?php
		\$_fid = '$fid';
		\$_limit = "$limit";
		\$_top = '$top';
		\$_pagesize = $pagesize;

		if (\$_fid > 0 ) {
			\$_where = array('fid'=>\$_fid);
		}
		if (\$_top) {	
			\$_where['istop'] = \$_top;
		}
		
		\$page = "";//分页
		if (\$_pagesize > 0) {
			\$_pagearr = [];
			switch (config('sys.url_model')) {
		    	case '1'://动态
		    		\$_pagearr = ['query' => request()->param()];
		    		break;
		    	case '3'://伪静态
		    		\$_pagearr = ['path' => ''];
		    		break;
		    }

			\$_infolist = db('formcon')->where(\$_where)->order("$orderby")->paginate(\$_pagesize, false , \$_pagearr);//, false, ['query' => ['catid' => 1]]
        	\$page = \$_infolist->render();
		}else {
			\$_infolist = db('formcon')->where(\$_where)->order("$orderby")->limit(\$_limit)->select();
		}
		\$_formcon = new app\wap\model\DiyformModel();

		foreach (\$_infolist as \$k => \$form):
			\$form = \$_formcon->getOneFormcon(\$form);
?>		
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;

	}

	public function tagLink($attr, $content) {
		$type = empty($attr['type']) ? '' : $attr['type'];
		$orderby = empty($attr['orderby']) ? "id DESC" : $attr['orderby'];
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
		$flag = empty($attr['flag']) ? '' : intval($attr['flag']);
 		$str = <<<str
<?php
		\$_type = '$type';
		\$_flag = '$flag';
		
		\$_where = [];
		if (\$_type) {
			\$_where['type'] = \$_type;
		}

		if (\$_flag) {	
			\$_where['pic'] = \$_flag ? array('NEQ', '') : array('EQ', '');
		}

		//地区独立内容
	    \$_area = session('sys_areainfo');
	   	if (\$_area) {
	    	\$_where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,'.\$_area['id'].',%'], 'or'];
	    }else{
	    	\$_where['area'] = [['exp',' is NULL'],['eq',''],['eq',',,'],['LIKE','%,88888888,%'], 'or'];
	    }

		\$_limit = "$limit";
		\$_infolist = db('link')->where(\$_where)->order("$orderby")->limit(\$_limit)->select();

		foreach (\$_infolist as \$k => \$link):
			\$link = update_str_dq(\$link, config('sys.sys_area'));
?>		
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}

	public function tagBanner($attr, $content) {
		$type = empty($attr['type']) ? '' : $attr['type'];
		$orderby = empty($attr['orderby']) ? "id DESC" : $attr['orderby'];
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
 		$str = <<<str
<?php
		\$_type = '$type';
		
		\$_where = [];
		if (\$_type) {
			\$_where['type'] = \$_type;
		}

		\$_limit = "$limit";
		\$_infolist = db('banner')->where(\$_where)->order("$orderby")->limit(\$_limit)->select();

		foreach (\$_infolist as \$k => \$banner):
			\$banner = update_str_dq(\$banner, config('sys.sys_area'));
?>		
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}
	public function tagBlock($attr) {
		$name = isset($attr['name']) ? $attr['name'] : '';
		$infolen = empty($attr['infolen']) ? 0 : intval($attr['infolen']);
		$textflag = empty($attr['textflag']) ? 0 : 1;
		$name = trim($name);
		$str =<<<str
<?php
		\$_block = db('block')->where("title='".'$name'."'")->find();
		\$_block = update_str_dq(\$_block, config('sys.sys_area'));
		\$_block_content = '';
		if (\$_block) {
			if (\$_block['type'] == 2) {
				if (!$textflag) {
					\$_block_content = '<img src="'. \$_block['content'] .'" />';
				}else {
					\$_block_content = \$_block['content'];
				}
			}else {
				if($infolen) {
					\$_block_content = str2sub(strip_tags(\$_block['content']), $infolen, 0);//清除html再截取
				}else {
					\$_block_content = \$_block['content'];
				}
			}

			\$_blockurl = '';
			if (\$_block['url']) {
				\$_blockurl = \$_block['url'];
				if (substr(\$_blockurl, 0,1) == '@') {
		            \$_catemodel = new app\wap\model\CategoryModel();
		            \$_category = \$_catemodel->getOneCategory(substr(\$_blockurl, 1));
		            if (\$_category) {
		                \$_blockurl = \$_catemodel->getCategoryUrl(\$_category);
		            }
		        }
				\$_block_content= "<a href='".\$_blockurl."' target='_blank'>".\$_block_content."</a>";
			}
		}
		echo \$_block_content;
?>
str;
		return $str;
	}

	public function tagCatlist($attr, $content) {
		$cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1 : trim($attr['cid']);//只接收一个栏目ID
		$type = empty($attr['type'])? 'son' : $attr['type'];//son表示下级栏目,self表示同级栏目,top顶级栏目(top忽略typeid)
		$flag = empty($attr['flag']) ? 1: intval($attr['flag']);//0(不显示链接和单页),1(全部显示)
		$limit = empty($attr['limit'])? '10' : $attr['limit'];
		
		$str = <<<str
<?php
		\$_limit = "$limit";
		\$_cid = intval($cid);
		\$_type = "$type";
		
		\$_category = new app\wap\model\CategoryModel();
		if(\$_cid == -1) \$_cid = input('cid');
		\$_catlist = \$_category->getCategory(1);

		if ($flag == 0) {
			\$_catlist = \$_category->clearLink(\$_catlist);//去除外部链接的栏目
		}
		//type为parent
		if (\$_type == 'parent') {
			\$_parent  = \$_category->getParents(\$_catlist, \$_cid);
			\$_catlist  = \$_category->unlimitedForLayer(\$_catlist, 'child', \$_parent[0]['id']);

		}else{
			//type为top,忽略cid
			if(\$_cid == 0 || \$_type == 'top') {
				\$_catlist  = \$_category->unlimitedForLayer(\$_catlist);
			}else {
				
				if (\$_type == 'self') {
					//同级分类
					\$_typeinfo  = \$_category->getSelf(\$_catlist, \$_cid );
					\$_catlist  = \$_category->unlimitedForLayer(\$_catlist, 'child', \$_typeinfo['pid']);
				}else {
					//son，子类列表
					\$_catlist  = \$_category->unlimitedForLayer(\$_catlist, 'child', \$_cid);
				}
			}
		}
		\$_limit_list = explode(',', \$_limit);
		foreach(\$_catlist as \$autoindex => \$catlist):
			if(count(\$_limit_list) > 1){
				if((\$autoindex < \$_limit_list[0]) || (\$autoindex > \$_limit_list[1])) continue;
			} else{
				if(\$autoindex >= \$_limit_list[0]) break;
			}
			\$catlist = update_str_dq(\$catlist, config('sys.sys_area'));

?>
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}

	public function tagNav($attr, $content) {
		$typeid = !isset($attr['typeid']) || $attr['typeid'] == '' ? -1 : trim($attr['typeid']);
		$limit = empty($attr['limit'])? '10' : $attr['limit'];
		
		$str = <<<str
<?php
		\$_limit = "$limit";
		\$_typeid = intval('$typeid');
		
		\$_category = new app\wap\model\CategoryModel();
		\$_navlist = \$_category->getCategory('', \$_typeid, false);
		

		\$_navlist  = \$_category->unlimitedForLayer(\$_navlist);

		foreach(\$_navlist as \$autoindex => \$nav):
			\$_limit_list = explode(',', \$_limit);
			if(count(\$_limit_list) > 1){
				if((\$autoindex < \$_limit_list[0]) || (\$autoindex > \$_limit_list[1])) continue;
			} else{
				if(\$autoindex >= \$_limit) break;
			}
			\$nav = update_str_dq(\$nav, config('sys.sys_area'));
?>
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}

	public function tagType($attr, $content) {
		$typeid = empty($attr['typeid']) ? 0 : trim($attr['typeid']);
		$type = empty($attr['type'])? 'son' : $attr['type'];//parent父级
		$str = <<<str
<?php
		\$_type = "$type";
		\$_typeid = intval($typeid);

		\$_category = new app\wap\model\CategoryModel();

		\$_catlist = \$_category->getCategory(1);
		if (\$_type == 'parent') {
			\$_parent  = \$_category->getParents(\$_catlist, \$_typeid);
			\$_typeid  = \$_parent[0]['id'];
		}

		\$type = \$_category->getOneCategory(\$_typeid);
		\$type['url'] = \$_category->getCategoryUrl(\$type);
		\$type = update_str_dq(\$type, config('sys.sys_area'));
?>
str;
		$str .= $content;
		return $str;

	}

	public function tagArea($attr, $content) {
		$top = empty($attr['top']) ? 0 : intval($attr['top']);
		$con = empty($attr['con']) ? 0 : intval($attr['con']);
		$url = empty($attr['url']) ? 0 : intval($attr['url']);
		$conurl = empty($attr['conurl']) ? '' : trim($attr['conurl']);
		$type = empty($attr['type']) ? '' : trim($attr['type']);
		$pid = empty($attr['pid']) ? 0 : $attr['pid'];
		$limit = empty($attr['limit']) ? 10 : intval($attr['limit']);
		$type = $type ? "$type" : -1;

		$str = <<<str
<?php
		\$_limit = "$limit";
		\$_top = intval('$top');
		\$_con = intval('$con');
		\$_url = intval('$url');
		\$_conurl = intval('$conurl');
		\$_pid = $pid;
		\$_type = '$type';

		\$_where = [];
		if (\$_top) {
			\$_where['istop'] = \$_top;
		}
		if (\$_con) {
			\$_where['iscon'] = \$_con;
		}
		if (\$_url) {
			\$_where['isurl'] = \$_url;
		}
		
		if (\$_type == "current") {
			if (\$_area) {
				\$_where['id'] = \$_area['id'];
			}
		}
		
	    if (\$_type == -1 || \$_type == "group" || \$_type == "1" ) {
		    \$_area = session('sys_areainfo');
		    if (\$_area && !\$_conurl) {
		    	\$_where['pid'] = \$_area['id'];
		    }else{
		    	\$_where['pid'] = \$_pid ? \$_pid : 0;
		    }
		}
		
		if (\$_type == "level" ) {
			
		}
		\$_where['isopen'] = 1;
		\$_limit = "$limit";
		\$_infolist = db('area')->where(\$_where)->order("sort asc")->limit(\$_limit)->select();
		if (empty(\$_infolist)) {
			if (\$_area && !\$_conurl) {
				\$_where['pid'] = \$_area['pid'];
				\$_infolist = db('area')->where(\$_where)->order("sort asc")->limit(\$_limit)->select();
			}
		}

		\$_area = new app\wap\model\AreaModel();
		\$_category = new app\wap\model\CategoryModel();
		\$_content = new app\wap\model\ContentModel();
		foreach(\$_infolist as \$autoindex => \$area):
			if (\$_conurl) {
				\$area['url'] = \$_area->getAreaUrl(\$area);
			}else{
				if (isset(\$content)) {
					\$_data = \$_content->getContentArea(\$content, \$area);
					\$area['url'] = \$_data['url'];
					\$area['title'] = \$area['stitle'].\$content['ys_title'];
				}else{
					if (isset(\$cate)){
						\$_data = \$_category->getCategoryArea(\$content, \$area);
						\$area['url'] = \$_data['url'];
						\$area['title'] = \$area['stitle'].\$category['ys_title'];
					}else{
						\$area['url'] = \$_area->getAreaUrl(\$area);
					}
				}
			}
?>
str;

		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}

	public function tagPosition($attr, $content) {
		$cid = !isset($attr['cid']) || $attr['cid'] == '' ? -1: trim($attr['cid']);//只接收一个栏目ID
		$sname = isset($attr['sname']) ? trim($attr['sname']) : '';	
		$surl = isset($attr['surl']) ? trim($attr['surl']) : '';	
		$delimiter = isset($attr['delimiter']) ? trim($attr['delimiter']) : '';

		$str =<<<str
<?php
		\$_sname = "$sname";
		\$_cid = $cid;

		echo getPosition(\$_cid, \$_sname, "$surl", "$delimiter");
?>
str;

		return $str;
	}

	public function tagUrl($attr, $content){
		$constr = "";
		switch ($attr['name']) {
			case 'home':
				$constr = getHomeurl();
				break;
			case 'search':
				$constr = getSearchurl();
				break;
			case 'form':
				$constr = getFormurl();
				break;
			case 'captcha':
				$constr = getCaptchaurl($attr['id']);
				break;
		}

		$str  = '<?php ';
        $str .= 'echo "'.$constr.'";';
        $str .= ' ?>';
        return $str;
	}

public function tagCwkeywords($attr, $content){
		$type = isset($attr['type']) ? trim($attr['type']) : 'cd';	
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
		$str = <<<str
<?php
		\$_type = "$type";
		\$_limit = "$limit";
		\$_content = new app\wap\model\ContentModel();
		if (isset(\$content)) {
		    \$_area = session('sys_areainfo');
		    \$_areaname = \$_area ? \$_area['stitle'] : "";
			
			\$_infolist = [];
			//cd模式 标题+长尾
			if (\$_type == 'cd') {
				\$_keywordlist = explode(',', config('sys.seo_cwkeyword'));
				foreach(\$_keywordlist as \$autoindex => \$keyword):
					\$info['name'] = array_key_exists("ys_title", \$content) ? \$content['ys_title'].\$keyword : \$content['title'].\$keyword;
					\$info['name'] = \$_areaname . \$info['name'];
					\$info['url'] = \$_content->getContentUrl(\$content, \$info['name']);
					\$_infolist[] = \$info;
				endforeach;
			}
			//bc模式 词头+标题
			if (\$_type == 'bc') {
				\$_keywordlist = explode(',', config('sys.seo_ctkeyword'));
				foreach(\$_keywordlist as \$autoindex => \$keyword):

					\$info['name'] = array_key_exists("ys_title", \$content) ? \$keyword.\$content['ys_title'] : \$keyword.\$content['title'];
					\$info['name'] = \$_areaname . \$info['name'];
					\$info['url'] = \$_content->getContentUrl(\$content, \$info['name']);
					\$_infolist[] = \$info;
				endforeach;
			}
			//bcd模式 词头+标题+长尾
			if (\$_type == 'bcd') {
				\$_keywordlist_d = explode(',', config('sys.seo_cwkeyword'));
				\$_keywordlist_b = explode(',', config('sys.seo_ctkeyword'));
				foreach(\$_keywordlist_b as \$autoindex_b => \$keyword_b):
					foreach(\$_keywordlist_d as \$autoindex_d => \$keyword_d):
						\$info['name'] = array_key_exists("ys_title", \$content) ? \$keyword_b.\$content['ys_title'].\$keyword_d : \$keyword_b.\$content['title'].\$keyword_d;
					
						\$info['name'] = \$_areaname .\$info['name'];
						\$info['url'] = \$_content->getContentUrl(\$content, \$info['name']);
						\$_infolist[] = \$info;
					endforeach;
				endforeach;
			}
			

			if (\$_limit) {
				\$_infolist = array_slice(\$_infolist, 0, \$_limit);
			}

			foreach(\$_infolist as \$autoindex => \$keyword):
				\$cwkeywords['name'] = \$keyword['name'];
				\$cwkeywords['url'] = \$keyword['url'];
?>
str;

	$str .= $content;
	
	$str .='<?php endforeach;?>';
	$str .='<?php } ?>';
	return $str;
	}

	public function tagTag($attr, $content){
		$title = isset($attr['title']) ? trim($attr['title']) : '';	
		$title = $title ? "$title" : -1;
		$limit = empty($attr['limit']) ? 10 : $attr['limit'];
		$str =<<<str
<?php
		\$_title = $title;
		\$_limit = "$limit";
		if (\$_title != -1) {
			\$_jgf = ',';
			\$_jgf = strpos(\$_title, '，') ? '，' : \$_jgf;
			\$_strlist = explode(\$_jgf, \$_title);
			\$_infolist = [];
			foreach (\$_strlist as \$k => \$v) {
				\$_infolist[] = ['title'=>\$v, 'num'=>1];
			}
		}else{
			//获取全站tag	
			\$_content = new app\wap\model\ContentModel();
			\$_infolist = \$_content->getTaglist();
		}
		if (\$_limit) {
			\$_infolist = array_slice(\$_infolist, 0, \$_limit);
		}
		foreach (\$_infolist as \$autoindex => \$val): 
			\$tag['title'] = \$val['title'];
			\$tag['url'] = getTagurl(\$val['title']);
			\$tag['num'] = \$val['num'];
?>
str;
		$str .= $content;
		$str .='<?php endforeach;?>';
		return $str;
	}

	public function tagField($attr, $content){
		$id = isset($attr['id']) ? intval($attr['id']) : 0;	
		$group = isset($attr['group']) ? trim($attr['group']) : "";	
		$noset = isset($attr['noset']) ? trim($attr['noset']) : "true";	
		$active = isset($attr['active']) ? trim($attr['active']) : "active";	
		$str =<<<str
<?php
		\$_id = $id;
		\$_group = "$group";
		\$_noset = $noset;
		\$_active = "$active";
		\$_db = db('diyfield');
		\$_fielddata = \$_db->where(['id'=>\$_id])->find();
		if (\$_fielddata) {

		\$ff = \$_fielddata['field'];
		\$_infolist = explode("\n", \$_fielddata['values']);
		
		\$_garr = [];
		if (\$_group) {
			\$_garrdata = explode(',',\$_group);
			foreach (\$_garrdata as \$key1 => \$value1) {
				\$_gname = \$_db->where(['id'=>\$value1])->value('field');
				\$_garr[\$_gname] = isset(\$_GET[\$_gname]) ? \$_GET[\$_gname] : '';
			}
		}

		\$_category = new app\index\model\CategoryModel();
		\$fieldcate = \$_category->getOneCategory(\$cid);

		if (\$_noset) {
			array_unshift(\$_infolist, '不限');
		}
		\$_ljstr = config('sys.url_model') == '1' ? "&" : "?";
		\$_dqfield = \$_garr[\$ff];
		foreach (\$_infolist as \$autoindex => \$val): 
			
			if (\$_fielddata['ftype'] == 'select') {
				\$_garr[\$ff] = \$val;
				\$field['name'] = \$val;
				\$field['url'] = \$_category->getCategoryUrl(\$fieldcate).\$_ljstr.build_query(\$_garr);
				if (isset(\$_GET[\$ff]) && \$_GET[\$ff] != '') {
					\$field['active'] =  \$_GET[\$ff] == \$val ? \$_active : '';
				}else{
					\$field['active'] =  \$val == '不限' ? \$_active : '';
				}
			}else{
				\$_callist = explode(',',\$_dqfield);
				\$field['name'] = \$val;
				if (isset(\$_GET[\$ff]) && \$_GET[\$ff] != '') {
					\$field['active'] =  in_array(\$val, \$_callist)  ? \$_active : '';
				}else{
					\$field['active'] =  \$val == '不限' ? \$_active : '';
				}
				if (in_array(\$val, \$_callist)) {
					\$key = array_search(\$val, \$_callist);
					unset(\$_callist[\$key]);
					\$_garr[\$ff] = implode(',', \$_callist);
					\$field['url'] = \$_category->getCategoryUrl(\$fieldcate).\$_ljstr.build_query(\$_garr);
				}else{
					\$_callist[] = \$val;
					\$_garr[\$ff] = implode(',', \$_callist);
					\$field['url'] = \$_category->getCategoryUrl(\$fieldcate).\$_ljstr.build_query(\$_garr);
				}
			}
			
			
			
?>
str;
		$str .= $content;
		$str .='<?php endforeach; } ?>';

		return $str;
	}
}


?>