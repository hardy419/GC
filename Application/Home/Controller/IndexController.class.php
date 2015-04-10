<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
        $bannerlist = M('banner')->where(array('sid'=>array('in',array('80001','80002','80003','80004','80005'))))->field('url')->select();
        $this->assign('refurl1', $bannerlist[0]['url']);
        $this->assign('refurl2', $bannerlist[1]['url']);
        $this->assign('refurl3', $bannerlist[2]['url']);
        $this->assign('refurl4', $bannerlist[3]['url']);
        $this->assign('refurl5', $bannerlist[4]['url']);
        $this->display();
    }
}