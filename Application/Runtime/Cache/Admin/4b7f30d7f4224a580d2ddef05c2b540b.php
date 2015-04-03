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
<body>
<div class="container">
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
				    <p>
				    <?php if($type != 'forget'): ?><form >
					       <div class="input-append">
						    <a class="btn" href='<?php echo U('clist');?>'>Add <?php echo (ucfirst($type)); ?></a>
						    </div>
					 </form><?php endif; ?>
					</p>
				<legend><?php echo (ucfirst($type)); ?> Management</legend>	
				<div class="container">
				    <div class="row">
				     <div class="span10">
				         <table class="table table-striped">
			              <thead>
			                <tr>
			                    <th>ID</th>
			                    <th>Title</th>
			                    <th>Action</th>
			                    </if>
			                </tr>
			              </thead>
			              <tbody>
			               <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr <?php if($current == $vo['id']): ?>class="warning"<?php endif; ?>>
			                    <td><?php echo ($vo["id"]); ?></td>
			                    <td><?php echo ($vo["title"]); ?></td>
			                    <td>
			                    <a href="<?php echo U('photo',array('pid'=>$vo['id']));?>">Photos</a>&nbsp;&nbsp;<a href="<?php echo U('clist',array('id'=>$vo['id']));?>">Edit</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="del('<?php echo U('delNews',array('id'=>$vo['id']));?>');">Delete</a></td>
			                   
			                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
			              </tbody>
			            </table>
				     </div>
				   </div>  
				</div>
	            <div class="pagination pagination-right">
	              <ul>
	                <?php echo ($show); ?>
	             </ul>
	            </div>
	          
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>    
<script>
  function del(url){
	  if(url=='') return false;
      if(window.confirm('Are you sure to delete this record?')){	  
		  $.get(url,function(responseText){
			    var info=responseText['info'];
		        var status=responseText['status'];
		        var url=responseText['url'];
		        if(status==1){
		        alert(info)
		        window.location.href=url;
		        } else alert(info);
		  });
		  return true;
	  }
  }
</script>   
</body>
</html>