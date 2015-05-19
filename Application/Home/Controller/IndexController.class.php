<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
        $bannerurls = M('banner')->where('sid >= 80001 AND sid < 90000')->getField('url',true);
        $this->assign('refurl', $bannerurls);
        $service = M('project')->query('SELECT p.id AS pid, p.title, p.description, p.preview, c.name AS category FROM gc_project p LEFT JOIN gc_catagory c ON p.cid=c.id');
        $this->assign('service', $service);
        $this->display();
    }
}