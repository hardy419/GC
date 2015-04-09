<?php
namespace Home\Controller;
use Think\Controller;
class PageviewController extends BaseController {
    public function index(){
        $id=I('get.id', 1);
        $list=D('idea')->where(array('id'=>$id))->find();
        $this->assign('list',$list);
        $this->display();
    }
}