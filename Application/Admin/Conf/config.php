<?php 
return array(
		'LOAD_EXT_CONFIG' => '',
		'AUTH_TOKEN'=>'_^&javakdyadmin2211112_',
		'LOGIN_TIMEOUT'=>3600,
		'ATTACHSIZE'=>52428800,//文件大小byte
		 
		'ATTACHEXT'=>array('jpg', 'gif', 'png', 'jpeg','pdf','pptx','txt','doc'),//格式
		 
		'ATTACH'=>'',
		 
		'THUMBMAXWIDTH'=>'',
		 
		'THUMBMAXHEIGHT'=>'',
		 
		'ATTACHPATH'=>'./Uploads',
		
		'TMPL_DETECT_THEME'=>true,
		'DEFAULT_THEME'    =>'default',
		'URL_HTML_SUFFIX'       =>'',
		'TMPL_PARSE_STRING'  =>array(
		
				'__JS__' => '/gc/Public/Js', // 增加新的JS类库路径替换规则
		
				'__CSS__' => '/gc/Public/Css', // 增加新的css类库路径替换规
		
				'__IMG__' => '/gc/Public/images/', // 增加新的img类库路径替换
		
				'__UPLOAD__' => './Uploads', // 增加新的上传路径替换规则
		)
);

?>