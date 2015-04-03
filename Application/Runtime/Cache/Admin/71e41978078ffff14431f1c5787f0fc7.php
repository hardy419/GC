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
<style>
.form-horizontal label{font-size:12px;}
.form-horizontal .control-label{width:50px;}
.form-horizontal .controls{margin-left:60px;}
.form-horizontal .control-group{margin-bottom:10px;}
 input[type="file"]{width:140px;}
 input[type="text"]{border-radius:0px;height:20px;line-height:20px;}
 .error{color:red;}
 .row-fluid .span3{height:220px;overflow:hidden;}
</style>
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
				    <li><a href="#"><?php if($type == 'newscategory'): ?>News Photos <?php elseif($type == 'studentphotos'): ?>Student Photos<?php else: echo (ucfirst($type)); endif; ?> Management</a> <span class="divider">/</span></li>
				    <li class="active"><?php if($type == 'newsphotos'): ?>News Photos <?php elseif($type == 'studentphotos'): ?>Student Photos<?php else: echo (ucfirst($type)); endif; ?> Management</li>
				    </ul>
				<legend><?php if($type == 'newsphotos'): ?>News Photos <?php elseif($type == 'studentphotos'): ?>Student Photos <?php else: echo (ucfirst($type)); endif; ?> Management</legend>	
                <div class="row-fluid">
                   <div class="span8">
                            <ul class="thumbnails">
                              <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($i%4 == 1): ?><li class="span3" style="margin-left:0px;">
                                <?php else: ?>
							    <li class="span3"><?php endif; ?>
							    <div class="thumbnail">
							     
							    <img src="<?php echo SITE_PATH;?>Uploads/<?php echo (substr($vo["pic"],1)); ?>" style="width:100%;max-height:120px;" >
							    <p><?php echo ($vo["title"]); ?></p>
							    <p><a class="btn" href="javascript:void(0);" onclick="edit('<?php echo ($vo["id"]); ?>');">Edit</a> <a class="btn" id="delete" href="#" onclick="del('<?php echo U('del',array('type'=>$type,'id'=>$vo['id']));?>')">Delete</a></p>
							    </div>
							    </li><?php endforeach; endif; else: echo "" ;endif; ?>
						    </ul>
						     <div class="pagination pagination-right">
					              <ul>
					                <?php echo ($show); ?>
					             </ul>
					         </div>
                   </div>
                   <div class="span4">
                   
					<legend>Upload images:</legend>
                            <form id="myForm" class="form-horizontal"  method="post" action="<?php echo U('savePhotos');?>">
                               <div class="control-group">
									<label class="control-label">Sort</label>
									<div class="controls">
									<input type="text" id="sid1" name="sid[]" class="input-small" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Title</label>
									<div class="controls">
									<input type="text" id="title1" name="title[]" class="input-small"  />
									</div>
								</div>
								<?php if($type == 'studentphotos'): ?><div class="control-group">
									<label class="control-label">Name:</label>
									<div class="controls">
									<input type="text" id="name1" name="name[]" class="input-small"  />
									</div>
								</div><?php endif; ?>
							    <div class=" control-group">
					             <label class="control-label">File:</label>
					                   <div class="controls">
					                    <input type="text" id="pic1" name="pic[]" /><span id="word_pic1" class="help-inline"></span>
					                   </div>
					                </div>
					                 <div class=" control-group"   style="margin-bottom:20px;">
					                   <label class="control-label"></label>
					                   <div class="controls fileinput-button">
					                     <span class="fileinput-button"><span>Click Here To Upload</span><input id="fileupload_pic1" type="file" name="files" class="input" ></span>
					                     <span class=" iconshadow" ><i class="icon-remove" onClick="tool.removeMovie('#pic1')"></i></span>
					                     <span class="help-text"><span class="label label-important">Max Photo Size:<?php echo C(ATTACHSIZE)/1024/1024;?>M <?php if($type == 'newsphotos'): ?>width*height(467*350)<?php elseif($type == 'tutorsphotos'): ?>width*height(460*344)<?php elseif($_GET['pid']== '3'): ?>width*height(1000*1200)<?php else: ?>width*height(230*160)<?php endif; ?></span></span>
					                   </div>
					                </div>
							   <div class="control-group">
									<label class="control-label">Sort</label>
									<div class="controls">
									<input type="text" id="sid2" name="sid[]" class="input-small" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Title</label>
									<div class="controls">
									<input type="text" id="title2" name="title[]" class="input-small"  />
									</div>
								</div>
								<?php if($type == 'studentphotos'): ?><div class="control-group">
									<label class="control-label">Name:</label>
									<div class="controls">
									<input type="text" id="name1" name="name[]" class="input-small"  />
									</div>
								</div><?php endif; ?>
								 <div class=" control-group">
					             <label class="control-label">File:</label>
					                   <div class="controls">
					                    <input type="text" id="pic2" name="pic[]" /><span id="word_pic2" class="help-inline"></span>
					                   </div>
					                </div>
					                 <div class=" control-group"   style="margin-bottom:20px;">
					                   <label class="control-label"></label>
					                   <div class="controls fileinput-button">
					                     <span class="fileinput-button"><span>Click Here To Upload</span><input id="fileupload_pic2" type="file" name="files" class="input" ></span>
					                     <span class=" iconshadow" ><i class="icon-remove" onClick="tool.removeMovie('#pic2')"></i></span>
					                     <span class="help-text"><span class="label label-important">Max Photo Size:<?php echo C(ATTACHSIZE)/1024/1024;?>M <?php if($type == 'newsphotos'): ?>width*height(467*350)<?php elseif($type == 'tutorsphotos'): ?>width*height(460*344)<?php elseif($_GET['pid']== '3'): ?>width*height(1000*1200)<?php else: ?>width*height(230*160)<?php endif; ?></span></span>
					                   </div>
					                </div>
								
								<div class="control-group">
									<label class="control-label">Sort</label>
									<div class="controls">
									<input type="text" id="sid3" name="sid[]" class="input-small"  />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Title</label>
									<div class="controls">
									<input type="text" id="title3" name="title[]" class="input-small"  />
									</div>
								</div>
								<?php if($type == 'studentphotos'): ?><div class="control-group">
									<label class="control-label">Name:</label>
									<div class="controls">
									<input type="text" id="name1" name="name[]" class="input-small"  />
									</div>
								</div><?php endif; ?>
								 <div class=" control-group">
					             <label class="control-label">File:</label>
					                   <div class="controls">
					                    <input type="text" id="pic3" name="pic[]"  /><span id="word_pic3" class="help-inline"></span>
					                   </div>
					                </div>
					                 <div class=" control-group"   style="margin-bottom:20px;">
					                   <label class="control-label"></label>
					                   <div class="controls fileinput-button">
					                     <span class="fileinput-button"><span>Click Here To Upload</span><input id="fileupload_pic3" type="file" name="files" class="input" ></span>
					                     <span class=" iconshadow" ><i class="icon-remove" onClick="tool.removeMovie('#pic1')"></i></span>
					                     <span class="help-text"><span class="label label-important">Max Photo Size:<?php echo C(ATTACHSIZE)/1024/1024;?>M <?php if($type == 'newsphotos'): ?>width*height(467*350)<?php elseif($type == 'tutorsphotos'): ?>width*height(460*344)<?php elseif($_GET['pid']== '3'): ?>width*height(1000*1200)<?php else: ?>width*height(230*160)<?php endif; ?></span></span>
					                   </div>
					                </div>
								
								
								<div class="control-group">
									<label class="control-label">Sort</label>
									<div class="controls">
									<input type="text" id="sid4" name="sid[]" class="input-small"  />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Title</label>
									<div class="controls">
									<input type="text" id="title4" name="title[]" class="input-small"  />
									</div>
								</div>
								<?php if($type == 'studentphotos'): ?><div class="control-group">
									<label class="control-label">Name:</label>
									<div class="controls">
									<input type="text" id="name1" name="name[]" class="input-small"  />
									</div>
								</div><?php endif; ?>
								 <div class=" control-group">
					             <label class="control-label">File:</label>
					                   <div class="controls">
					                    <input type="text" id="pic4" name="pic[]"  /><span id="word_pic4" class="help-inline"></span>
					                   </div>
					                </div>
					                 <div class=" control-group"   style="margin-bottom:20px;">
					                   <label class="control-label"></label>
					                   <div class="controls fileinput-button">
					                     <span class="fileinput-button"><span>Click Here To Upload</span><input id="fileupload_pic4" type="file" name="files" class="input" ></span>
					                     <span class=" iconshadow" ><i class="icon-remove" onClick="tool.removeMovie('#pic4')"></i></span>
					                     <span class="help-text"><span class="label label-important">Max Photo Size:<?php echo C(ATTACHSIZE)/1024/1024;?>M <?php if($type == 'newsphotos'): ?>width*height(467*350)<?php elseif($type == 'tutorsphotos'): ?>width*height(460*344)<?php elseif($_GET['pid']== '3'): ?>width*height(1000*1200)<?php else: ?>width*height(230*160)<?php endif; ?></span></span>
					                   </div>
					                </div>
								<input type="hidden" id="pid" name="pid" value="<?php echo ($_GET['pid']); ?>" />
								<input type="hidden" id="type" name="type" value="<?php echo ($_GET['type']); ?>" />
								<div class="control-group" style="margin-top:20px;text-align:right;">
									<label class="control-label"></label>
									<div class="controls">
									<input type="submit" class="btn" value="Upload" id="submit"/>
									</div>
								</div>
							    
							    </form>
                   
                   </div>
                </div>   
	           
	          
        </div><!--/span-->
      </div><!--/row-->

      <hr>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h3 id="myModalLabel">Edit Photos</h3>
