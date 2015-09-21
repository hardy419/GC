<?php
namespace Home\Controller;
use Think\Controller;
class WhatwedoController extends BaseController {
    public function index(){
        $id=3;
        $lang=cookie('gc_lang');
        $list=M('page')->where(array('id'=>(2 == $lang)?$id+4:$id))->find();
        $refurl = M('banner')->where(array('sid'=>$id))->getField('url_'.$this->lang);
        $this->assign('list',$list);
        $this->assign('refurl',$refurl);

        $meta = array();
        $meta[] = array(
            'title' => 'Gccomhk.com - Public Relations Company, 公司網址, 公司網站, 公司廣告, 公關工作',
            'keywords' => 'Public Relations Company, 公司網址, 公司網站, 公司廣告, 公關工作',
            'description' => 'GC has a team of digital marketing veterans who knows the online world inside out and are capable communicator and innovators in the digital world.'
        );
        $this->assign('meta', $meta);
        $this->display('Pageview/index');
    }
}