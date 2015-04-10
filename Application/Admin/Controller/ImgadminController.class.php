<?php
namespace Admin\Controller;
use Think\Controller;
class ImgadminController extends BaseController{
    private $sitePath = SITE_PATH;
    private $uploadDir = 'Public/Img/GC/banners';
    public function index(){
        $list = array();
        if ($dir = opendir('./'.$this->uploadDir)) {
            while (($file = readdir($dir)) !== false)
            {
                if (!is_dir("./{$this->uploadDir}/{$file}") && $file!='.' && $file!='..') {
                    $list[] = array('url'=>"{$this->sitePath}{$this->uploadDir}/{$file}",'refurl'=>"{$this->uploadDir}/{$file}",'filename'=>$file);
                }
            }
            closedir($dir);
        }
        $this->assign('list',$list);
        $this->display();
    }

    public function saveImage(){
        if(!move_uploaded_file($_FILES['image_file']['tmp_name'],'./'.$this->uploadDir.'/'.$_FILES['image_file']['name'])){ 
            $this->error('Action Failure');
        }
        $this->success('Action Success');
    }

    public function delImage() {
        if (unlink('./'.$this->uploadDir.'/'.I('get.filename')))$this->success('Delete Success');
        else $this->error('Delete Failure');
    }
}