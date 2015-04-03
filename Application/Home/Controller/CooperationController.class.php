<?php
namespace Home\Controller;
use Think\Controller;
class CooperationController extends BaseController {
    public function index(){
    	
    	$count=M('cooplist')->count();
		$listRows=8;
		$order='orders';
		$sort='desc';
		$p=new \Org\Util\Page($count,$listRows);
    	$p->setConfig('prev', '«');
    	$p->setConfig('next', '»');
    	$p->setConfig('last', 'the last Page');
    	$p->setConfig('first', 'the first Page');
    	$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    	$list=M('cooplist')->where(array('status'=>'1'))->limit($p->firstRow.",".$p->listRows)->select();
    	$show=$p->show();
    	$this->assign("show",$show);
    	$this->assign('list',$list);
    	$this->display();
    }
    public function detail(){        
        $list=M('cooplist')->where(array('status'=>'1','id'=>I('get.id')))->find();
        $photos=M('coopphotoslist ')->where(array('pid'=>I('get.id')))->select();
        $this->assign('list',$list);
        $this->assign('photos',$photos);
        $this->display();
    }
}