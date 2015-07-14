<?php
namespace Home\Controller;
use Think\Controller;
class WhoweareController extends BaseController {
    public function index(){
        $id=4;
        $lang=cookie('gc_lang');
        $list=M('page')->where(array('id'=>(2 == $lang)?$id+4:$id))->find();
        $refurl = M('banner')->where(array('sid'=>$id))->getField('url');
        $this->assign('list',$list);
        $this->assign('refurl',$refurl);

        $meta = array();
        $meta[] = array(
            'title' => 'Gccomhk.com - 香港公關公司, 公關廣告, 公關顧問公司, 香港公關, 公關公司香港, 公關公司',
            'keywords' => '香港公關公司, 公關廣告, 公關顧問公司, 香港公關, 公關公司香港, 公關公司',
            'description' => 'Our scope of service include corporate communication, event planning, media relations and social media marketing etc.'
        );
        $this->assign('meta', $meta);
        $this->display('Pageview/index');
    }
}