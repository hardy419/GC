<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends BaseController{
    public function index(){
        $this->_select('user');
        cookie("__CURRENTURL__",__SELF__);
    	$this->display();
    }
    public function control(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$tpl=isset($_GET['tpl'])?I('get.tpl'):'';
    	if(!empty($id)){
    		$this->_control('user',$id);
    		if($tpl=='pwd')$this->display('controlPwd');
    		else	
    		$this->display('controlInfo');
    	}else{
    		$this->display();
    	}
    }
    protected  function _control($name,$id){
    	$list=M($name)->where(array('id'=>$id))->find();
    	$this->assign('list',$list);
    }
    public function save(){
    	$jump=cookie("__CURRENTURL__");
    	$db=D('user');
    	if(!$db->create()){
    		$this->error($db->getError());
    	}else{
    		$id=isset($_POST['id'])?I('post.id'):'';
    		if(!empty($_POST['password']))$db->password=md5($_POST['password']);
    		if(!empty($id)){
    			$query=$db->save();
    		}else{
    			$query=$db->add();
    		}
    		if ($query)$this->success('Action Success',$jump);
    		else $this->error('Action Failure',$jump);
    	}
    }
       
    public function _select($name,$map=array(),$order='',$sort='',$asc=false){
    	$model=D($name);
    	 
    	if(isset($_REQUEST['_order'])){
    		$order=$_REQUEST['_order'];
    	}else{
    		$order=!empty($order)?$order:$model->getPK();
    	}
    
    	if(isset($_REQUEST['_sort'])){
    		$sort=$_REQUEST['_sort']?'asc':'desc';
    	}else{
    		$sort=!empty($asc)?'asc':'desc';
    	}
    
    	$count=$model->where($map)->count();
    	 
    	if ($count>0){
    		if(!empty($_REQUEST['listRows'])){
    			$listRows=$_REQUEST['listRows'];
    			cookie($name."_listRows",$listRows,3600);
    		}elseif(cookie($name."_listRows")){
    			$listRows=cookie($name."_listRows");
    		}else{
    			$pageNum=C("PAGENUM");
    			$listRows=!empty($pageNum)?$pageNum:15;
    		}
    		 
    		$p=new \Org\Util\Page($count,$listRows);
    		$p->setConfig('prev', '«');
    		$p->setConfig('next', '»');
    		$p->setConfig('last', 'the last Page');
    		$p->setConfig('first', 'the first Page');
    		$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    		$list=$model->where($map)->order("`" . $order . "` " . $sort)->limit($p->firstRow.",".$p->listRows)->select();
    		$show=$p->show();
    		$this->assign("show",$show);
    		$this->assign('list',$list);
    		 
    		$this->assign("listRows",$listRows);
    		$fields=$model->getDbFields();
    		$this->assign('fields',$fields);
    		cookie("__CURRENTURL__",__SELF__);
    	}
    }
    public function del(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id)||$id==1)$this->error('Delete Failure',$jump);
    	
    	$query=M('user')->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
}