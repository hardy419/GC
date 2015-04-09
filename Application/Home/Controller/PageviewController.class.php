<?php
namespace Home\Controller;
use Think\Controller;
class PageviewController extends BaseController {
    public function index(){
        $id=I('get.id', 1);
        $list=M('idea')->where(array('id'=>$id))->find();
        $refurl = M('bannerlist')->where(array('sid'=>$id))->getField('url');
        $this->assign('list',$list);
        $this->assign('refurl',$refurl);
        $this->display();
    }
}