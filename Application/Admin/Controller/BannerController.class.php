<?php
namespace Admin\Controller;
use Think\Controller;
class BannerController extends BaseController{
    public function index(){
    	$type=I('get.type');
    	$name="bannerlist";
    	$map=array();
    	$map['type']=$type;
        $this->_select($name,$map);
        $this->assign('type',$type);
        cookie("__CURRENTURL__",__SELF__);
        $current=cookie('current');
        cookie('current',null);
        $this->assign('current',$current);
    	$this->display();
    }
    public function control(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$type=I('get.type');
    	$this->assign('type',$type);
    	$name="bannerlist";
    	if(!empty($id)){
    		$this->_control($name,$id);	
    		$this->display();
    	}else{
    		$this->display();
    	}
    }
    protected  function _control($name,$id){
    	$list=M($name)->where(array('id'=>$id))->find();
    	$this->assign('list',$list);
    }
    private function changePic($db,$key,$file,$f){
    	$file='./Uploads'.$file;
    	
    	switch ($key){
    		case 'pic':
    			$path=$f['savepath'];
    			$basename=$f['savename'];
    			$pic=$path.'b_'.$basename;
    			if($type=='banner'){
    				$this->_thumb($file,'./Uploads'.$pic,1920,844);
    				$db->pic=$pic;
    			}else{
    				$this->_thumb($file,'./Uploads'.$pic,472,360);
    				$db->pic=$pic;
    			}
    			break;
    		case 'tag':
    			$path=$f['savepath'];
    			$basename=$f['savename'];
    			$pic=$path.'s_'.$basename;
    			$this->_thumb($file,'./Uploads'.$pic,218,17);
    			@unlink($file);
    			$db->tag=$pic;
    		break;
    	}
    }
    protected function _thumb($file,$imgname,$width,$height){
    	$image=new \Think\Image();
    	if(!empty($file)){
    		$image->open($file);
    		$image->thumb($width, $height,3);
    		$image->save($imgname);
    	}
    }
    public function save(){
    	$type=I('post.type');
    	$name="bannerlist";
    	$jump=cookie("__CURRENTURL__");
    	$db=D($name);

    	unset($_POST['tag']);
    	unset($_POST['pic']);
    	 
    	if(!$db->create()){
    		$this->error($db->getError());
    	}else{
	    	foreach($_FILES as $key=>$file) {
	   			if(empty($file['name'])) unset($_FILES[$key]);
	   		}
	   		
	   		if(count($_FILES)>0){
	   			$path=date("Ymd");
	   			$files=$this->_upload($name,$path);
	   				//过滤无效的上传
	   			foreach($files as $k=>$f){

	   				   if(!empty($f['name'])) {
	   				   	        $key=$f['key'];
	   						    $filename=$f['savepath'].$f['savename'];
	   							$this->changePic($db,$key,$filename,$f);
	   					}

	   				}
	   		}
    		$id=isset($_POST['id'])?I('post.id'):'';
    		if(!empty($id)){
    			
    			$query=$db->save();
    		}else{
    			$query=$db->add();
    			M('bannerlist')->where(array('id'=>$query))->setField('sid',$query);
    		}
    		cookie('current',$id);
    		if ($query){
    			$this->success('Action Success',$jump);
    		}else{
    			$this->error('Action Failure',$jump);
    		}
    	}
    }
   
    public function _select($name,$map=array(),$order='sid',$sort='desc',$asc=false){
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
    	$type=I('get.type');
    	$this->assign('type',$type);
    	$name="bannerlist";
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id))$this->error('Delete Failure',$jump);
    	
    	$query=M($name)->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
}