</div>
<div class="modal-body">
 <form id="editForm" class="form-horizontal" enctype="multipart/form-data" method="post" action="<?php echo U('save');?>">
                              
								<div class="control-group">
									<label class="control-label">File</label>
									<div class="controls">
									 <span class="help-inline"><img src="" id="file" width="200"/></span>
									</div>
								</div>
                               <div class="control-group">
									<label class="control-label">Sort</label>
									<div class="controls">
									<input type="text" id="sid" name="sid" class="input-small" /><span class="help-inline error">(From large to small)</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Title</label>
									<div class="controls">
									<input type="text" id="title" name="title" class="input-small"  />
									</div>
								</div>
								<?php if($type == 'studentphotos'): ?><div class="control-group">
									<label class="control-label">Name:</label>
									<div class="controls">
									<input type="text" id="name" name="name" class="input-small"  />
									</div>
								</div><?php endif; ?>
								<input type="hidden" id="id" name="id" value="" />
								<input type="hidden" id="type" name="type" value="<?php echo ($_GET['type']); ?>" />
								<div class="control-group" style="margin-top:20px;">
									<label class="control-label"></label>
									<div class="controls">
									<input type="submit" class="btn" value="Submit" id="submit"/>
									</div>
								</div>
							    
</form>								
</div>
</div>
      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>
