<?php
namespace Home\Controller;
use Think\Controller;
class ChildController extends BaseController{
	public function index(){
		$count=M('childlist')->count();
		$listRows=8;
		$order='orders';
		$sort='desc';
		$p=new \Org\Util\Page($count,$listRows);
    	$p->setConfig('prev', '«');
    	$p->setConfig('next', '»');
    	$p->setConfig('last', 'the last Page');
    	$p->setConfig('first', 'the first Page');
    	$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    	$list=M('childlist')->where(array('status'=>'1'))->order("`" . $order . "` " . $sort)->limit($p->firstRow.",".$p->listRows)->select();
    	$show=$p->show();
    	$this->assign("show",$show);
    	$this->assign('list',$list);
    	$this->display();
	}
}