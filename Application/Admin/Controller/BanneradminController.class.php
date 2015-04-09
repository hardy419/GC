<?php
namespace Admin\Controller;
use Think\Controller;
class BanneradminController extends BaseController{
    public function index(){
        $list=M('bannerlist')->order('`sid`' . 'asc')->select();
        $this->assign('list',$list);
        $this->display();
    }
    public function add(){
        $id=I('get.id');
        $name=M('bannerlist');
        $list=$name->where(array('id'=>$id))->find();
        
        
        $this->assign('list',$list);
        $this->display();
    }
    public function save(){
        $db=M('bannerlist');
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
}