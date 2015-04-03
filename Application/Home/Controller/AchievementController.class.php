<?php
namespace Home\Controller;
use Think\Controller;
class AchievementController extends BaseController {
    public function index(){
        $name=D('studentphotoslist');
    	// $achievementlist=M('studentphotoslist')->where(array('pid'=>'1'))->order('sid desc,id desc')->select();
    	$this->assign('achievementlist',$achievementlist);
        $count=M('studentphotoslist')->where(array('pid'=>'1'))->count();
         
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
            $list=M('studentphotoslist')->where(array('pid'=>'1'))->order('sid desc,id desc')->limit($p->firstRow.",".$p->listRows)->select();
            $show=$p->show();
            $this->assign("show",$show);
            $this->assign("list",$list);
        }
        $this->display();
    }
    public function work(){
        $name=D('studentphotoslist');
        // $achievementlist=M('studentphotoslist')->where(array('pid'=>'1'))->order('sid desc,id desc')->select();
        $this->assign('achievementlist',$achievementlist);
        $count=M('studentphotoslist')->where(array('pid'=>'2'))->count();
         
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
            $list=M('studentphotoslist')->where(array('pid'=>'2'))->order('sid desc,id desc')->limit($p->firstRow.",".$p->listRows)->select();
            $show=$p->show();
            $this->assign("show",$show);
            $this->assign("list",$list);
        }
        $this->display();
    }
    public function child(){
        $name=D('studentphotoslist');
        // $achievementlist=M('studentphotoslist')->where(array('pid'=>'1'))->order('sid desc,id desc')->select();
        $this->assign('achievementlist',$achievementlist);
        $count=M('studentphotoslist')->where(array('pid'=>'3'))->count();
         
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
            $list=M('studentphotoslist')->where(array('pid'=>'3'))->order('sid desc,id desc')->limit($p->firstRow.",".$p->listRows)->select();
            $show=$p->show();
            $this->assign("show",$show);
            $this->assign("list",$list);
        }
        $this->display();
    }
}