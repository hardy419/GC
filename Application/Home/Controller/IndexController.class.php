<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
        $bannerurls = M('banner')->where('sid >= 80001 AND sid < 90000')->getField('url',true);
        $this->assign('refurl', $bannerurls);
        $this->display();
    }
}