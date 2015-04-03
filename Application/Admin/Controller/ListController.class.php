<?php
namespace Admin\Controller;
use Think\Controller;
class ListController extends BaseController{
    public function index(){
    	$type=I('get.type');
    	$pid=I('get.pid');
    	if(!in_array($type,array('news','programmes','tutors','case','student','document','coursescode'))) $this->error('',U('Index/index'));
    	$name=$type."list";
    	$map=array();
    	if($type=='news'){
    		$category=M('newscategorylist')->order('sid desc,id desc')->select();
    		$this->assign('category',$category);
    		
    	}
    	if(!empty($pid)&&is_numeric($pid)){
    		$map['pid']=$pid;
    	}else{
    		$pid=0;
    	}
    	
    	
        $this->_select($name,$map,'sid','desc');
        $this->assign('type',$type);
        $this->assign('pid',$pid);
        $current=cookie('current');
        cookie('current',null);
        $this->assign('current',$current);
        cookie("__CURRENTURL__",__SELF__);
        if($type=='news'){
        $this->display('news');
        }else
    	$this->display();
    }
    public function category(){
    	$type=I('get.type');
    	if(!in_array($type,array('newscategory','industry','forget'))) $this->error('',U('Index/index'));
    	$name=$type."list";
    	$this->_select($name);
    	$this->assign('type',$type);
    	cookie("__CURRENTURL__",__SELF__);
    	$current=cookie('current');
    	cookie('current',null);
    	$this->assign('current',$current);
    	$this->display();
    }
    public function photos(){
    	$type=I('get.type');
    	$pid=I('get.pid');
    	$jump=cookie("__CURRENTURL__");
    	if(empty($pid)||!is_numeric($pid)){
    		$this->error('invalid action',$jump);
    	}
    	if(!in_array($type,array('newsphotos','tutorsphotos','casephotos','studentphotos'))) $this->error('',U('Index/index'));
    	$name=$type."list";
    	$this->_select($name,array('pid'=>$pid),'sid','desc');
    	$this->assign('type',$type);
    	cookie("__CURRENTURL__",__SELF__);
    	$this->display();
    }
    public function control(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$pid=isset($_GET['pid'])?I('get.pid'):0;
    	$this->assign('pid',$pid);
    	$type=I('get.type');
    	if(!in_array($type,array('news','programmes','tutors','case','student','newscategory','document','coursescode')))$this->error('',U('Index/index'));
    	$this->assign('type',$type);
    	$name=$type."list";
    	if($type=='news'){
    		$select=M('newscategorylist')->order('id desc,sid desc')->select();
    		$this->assign('select',$select);
    	}
    	if(!empty($id)){
    		$this->_control($name,$id);	
    		$this->display('control'.$type);
    	}else{
    		$this->display('control'.$type);
    	}
    }
    public function getPhoto(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$type=I('get.type');
    	$this->assign('type',$type);
    	$name=$type."list";
    	if(!empty($id)){
    		$list=M($name)->where(array('id'=>$id))->find();
    		echo json_encode($list);
    	}
    }
    protected  function _control($name,$id){
    	$list=M($name)->where(array('id'=>$id))->find();
    	$this->assign('list',$list);
    }
    public function save(){
    	$type=I('post.type');
    	if(!in_array($type,array('news','newsphotos','tutorsphotos','casephotos','programmes','tutors','case','student','studentphotos','newscategory','document','coursescode')))$this->error('',U('Index/index'));
    	$name=$type."list";
    	$jump=cookie("__CURRENTURL__");
    	$db=D($name);
    	unset($_POST['pic']);
    	if(!$db->create()){
    		$this->error($db->getError(),$jump);
    	}else{
    		$id=isset($_POST['id'])?I('post.id'):'';
    		foreach($_FILES as $key=>$file) {
    			if(empty($file['name'])) unset($_FILES[$key]);
    		}
    		if(count($_FILES)>0){
    			$path=date("Ymd");
    			$files=$this->_upload($name,$path);
    			$pid=I('post.pid');
    		    foreach($_FILES as $key=>$file) {
    				//过滤无效的上传
    				if(!empty($file['name'])) {
    					foreach($files as $k=>$f){
    						$filename=$f['savepath'].$f['savename'];
    						$typename=$f['key'];
    						if($typename=='pic')$this->changePic($db, $name, $f,$filename,$path);
    						$db->$typename=$f['savepath'].$f['savename'];
    					}
    				}
    		
    			}
    		}
    		$fields=$db->getDbFields();
    		$date=I('post.date');
    		if(in_array('date',$fields)){
	    		if(empty($date))$db->date=time();
	    		else $db->date=strtotime($date);
    		}
    		if(!empty($id)){
    			$query=$db->save();
    		}else{
    			$query=$db->add();
    			$db->where(array('id'=>$query))->setField('sid',$query);
    		}
    		cookie('current',$id);
    		if ($query)$this->success('Action Success',$jump);
    		else $this->error('Action Failure',$jump);
    	}
    }
    public function savePhotos(){
    	$type=I('post.type');
    	$name=$type."list";
    	$jump=cookie("__CURRENTURL__");
    	$db=D($name);
    	
    	$titles=I('post.title');
    	$sids=I('post.sid');
    	$pics=I('post.pic');
    	if($type=='studentphotos'){
    		$names=I('post.name');
    	}
    	if(!$db->create()){
    		$this->error($db->getError());
    	}else{
    	   if(count($pics)){
	    		foreach ($pics as $k=>$v){
		    		if(!empty($v)){
		    		 $pid=I('post.pid');
		    		 $db->title=$titles[$k];
		    		 $db->pic=str_replace('./Uploads','',$v);
		    		 
		    		 $db->pid=$pid;
		    		 $db->sid=$sids[$k];
		    		 if($type=='studentphotos'){
		    			$db->name=$names[$k];
		    		 }
		    		$query=$db->add();
		    		$db->where(array('id'=>$query))->setField('sid',$query);
		    		}
	    		}
    	   }else{
    	   	  $query=$db->add();
    	   }	
    		$this->success('Action Success',$jump);
    	}
    }
   private function changePic($DB,$model,$f,$file,$path){
    	$file='./Uploads'.$file;
    	switch ($model){
    		case 'courselist':
    			$path=$f['savepath'];
    			$basename=$f['savename'];
    			$spic=$path.'s_'.$basename;
    			$this->_thumb($file,$file,656,367);
    			$this->_thumb($file,$spic,210,123);
    			$DB->spic=$spic;
    			break;
            case 'tutorslist':
                $this->_thumb($file,$file,80,100);
            break;
            case 'news':
                $this->_thumb($file,$file,153,96);
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
    protected function _thumb1($file,$imgname,$width,$height){
        $image=new \Think\Image();
        if(!empty($file)){
            $image->open($file);
            $image->thumb($width, $height,1);
            $image->save($imgname);
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
    			$listRows=!empty($pageNum)?$pageNum:12;
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
    public function uploadPic(){
    	$module=I('get.model');
    	$path=date("Ymd");
    	$path=C(ATTACHPATH).'/'.$module.'/'.$path.'/';
    	if (!is_dir($path)) mkdir($path,0755,true);
    	import('Org.Util.UploadFile');
    	$upload = new \UploadFile();
    	$upload->maxSize=C(ATTACHSIZE);
    	$upload->allowExts=explode(',',C(ATTACHEXT));
    	$upload->savePath=$path;
    	$upload->saveRule='uniqid';
    	$data=array();
    	$info=$data['result'];
    	if(!$upload->upload()){
    		$info['files'][0]['name']='';
    		$info['files'][0]['error']=$upload->getErrorMsg();
    		$json=json_encode($info);
    		echo $json;
    	}else{
    		$file=$upload->getUploadFileInfo();
    		$filename=$file[0]['savepath'].$file[0]['savename'];
    		$info['files'][0]['name']=$filename;
    		$this->switchPic($module, $filename);
    		$json=json_encode($info);
    		echo  $json;
    	}
    }
    private function switchPic($module,$filename){
    	$pid=I('get.pid');
    	switch ($module){
    		case 'newsphotoslist':
    		$this->_thumb1($filename,$filename,467,350);
    		break;
    		case 'tutorsphotoslist':
    			$this->_thumb($filename,$filename,460,344);
    		break;
    		case 'studentphotoslist':
    			if($pid==3)
                    {
                        $this->_thumb($filename,$filename,467,350);
                    }else
                    {
                        $this->_thumb1($filename,$filename,1000,1200);
                    }
    		break;
    	}
    }
    public function uploadPdf(){
    	$module="document";
    	$path=date("Ymd");
    	$path=C(ATTACHPATH).'/'.$module.'/';
    	if (!is_dir($path)) mkdir($path,0755,true);
    	import('Org.Util.UploadFile');
    	$upload = new \UploadFile();
    	$upload->maxSize=C(ATTACHSIZE);
    	$upload->allowExts=explode(',',C(ATTACHEXT));
    	$upload->savePath=$path;
    	$upload->saveRule='uniqid';
    	$data=array();
    	$info=$data['result'];
    	if(!$upload->upload()){
    		$info['files'][0]['name']='';
    		$info['files'][0]['error']=$upload->getErrorMsg();
    		$json=json_encode($info);
    		echo $json;
    	}else{
    		$file=$upload->getUploadFileInfo();
    		$info['files'][0]['name']=$file[0]['savepath'].$file[0]['savename'];
    		$json=json_encode($info);
    		echo  $json;
    	}
    }
    public function delCategory(){
    	$type=I('get.type');
    	if(!in_array($type,array('newscategory')))$this->error('',U('Index/index'));
    	$this->assign('type',$type);
    	$name=$type."list";
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id))$this->error('Delete Failure',$jump);
    	$count=M('newslist')->where(array('tid'=>$id))->count();
    	if($count>0)$this->error("Delete Failure,Please delete this category's news item",$jump);
    	$query=M($name)->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
    public function delNews(){
    	$type=I('get.type');
    	if(!in_array($type,array('news')))$this->error('',U('Index/index'));
    	$this->assign('type',$type);
    	$name=$type."list";
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id))$this->error('Delete Failure',$jump);
    	$query=M($name)->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
    public function checkChild($type,$id,$jump){
    	switch ($type){
    		case 'programmes':
    			$count=M('documentlist')->where(array('pid'=>$id))->count();
    			if($count>0)$this->error("Delete Failure,Please delete this Programmes's document",$jump);
    		break;
    		case 'tutors':
    			$count=M('tutorsphotoslist')->where(array('pid'=>$id))->count();
    			if($count>0)$this->error("Delete Failure,Please delete this Tutors's photos",$jump);
    		break;
    	}
    }
    public function del(){
    	$type=I('get.type');
    	if(!in_array($type,array('news','newsphotos','tutorsphotos','casephotos','programmes','tutors','case','student','studentphotos','newscategory','document','coursescode')))$this->error('',U('Index/index'));
    	$this->assign('type',$type);
    	$name=$type."list";
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id))$this->error('Delete Failure',$jump);
    	
        $this->checkChild($type,$id,$jump);
    	$query=M($name)->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
}