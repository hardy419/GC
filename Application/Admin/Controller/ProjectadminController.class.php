<?php
namespace Admin\Controller;
use Think\Controller;
class ProjectadminController extends BaseController{
    public function index(){
        $list=M('project')->where(array('cid'=>I('get.catagory')))->order('`id`' . 'desc')->select();
        $this->assign('list',$list);
        $this->display();
    }
    public function add(){
        $id=I('get.id');
        $name=D('project');
        $list=$name->where(array('id'=>$id))->find();
        $this->assign('list',$list);
        $this->display();
    }
    public function save(){
        $db=D('project');
        $id=isset($_POST['id'])?I('post.id'):'';
        if(!$db->create()){
            $this->error($db->getError());
        }else{
            if(!empty($id)){
                    $query=$db->save();
                }else{
                    $query=$db->add();
                    $db->where(array('id'=>$query));
                }
            }
        if ($query)$this->success('Action Success',U('index').'/catagory/'.I('post.cid'));
        else $this->error('Action Failure');
    }
    public function del(){
        $query=M('project')->where(array('id'=>I('get.id')))->delete();
        if ($query)$this->success('Delete Success');
        else $this->error('Delete Failure');
    }
}