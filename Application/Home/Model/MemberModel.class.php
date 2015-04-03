<?php
namespace Home\Model;
use Think\Model;
class MemberModel extends Model{ 	
  protected $_validate=array(
	 array('account','require','please input account'),
	 array('account','','Account already exists,please input another one',0,'unique',1),
     array('email','require','please input email'),
  	 array('email','','email already exists,please input another one',0,'unique',1),
	 array('password','4,20','Password length between 4 and 20',0,'length'),
	 array('repassword','password','Confirm password is incorrect',0,'confirm')
   );
  protected $_auto=array(
  		array('password','md5',3,'function')
  );
}
?>