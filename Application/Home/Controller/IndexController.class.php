<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
    	$banners=M('bannerlist')->where(array('type'=>'banner'))->order('sid desc,id desc')->select();
    	$newslist=M('newslist')->where(array('status'=>'1'))->order('sid desc,id desc')->limit('2')->select();
    	$student=M('studentphotoslist')->where(array('pid'=>'2'))->order('sid desc,id desc')->limit('4')->select();
    	$this->assign('student',$student);
    	$this->assign('banners',json_encode($banners));
    	$this->assign('newslist',$newslist);
        $this->display('index');
    }
}