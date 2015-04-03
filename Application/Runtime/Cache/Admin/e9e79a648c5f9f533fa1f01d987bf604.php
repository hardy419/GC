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
                    <form class="form-horizontal" id="myForm" method="post" action="<?php echo U('saves');?>" onsubmit="editor.sync();myForm.submit();" enctype="multipart/form-data">
				    <div class="control-group">
				    <label class="control-label">Title:</label>
				    <div class="controls">
				    <input type="text" id="title" name="title" check="Require" warning="Title cann't be empty" value="<?php echo ($list["title"]); ?>" >
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Age:</label>
				    <div class="controls">
				    <input type="text" id="age" name="age" check="Require" warning="Age cann't be empty" value="<?php echo ($list["age"]); ?>" >
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Fit:</label>
				    <div class="controls">
				    <input type="text" id="fit" name="fit" check="Require" warning="Fit cann't be empty" value="<?php echo ($list["fit"]); ?>" >
				    </div>
				    </div>

				    <div class="control-group">
				    <label class="control-label">Content:</label>
				    <div class="controls">
				     <textarea id="content" name="content" style="width:500px;height:300px;"><?php echo ($list["content"]); ?></textarea>
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Curriculum:</label>
				    <div class="controls">
				    <input type="text" id="time" name="time" value="<?php echo ($list["time"]); ?>" ><span id="word_pdf" class="help-inline"></span>
				    </div>
				    </div>
				    <div class=" control-group">
		                   <label class="control-label"></label>
		                   <div class="controls fileinput-button">
		                     <span class="fileinput-button"><span>Click Here To Upload</span><input id="fileupload_pdf" type="file" name="files" class="input" ></span>
		                     <span class=" iconshadow" ><i class="icon-remove" onClick="tool.removeMovie('#time')"></i></span>
		                     <span class="help-text"><span class="label label-important">Max Pdf Size:<?php echo C(ATTACHSIZE)/1024/1024;?>M</span></span>
		                   </div>
		                </div>
				    <div class="control-group">
				    <label class="control-label">Color:</label>
				    <div class="controls">
				    <input type="text" id="color" name="color" check="Require" warning="Color cann't be empty" value="<?php echo ($list["color"]); ?>" >
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Order:</label>
				    <div class="controls">
				    <input type="text" id="sid" name="sid" check="Require" warning="Order cann't be empty" value="<?php echo ($list["sid"]); ?>" >(Order from Big to Small)
				    </div>
				    </div>
				    <div class="control-group">
				    <label class="control-label">Status:</label>
				    <div class="controls">
				      <input type="radio" id="status1" name="status" value="1" <?php if($list['status'] != '0'): ?>checked="checked"<?php endif; ?> /><span class="help-inline">Yes</span> <input type="radio" id="status1" name="status" value="0"  <?php if($list['status'] == '0'): ?>checked="checked"<?php endif; ?>/><span class="help-inline">No</span>
				    </div>
				    </div>
				    <input type="hidden" id="cid" name="cid" value="<?php echo I('get.cid');?>" />
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
<script src="/vkids/Public/Js/jquery-ui.min.js"></script>
<script src="/vkids/Public/Js/jquery.fileupload.js"></script>
<script src="/vkids/Public/Js/common.js"></script>
<script>
KindEditor.ready(function(K) {
	editor1 = K.create('#content', {
					allowFileManager : true,
					urlType : 'domain'
	});
});
</script>
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
	var url='/vkids/admin.php/Admin/Course/uploadPdf';
	tool.uploadMovie(url,"#fileupload_pdf",'#time',"#word_pdf");
});
</script> 
<script type="text/javascript">
                function ColorPicker(k,j){var i=this,h=arguments.callee,l,b,c;if(!(this instanceof h))return i=new h(k,j);b=h.prototype;b.constructor=h;h.cache||(h.cache=[]);c={createColorData:function(){var a=h.cache,e,d,g,f=0,b,c=0;for(e=0;6>e;e++){a.push("<ul>");for(d=0;6>d;d++){a.push("<li>");for(g=0;6>g;g++)b=("000"+f.toString(16)).slice(-3).toUpperCase(),c++,i.color.push(b),a.push('<a index="'+c+'" style="background: #'+b+'" title="#'+b+'" javascript="void (0);"></a>'),f+=3;f+=30;a.push("</li>")}a.push("</ul>");
                        f+=480}"function"===typeof this.ongetcolorstring&&this.ongetcolorstring.call(this.color)},getHtmlElement:function(a){this.element||(this.element={});this.element[a]||(this.element[a]=l.createElement(a));return this.element[a].cloneNode(!0)},each:function(a,e){var d,b=0,f=a.length>>>0;if("Object"==={}.toString.call(a).slice(8,-1))for(d in a){if(!1===e.call(a[d],d,a[d]))break}else for(;b<f&&!1!==e.call(a,b,a[b++]););},getViewportSize:function(){var a=[0,0];void 0!==window.innerWidth?a=[window.innerWidth,
                        window.innerHeight]:a=[document.documentElement.clientWidth,document.documentElement.clientHeight];return a},getClinetRect:function(a){a=a.getBoundingClientRect();return a=a={left:a.left,right:a.right,top:a.top,bottom:a.bottom,height:a.height||a.bottom-a.top,width:a.width||a.right-a.left}},getScrollPosition:function(){var a=[0,0];window.pageYOffset?a=[window.pageXOffset,window.pageYOffset]:"undefined"!=typeof document.documentElement.scrollTop&&0<document.documentElement.scrollTop?a=[document.documentElement.scrollLeft,
                        document.documentElement.scrollTop]:"undefined"!=typeof document.body.scrollTop&&(a=[document.body.scrollLeft,document.body.scrollTop]);return a},addEvent:function(a,e,b,c){a.attachEvent&&function(a,b,e){a.attachEvent("on"+b,e)}.apply(this,arguments);a.addEventListener&&function(a,b,e){a.addEventListener(b,e,c||!1)}.apply(this,arguments);a["on"+e]&&function(a,b,e){a["on"+b]=function(){e()}}.apply(this,arguments)}};b.Init=function(){l=document;this.color=[];this.offset=k;this.offsetSize=c.getClinetRect(this.offset);
                        j||(this.prefix="colorPicker");j&&Object&&(c.each(j,function(a,b){i[a]||(i[a]=b)}),this.prefix=j.prefix?j.prefix+"-colorPicker":this.prefix);this.isInputText="input"===this.offset.nodeName.toLowerCase()&&"text"===this.offset.getAttribute("type");0==h.cache.length&&c.createColorData();this.createPacker().addEvent().render()};b.createPacker=function(){var a=[["div","id#"+this.prefix+",class#colorPicker"],["div","class#colorPicker-title"],["span","class#colorPicker-preview"],["input","type#button,class#colorPick-close,value#Close"],
                        ["div","class#colorPicker-container"]],b,d;c.each(a,function(g,f){b=c.getHtmlElement(f[0]);c.each(f[1].split(","),function(a,c){d=c.split("#");d[0]&&b.setAttribute(d[0],d[1])});a.splice(g,1,b)});this.elem=a;return this};b.addEvent=function(){c.addEvent(i.elem[4],"mouseover",function(a){i.eventContrl(a)},!1);c.addEvent(this.elem[4],"click",function(a){i.eventContrl(a)},!1);c.addEvent(this.elem[3],"click",function(){i.kill()},!1);return this};b.getColor=function(a){this.current&&this.current.constructor===
                                String&&(a.className=this.current);this.elem[2].innerHTML=this.fixColorValue(a.title);this.elem[2].style.background=a.title};b.eventContrl=function(a){var a=a||window.event,b=this.getCurrent(a);b&&("mouseover"==a.type?this.getColor(b):this.outputValue(b))};b.getCurrent=function(a){a=a||window.event;for(a=a.target||a.srcElement;a&&(3==a.nodeType||"a"!==a.nodeName.toLowerCase());)a=a.parentNode;return this.currentElem=a};b.fixColorValue=function(a){return!a?-1:a.replace(/(w)/g,function(){return RegExp.$1+
                                RegExp.$1})};b.outputValue=function(a){a=this.fixColorValue(a.title);this.kill();!0===this.isInputText&&(this.offset.value=a);"function"===typeof this.ongetvalue&&this.ongetvalue.call([a]);return this};b.render=function(){var a=this.elem;a[1].appendChild(a[2]);a[1].appendChild(a[3]);a[0].appendChild(a[1]);a[0].appendChild(a[4]);this.offset.parentNode.appendChild(a[0]);a[4].innerHTML=h.cache.join("");"function"===typeof this.onrendered&&this.onrendered.call(this);return this};b.checkPosition=function(a,b){var a=this.elem[0],d=c.getClinetRect(a),g=c.getViewportSize(),f=c.getScrollPosition();if(!(d.height>g[1]||d.width>g[0]))return 0<d.right-g[0]&&(a.style.left=b.right-d.width+"px"),0<d.bottom-g[1]&&(a.style.top=b.top-d.height+f[1]+"px"),this};b.kill=function(){this.elem[0].style.display="none";return this};b.display=function(){var a=c.getClinetRect(this.offset),b=this.elem[0];b.style.display="block";b.style.cssText="position:absolute;top:"+this.offsetSize.bottom+"px;left:"+this.offsetSize.left+"px; display:block;";this.checkPosition(b,a);return this};this.Init()};
</script> 
<script type="text/javascript">
!function(window,doc,undefined){
        window.ColorPicker = (ColorPicker);
        a = ColorPicker(doc.getElementById('color'), {prefix:'color', ongetvalue:function () {
                //console.log(this)
        }, bdf:'xdfdf'});
        doc.getElementById('color').onfocus = function () {
                a.display()
        }
}(this,document)
</script>
</body>
</html>