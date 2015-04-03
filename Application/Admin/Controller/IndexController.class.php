<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends BaseController{
    public function index(){
    	$data=array();
    	$data['serverinfo']=PHP_OS.'/'.PHP_VERSION;
    	$magic=get_magic_quotes_gpc()?'On':'Off';
    	$data['magic_quote_gpc']=$magic;
    	$this->assign('main',$data);
       $this->display();
    }
}