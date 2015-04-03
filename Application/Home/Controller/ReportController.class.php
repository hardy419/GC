<?php
namespace Home\Controller;
use Think\Controller;
class ReportController extends BaseController{
	public function index(){
		$count=M('reportlist')->count();
		$listRows=10;
		$order='orders';
		$sort='desc';
		$p=new \Org\Util\Page($count,$listRows);
    	$p->setConfig('prev', '«');
    	$p->setConfig('next', '»');
    	$p->setConfig('last', 'the last Page');
    	$p->setConfig('first', 'the first Page');
    	$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    	$list=M('reportlist')->where(array('status'=>'1'))->order("`" . $order . "` " . $sort)->limit($p->firstRow.",".$p->listRows)->select();
    	$show=$p->show();
    	$this->assign("show",$show);
    	$this->assign('list',$list);
    	$this->display();
	}
}