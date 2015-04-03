<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title>WebSite Admin</title>
<link href="/vkids/Public/Css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="/vkids/Public/Css/login.css" type="text/css" rel="stylesheet" />
</head>
<div class="container">
      <form class="form-horizontal form-signin" id="myform" method="post" action="/vkids/admin.php/Admin/Common/checkLogin">
         <legend><strong>Admin Login</strong></legend>
		<div class="control-group">
		<label class="control-label" >Account:</label>
		<div class="controls">
		
        <input type="text" id="account" name="account" class="input-block-level">
		</div>
		</div>
		<div class="control-group">
		<label class="control-label" >Password:</label>
		<div class="controls">
		 <input type="password" id="password" name="password"  class="input-block-level">
		</div>
		</div>
		<div class="control-group">
		<label class="control-label" >Verify:</label>
		<div class="controls">
		<input type="text" id="seccode" name="seccode"  class="input-block-level input-small"><span class="help-inline"><A HREF="javascript:Verify('#verifyImg6','/vkids/admin.php/Admin/Common/verify/')"><IMG SRC="/vkids/admin.php/Admin/Common/verify/" name="verifyImg" BORDER="0" align="absmiddle" id="verifyImg6" style="padding-bottom:14px;" title="如果您无法识别验证码，请点图片更换"></a>  </span>
		</div>
		</div>
		<div class="control-group">
		<div class="controls">
        <button type="submit" class="btn btn-large btn-primary btn-small">Login</button>
		</div>
		</div>
      </form>

    </div>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>
<script src="/vkids/Public/Js/jquery.form.js"></script>
<script>
jQuery(function(){
	jQuery("#account").focus();
	commonAjaxSubmit("","#myform");
});
function commonAjaxSubmit(url,formObj){
    if(!formObj||formObj==''){
        var formObj="form";
    }
    if(!url||url==''){
        var url=document.URL;
    }
    var options={
    	  beforeSubmit:showRequest,
  		  success:showResponse
  	 };
    jQuery(formObj).ajaxForm(options);
    return false;
}

function showRequest(formData,jqForm,options){
	return true;
}
function Verify(obj,path){
	//重载验证码
	var timenow = new Date().getTime();
	var url=path+timenow;
	jQuery(obj).attr('src',url);
  }
function showResponse(responseText,statusText,xhr,$form){
        var info=responseText['info'];
        var status=responseText['status'];
        var url=responseText['url'];
        if(status==1){
       // alert(info)
        window.location.href=url;
        } else{
        	Verify('#verifyImg6','/vkids/admin.php/Admin/Common/verify/');
        	alert(info);
        }
}  
</script>
</body>
</html>