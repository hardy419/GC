<?php
namespace Admin\Controller;
use Think\Controller;
class CourseController extends BaseController{
    public function index(){
    	$model=M('courselist');
         
        $sort='desc';
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

    public function clist(){
        $pid=I('get.id');
        $name=D('courselist');
        $list=$name->where(array('id'=>$pid))->find();
        
        
        $this->assign('list',$list);
        $this->display();
    }

    public function delNews(){
        $name="courselist";
        $id=isset($_GET['id'])?I('get.id'):'';
        if(empty($id))$this->error('Delete Failure',U('index'));
        $query=M($name)->where(array('id'=>$id))->delete();
        if ($query)$this->success('Delete Success',U('index'));
        else $this->error('Delete Failure',U('index'));
    }


    public function save(){
    	$db=D('courselist');    	
    	$id=isset($_POST['id'])?I('post.id'):'';
		if(!$db->create()){
		    $this->error($db->getError(),$jump);
		}else{
    		if(!empty($id)){
	    			$query=$db->save();
	    		}else{
	    			$query=$db->add();
	    			$db->where(array('id'=>$query));
	    		}
	    	}
    		if ($query)$this->success('Action Success',U('index'));
    		else $this->error('Action Failure',$jump);
    }
    public function saves(){
        $db=D('courseinfo');        
        $id=isset($_POST['id'])?I('post.id'):'';
        if(!$db->create()){
            $this->error($db->getError(),$jump);
        }else{
            if(!empty($id)){
                    $query=$db->save();
                }else{
                    $query=$db->add();
                    $db->where(array('id'=>$query));
                }
            }
            if ($query)$this->success('Action Success',U('index'));
            else $this->error('Action Failure',$jump);
    }

    public function course(){
        cookie("__CURRENTURL__",__SELF__);
        $cid=I('get.cid');
        $name=D('courseinfo');
        $list=$name->where(array('cid'=>$cid))->select();
        
        
        $this->assign('list',$list);
        $this->display();
    }

    public function delcourse(){
        $name="courseinfo";
        $id=isset($_GET['id'])?I('get.id'):'';
        if(empty($id))$this->error('Delete Failure',U('index'));
        $query=M($name)->where(array('id'=>$id))->delete();
        if ($query)$this->success('Delete Success',U('index'));
        else $this->error('Delete Failure',U('index'));
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
    public function control(){
        $id=I('get.id');
        $name="courseinfo";
        $list=M($name)->where(array('id'=>$id))->find();
        $this->assign('list',$list);
        $this->display();
    }
}