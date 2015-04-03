<?php
namespace Admin\Controller;
use Think\Controller;
class CooperationController extends BaseController{
    public function index(){
    	$model=M('cooplist');
    
        cookie("__CURRENTURL__",__SELF__);
        $count=$model->where()->count();
        if ($count>0){
            
            $listRows=12;
             
            $p=new \Org\Util\Page($count,$listRows);
            $p->setConfig('prev', '«');
            $p->setConfig('next', '»');
            $p->setConfig('last', 'the last Page');
            $p->setConfig('first', 'the first Page');
            $p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
            $list=$model->limit($p->firstRow.",".$p->listRows)->select();
            $show=$p->show();
            $this->assign("show",$show);
            $this->assign('list',$list);
             
            $this->assign("listRows",$listRows);
            $fields=$model->getDbFields();
            $this->assign('fields',$fields);
        }
        $this->assign('list',$list);
        $this->display();
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
    public function save(){
        $name="cooplist";
        $jump=cookie("__CURRENTURL__");
        $db=D($name);
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
            }
            cookie('current',$id);
            if ($query)$this->success('Action Success',$jump);
            else $this->error('Action Failure',$jump);
        }
    }
        public function savep(){
        $name="coopphotoslist";
        $jump=cookie("__CURRENTURL__");
        $db=D($name);
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
            }
            cookie('current',$id);
            if ($query)$this->success('Action Success',$jump);
            else $this->error('Action Failure',$jump);
        }
    }
    public function clist(){
        $id=isset($_GET['id'])?I('get.id'):'';
        $list=M('cooplist')->where(array('id'=>$id))->order('id desc')->find();
        $this->assign('list',$list);
        $this->display();
    }
    public function photo(){
        $pid=I('get.pid');
        $jump=cookie("__CURRENTURL__");
        if(empty($pid)||!is_numeric($pid)){
            $this->error('invalid action',$jump);
        }
        $name="coopphotoslist";
        $this->_select($name,array('pid'=>$pid),'sid','desc');
        $this->assign('type',$type);
        cookie("__CURRENTURL__",__SELF__);
        $this->display();
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
    public function savePhotos(){
        $name="coopphotoslist";
        $jump=cookie("__CURRENTURL__");
        $db=D($name);
        
        $titles=I('post.title');
        $sids=I('post.sid');
        $pics=I('post.pic');
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
    public function uploadPic(){
        $module='coopphoto';
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
        
        $this->_thumb($filename,$filename,500,500);
    }
    protected function _thumb($file,$imgname,$width,$height){
        $image=new \Think\Image();
        if(!empty($file)){
            $image->open($file);
            $image->thumb($width, $height,1);
            $image->save($imgname);
        }
    }
    public function getPhoto(){
        $id=isset($_GET['id'])?I('get.id'):'';
        $name="coopphotoslist";
        if(!empty($id)){
            $list=M($name)->where(array('id'=>$id))->find();
            echo json_encode($list);
        }
    }
}