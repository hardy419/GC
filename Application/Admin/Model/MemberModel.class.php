<?php
namespace Admin\Model;
use Think\Model;
class MemberModel extends Model{ 	
  protected $_validate=array(
	 array('id','require','ID is required',1,'',2),
	 array('account','require','please input account'),
	 array('account','','Account already exists,please input another one',0,'unique',1),
  	 array('email','require','please input email'),
  	 array('email','','email already exists,please input another one',0,'unique',1),
	 array('password','require','please input password'),
	 array('repassword','password','Confirm password is incorrect',0,'confirm')
   );	
  protected $_auto=array(
  		array('password','md5',3,'function')
  );
}
?>