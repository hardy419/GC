<?php
namespace Home\Controller;
use Think\Controller;
class CoursesController extends BaseController {
    public function index(){
        $id=I('get.id');

    	$list=M('courselist')->where(array('id'=>$id))->find();

    	$cate=M('courselist')->where(array('status'=>1))->select();

    	$courseinfo=M('courseinfo')->where(array('status'=>1,'cid'=>I('get.id')))->select();
    	$this->assign('courseinfo',$courseinfo);
    	$this->assign('cate',$cate);
    	$this->assign('list',$list);
    	$this->assign('id',$id);
        $this->display();
    }
}