<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title>WebSite Admin</title>
<link href="/vkids/Public/Css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="/vkids/Public/Css/adminbase.css" type="text/css" rel="stylesheet" />

</head>
<body>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>  
<script src="/vkids/Public/Js/bootstrap.min.js"></script>
 
<script>
$(function(){
	  var info="<?php echo ($_GET['info']); ?>";
	  var status="<?php echo ($_GET['status']); ?>";
	  var className='';
	  if(status==1) className='alert-block';
	  else className='alert-error';
	  if(info!=''&&status!=''){
		  var html='<div id="msg-alert" class="alert '+className+'"><button type="button" class="close" data-dismiss="alert">&times;</button><p>'+info+'</p></div>';
		  jQuery('.breadcrumb').after(html);
		  setTimeout(function(){
			  $("#msg-alert").fadeOut();
		  },3000);
	  }
});
</script>
<link rel="stylesheet" type="text/css" href="/vkids/Public/Css/course.css"/>
<body>
<div class="container" style="width:1480px;">
      <div class="row">
        <div class="span3">
         <div class="well sidebar-nav">
            
            <ul class="nav nav-list">
            <p>Admin：<?php echo $_SESSION['loginUserName'];?>&nbsp;&nbsp;<a href="javascript:void(0);" id="logoutBtn">Logout</a></p>
              <li class="nav-header">最新消息</li>
              <li <?php if($type == 'news'): ?>class="active"<?php endif; ?>><a href="<?php echo U('List/index',array('type'=>'news'));?>">最新消息</a></li>
              <li class="nav-header">對外合作</li>
              <li <?php if($type == 'tutors'): ?>class="active"<?php endif; ?>><a href="<?php echo U('Cooperation/index');?>">對外合作</a></li>
              <li class="nav-header">報章報導</li>
              <li <?php if($type == 'tutors'): ?>class="active"<?php endif; ?>><a href="<?php echo U('Report/index');?>">報章報導</a></li>
              <li class="nav-header">教學理念</li>
              <li <?php if($type == 'x'): ?>class="active"<?php endif; ?>><a href="<?php echo U('Idea/index',array('id'=>1));?>">教學理念</a></li>
              <!-- <li class="nav-header"> Case Studies of Student</li>
              <li  <?php if($type == 'case'): ?>class="active"<?php endif; ?>><a href="<?php echo U('List/index',array('type'=>'case'));?>"> Case Studies of Student</a></li> -->
              <li class="nav-header">成就及作品</li>
              <li  <?php if($_GET['pid']== '1'): ?>class="active"<?php endif; ?>><a href="<?php echo U('List/photos',array('type'=>'studentphotos','pid'=>1));?>">學生成就</a></li>
              <li  <?php if($_GET['pid']== '2'): ?>class="active"<?php endif; ?>><a href="<?php echo U('List/photos',array('type'=>'studentphotos','pid'=>2));?>">作品欣賞</a></li>
              <li  <?php if($_GET['pid']== '3'): ?>class="active"<?php endif; ?>><a href="<?php echo U('Child/index');?>">孩子之聲</a></li>

              <li class="nav-header">藝術課程</li>
               <li  <?php if($_GET['cid']== '1'): ?>class="active"<?php endif; ?>><a href="<?php echo U('Course/index');?>">藝術課程</a></li>
            </ul>
</div><!--/.well -->
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>
<script>
jQuery(function(){
   jQuery("#logoutBtn").click(function(){
		$.get('<?php echo U('Common/logout');?>',function(responseText){
		    var info=responseText['info'];
	        var status=responseText['status'];
	        var url=responseText['url'];
	        if(status==1){
	        alert(info)
	        window.location.href=url;
	        } else alert(info);
	  });
   });
});
</script>
        </div><!--/span-->
        <div class="span9">
                     <ul class="breadcrumb">
				    <li><a href="#">Home</a> <span class="divider">/</span></li>
				    <li><a href="#"><?php echo (ucfirst($type)); ?> Management</a> <span class="divider">/</span></li>
				    <li class="active"><?php echo (ucfirst($type)); ?> Management</li>
				    </ul>
				<legend><?php if($list['id'] != ''): ?>Edit<?php else: ?>Add<?php endif; ?> <?php echo (ucfirst($type)); ?></legend>	
                    <form class="form-horizontal" id="myForm" method="post" action="<?php echo U('save');?>" onsubmit="editor.sync();myForm.submit();" enctype="multipart/form-data">
				    <div class="control-group">
				    <label class="control-label">Title:</label>
				    <div class="controls">
				    <input type="text" id="title" name="title" check="Require" warning="Title cann't be empty" value="<?php echo ($list["title"]); ?>" >
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Date:</label>
				    <div class="controls">
				      <input type="text" id="date" name="date" check="Require" warning="Date cann't be empty" <?php if($list['id'] == ''): ?>value="<?php echo date("Y-m-d");?>"<?php else: ?>value="<?php echo (date("Y-m-d",$list["date"])); ?>"<?php endif; ?> >
				    </div>
				    </div>

				    <div class="control-group">
				    <label class="control-label">Content:</label>
				    <div class="controls">
				     <textarea id="content" name="content" style="width:500px;height:300px;"><?php echo ($list["content"]); ?></textarea>
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Status:</label>
				    <div class="controls">
				      <input type="radio" id="status1" name="status" value="1" <?php if($list['status'] != '0'): ?>checked="checked"<?php endif; ?> /><span class="help-inline">Yes</span> <input type="radio" id="status1" name="status" value="0"  <?php if($list['status'] == '0'): ?>checked="checked"<?php endif; ?>/><span class="help-inline">No</span>
				    </div>
				    </div>
				    <input type="hidden" id="id" name="id" value="<?php echo ($list["id"]); ?>" />
				    <div class="control-group">
				    <div class="controls">
				    <button type="submit" class="btn">Submit</button>
				    </div>
				    </div>
				    </form>
	          
        </div><!--/span-->
      </div><!--/row-->

      <hr>

    </div>
<script src="/vkids/Public/Js/kindeditor/kindeditor.js"></script>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>
<script src="/vkids/Public/Js/jquery.form.js"></script>
<script src="/vkids/Public/Js/CheckForm.js"></script>
<script src="/vkids/Public/Js/bootstrap-datepicker.js"></script>
<script src="/vkids/Public/Js/common.js"></script>
<script>
KindEditor.ready(function(K) {
	editor1 = K.create('#content', {
					allowFileManager : true,
					urlType : 'domain'
	});
});
</script>
</body>
</html>