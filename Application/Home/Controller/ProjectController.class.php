<?php
namespace Home\Controller;
use Think\Controller;
class ProjectController extends BaseController {
    public function index(){
        $cid = I('get.cid', 1);
        $catamodel = M('catagory');
        $catalist = $catamodel->field('id,name')->select();
        $projmodel = M('project');
        $projmodelmap = array('cid'=>$cid);
        $count = $projmodel->where($projmodelmap)->count();
        $p=new \Org\Util\Page($count,6);
        $p->setConfig('prev', '«');
        $p->setConfig('next', '»');
        $p->setConfig('last', 'the last Page');
        $p->setConfig('first', 'the first Page');
        $p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
        $list=$projmodel->where($projmodelmap)->order('`id` DESC')->limit($p->firstRow.",".$p->listRows)->field('id,preview,title,description')->select();
        $show=$p->show();
        $this->assign("show",$show);
        $this->assign('catalist',$catalist);
        $this->assign('list',$list);
        $this->assign('refurl','Public/Img/GC/banners/banner_project.png');
        $this->display();
    }
}