<?php
namespace Home\Controller;
use Think\Controller;
class NewsController extends BaseController {
    public function index(){
    	$count=M('newslist')->count();
		$listRows=3;
		$order='orders';
		$sort='desc';
		$p=new \Org\Util\Page($count,$listRows);
    	$p->setConfig('prev', '«');
    	$p->setConfig('next', '»');
    	$p->setConfig('last', 'the last Page');
    	$p->setConfig('first', 'the first Page');
    	$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    	$list=M('newslist')->where(array('status'=>'1'))->order('sid desc,id desc')->limit($p->firstRow.",".$p->listRows)->select();
    	$show=$p->show();
    	$this->assign("show",$show);
    	$this->assign('newslist',$list);
    	$this->display();
    }
    public function detail(){        
        $list=M('newslist')->where(array('status'=>'1','id'=>I('get.id')))->find();
        $photos=M('newsphotoslist ')->where(array('pid'=>I('get.id')))->select();
        $this->assign('list',$list);
        $this->assign('photos',$photos);
        $this->display();
    }
}