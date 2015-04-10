<?php
namespace Admin\Controller;
use Think\Controller;
class PageadminController extends BaseController{
    public function index(){
        $list=M('page')->order('`id`' . 'desc')->select();
        $this->assign('list',$list);
        $current=cookie('current');
        cookie('current',null);
        $this->assign('current',$current);
        cookie("__CURRENTURL__",__SELF__);
        $this->display();
    }
    public function add(){
        $id=I('get.id');
        $name=D('page');
        $list=$name->where(array('id'=>$id))->find();
        
        
        $this->assign('list',$list);
        $this->display();
    }
    public function save(){
        $db=D('page');
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
    public function del(){
        $query=M('page')->where(array('id'=>I('get.id')))->delete();
        if ($query)$this->success('Delete Success');
        else $this->error('Delete Failure');
    }
}