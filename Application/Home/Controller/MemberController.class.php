<?php 
namespace Home\Controller;
use Think\Controller;
class MemberController extends BaseController{
	public function __construct(){
		parent::__construct();
		if(!$this->checkStatus()){
			$loginMarked=md5(C('AUTH_Home_TOKEN'));
			if(isset($_SESSION[$loginMarked])){
				unset($_SESSION[$loginMarked]);
			}
			$this->redirect('Common/login');
		}
	}
	private  function checkStatus(){
		$loginMarked=md5(C('AUTH_Home_TOKEN'));
	
		if(!$_SESSION[$loginMarked]){
			return false;
		}
		$cookie=explode("_",cookie($loginMarked));
		$outtime=C('LOGIN_Home_TIMEOUT');
	
		if(intval(time())>($outtime+end($cookie)))return false;
		if($cookie[0]!=$loginMarked)return false;
		cookie($loginMarked,$cookie[0].'_'.time(),0,'/');
		return true;
	}
     public function index(){
     	$loginMarked=md5(C('AUTH_Home_TOKEN'));
     	$uid=$_SESSION[$loginMarked];
     	$cid=I('get.cid');
     	if(empty($uid))$this->error('Please LoginIn',U('Common/Login'));
     	$member=M('member')->where(array('id'=>$uid))->find();
     	$courses=$member['courses'];
     	
     	if(!empty($courses)){
     	$category=M('programmeslist')->field('id,etitle,title')->where(array('id'=>array('in',$courses)))->order('sid desc,id desc')->select();
     	
     	  if(empty($cid)){
     	  	$cid=$category[0]['id'];
     	  }
     	  $count=M('documentlist')->where(array('pid'=>$cid))->count();
     	  $p=new \Org\Util\Page($count,10);
     	  $p->setConfig('prev', '«');
     	  $p->setConfig('next', '»');
     	  $p->setConfig('last', 'the last Page');
     	  $p->setConfig('first', 'the first Page');
     	  $p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
     	  $list=M('documentlist')->where(array('pid'=>$cid))->order('sid desc,id desc')->limit($p->firstRow.",".$p->listRows)->select();
     	  $show=$p->show();
     	  $this->assign('cid',$cid);
     	  $this->assign('category',$category);
     	  $this->assign("show",$show);
     	  $this->assign('list',$list);
     	}
     	$this->display();
     }	
}
?>