<script src="/vkids/Public/Js/bootstrap.min.js"></script>
<script src="/vkids/Public/Js/jquery.form.js"></script>
<script src="/vkids/Public/Js/CheckForm.js"></script>
<script src="/vkids/Public/Js/jquery-ui.min.js"></script>
<script src="/vkids/Public/Js/jquery.fileupload.js"></script>
<script src="/vkids/Public/Js/common.js"></script>    
<script>
var tool={
		uploadMovie:function(url,btn,input,msg){
			jQuery(btn).fileupload({
			    url: url,
			    dataType: 'json',
			    done: function (e, data) {
			    	jQuery.each(data.result.files, function (index, file) {
			    		
			        	if(file.error){
			        		alert(file.error);
			        	}else
			        	   jQuery(input).val(file.name);
			        });
			    },
			    progressall: function (e, data) {
			        var progress = parseInt(data.loaded / data.total * 100, 10);
			         $(msg).html('upload:'+progress + '%');
			    }
			}).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
		},
		removeMovie:function(obj){
			jQuery(obj).val("");
		}
};	
jQuery(function(){
	var url='/vkids/admin.php/Admin/List/uploadPic/model/<?php echo ($type); ?>list';
	tool.uploadMovie(url,"#fileupload_pic1",'#pic1',"#word_pic1");
	tool.uploadMovie(url,"#fileupload_pic2",'#pic2',"#word_pic2");
	tool.uploadMovie(url,"#fileupload_pic3",'#pic3',"#word_pic3");
	tool.uploadMovie(url,"#fileupload_pic4",'#pic4',"#word_pic4");
	commonAjaxSubmit('',"#myForm");
	commonAjaxSubmit('',"#editForm");
});
  function edit(id){
	  var url="/vkids/admin.php/Admin/List/getPhoto/type/<?php echo ($type); ?>/id/"+id;
	  $.get(url,function(data){
		  data=eval("("+data+")");
		  var id=data['id'];
		  var sid=data['sid'];
		  var title=data['title'];
		  var path="<?php echo SITE_PATH;?>/Uploads/"
		  var img=path+data['pic'];
		  jQuery("#id").val(id);
		  jQuery("#sid").val(sid);
		  jQuery("#title").val(title);
		  <?php if($type == 'studentphotos'): ?>jQuery("#name").val(data['name']);<?php endif; ?>
		  jQuery("#file").attr('src',img);
		  $('#myModal').modal('show')
	  });
  }
  function del(url){
	  if(url=='') return false;
      if(window.confirm('Are you sure to delete this record?')){	  
		  $.get(url,function(responseText){
			    var info=responseText['info'];
		        var status=responseText['status'];
		        var url=responseText['url'];
		        if(status==1){
		        //alert(info)
		        window.location.reload();
		        }
		  });
		  return true;
	  }
  }
</script>   
</body>
</html>