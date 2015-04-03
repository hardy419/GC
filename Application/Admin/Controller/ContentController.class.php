<?php
namespace Admin\Controller;
use Think\Controller;
class ContentController extends BaseController{
    public function index(){
    	$type=isset($_GET['type'])?I('get.type'):I('post.type');
    	$this->assign('type',$type);
    	
    	if(IS_POST){
    		$id=I('post.id');
    		$jump=cookie("__CURRENTURL__");
    		$db=M('Content');
    		if(!$db->create()){
    			$this->error($db->getError(),$url);
    		}else{
    			
    			if(!empty($_FILES['pic']['name'])){
	    			$upload = new \Think\Upload();// 实例化上传类
	    			$upload->maxSize   =3145728 ;// 设置附件上传大小
	    			$upload->exts      =array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
	    			$upload->savePath  ='content/'; // 设置附件上传目录// 上传文件
	    			$upload->autoSub=false;
	    			$upload->subName= array('date','Ymd');
	    			$upload->saveName=array('uniqid','');
	    			$info   =$upload->upload();
	    			if(!$info) {// 上传错误提示错误信息
	    				$this->error($upload->getError());
	    			}else{// 上传成功 获取上传文件信息
	    				$db->pic=C('ATTACHPATH').'/'.$info['pic']['savepath'].$info['pic']['savename'];
	    			}
    			}
    			
    			if(!empty($id)){
    				$query=$db->save();
    			}else{
    				$query=$db->add();
    			}
    		}
    		
    		$this->redirect('index',array('type'=>$type));
    	}else{
    		$this->_control('content',$type);
    		cookie("__CURRENTURL__",__SELF__);
    		$this->display();
    	}
    	
    }
    protected  function _control($name,$type){
    	$list=M($name)->where(array('type'=>$type))->find();
    	
    	$this->assign('list',$list);
    }  
}