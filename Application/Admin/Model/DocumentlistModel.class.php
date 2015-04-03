<?php
namespace Admin\Model;
use Think\Model;
class DocumentlistModel extends Model{ 	
  protected $_auto = array (
  		array('created','strtotime',3,'function')
  );
}
?>