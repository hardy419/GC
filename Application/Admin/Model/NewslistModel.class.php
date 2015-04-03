<?php
namespace Admin\Model;
use Think\Model;
class NewslistModel extends Model{ 	
  protected $_auto = array (
  		array('created','strtotime',3,'function')
  );
}
?>