<?php
namespace Home\Controller;
use Think\Controller;
class IdeaController extends BaseController {
    public function index(){
    	$list=D('idea')->where(array('id'=>1))->find();
    	
        $this->assign('list',$list);
        $this->display();
    }
}