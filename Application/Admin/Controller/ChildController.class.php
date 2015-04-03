<?php
namespace Admin\Controller;
use Think\Controller;
class ChildController extends BaseController{
	public function index(){
		$count=M('childlist')->count();
		$listRows=12;
		$order='orders';
		$sort='desc';
		$p=new \Org\Util\Page($count,$listRows);
    	$p->setConfig('prev', '«');
    	$p->setConfig('next', '»');
    	$p->setConfig('last', 'the last Page');
    	$p->setConfig('first', 'the first Page');
    	$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    	$list=M('childlist')->order("`" . $order . "` " . $sort)->limit($p->firstRow.",".$p->listRows)->select();
    	$show=$p->show();
        cookie("__CURRENTURL__",__SELF__);
    	$this->assign("show",$show);
    	$this->assign('list',$list);
    	$this->display();
	}
    public function control(){
        $id=isset($_GET['id'])?I('get.id'):'';
        $list=M('childlist')->where(array('id'=>$id))->order('id desc')->find();
        $this->assign('list',$list);
        $this->display('control');
    }
    public function save(){
        $name="childlist";
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
}