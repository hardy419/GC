<?php
namespace Admin\Controller;
use Think\Controller;
class BanneradminController extends BaseController{
    public function index(){
        $list=M('banner')->order('`sid`' . 'asc')->select();
        $this->assign('list',$list);
        $this->display();
    }
    public function add(){
        $id=I('get.id', -1);
        $name=M('banner');
        if (-1 == $id) {
            $list=$name->where(array('sid'=>I('get.sid')))->find();
            if (null === $list) {
                $list['sid'] = I('get.sid');
            }
        }
        else {
            $list=$name->where(array('id'=>$id))->find();
        }
        $this->assign('list',$list);
        $this->display();
    }
    public function save(){
        $db=M('banner');
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
        if ($query)$this->success('Action Success',U('Pageadmin/index'));
        else $this->error('Action Failure',$jump);
    }
    public function del(){
        $query=M('banner')->where(array('id'=>I('get.id')))->delete();
        if ($query)$this->success('Delete Success');
        else $this->error('Delete Failure');
    }
}