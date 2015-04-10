<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
        $this->display();
    }
    public function index2(){
        $refurl = M('banner')->where(array('sid'=>'90002'))->getField('url');
        $this->assign('refurl',$refurl);
        $this->display();
    }
    public function index3(){
        $refurl = M('banner')->where(array('sid'=>'90003'))->getField('url');
        $this->assign('refurl',$refurl);
        $this->display();
    }
    public function index4(){
        $refurl = M('banner')->where(array('sid'=>'90004'))->getField('url');
        $this->assign('refurl',$refurl);
        $this->display();
    }
    public function index5(){
        $refurl = M('banner')->where(array('sid'=>'90005'))->getField('url');
        $this->assign('refurl',$refurl);
        $this->display();
    }
}