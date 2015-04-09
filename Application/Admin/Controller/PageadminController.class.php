<?php
namespace Admin\Controller;
use Think\Controller;
class PageadminController extends BaseController{
    public function index(){
        $list=M('idea')->order('`id`' . 'desc')->select();
        $this->assign('list',$list);
        $current=cookie('current');
        cookie('current',null);
        $this->assign('current',$current);
        cookie("__CURRENTURL__",__SELF__);
        $this->display();
    }
    public function add(){
        $id=I('get.id');
        $name=D('idea');
        $list=$name->where(array('id'=>$id))->find();
        
        
        $this->assign('list',$list);
        $this->display();
    }
    public function save(){
        $db=D('idea');
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