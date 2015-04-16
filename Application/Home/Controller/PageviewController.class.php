<?php
namespace Home\Controller;
use Think\Controller;
class PageviewController extends BaseController {
    public function index(){
        $id=I('get.id', 1);
        $lang=cookie('gc_lang');
        $list=M('page')->where(array('id'=>(2 == $lang)?$id+4:$id))->find();
        $refurl = M('banner')->where(array('sid'=>$id))->getField('url');
        $this->assign('list',$list);
        $this->assign('refurl',$refurl);
        $this->display();
    }
}