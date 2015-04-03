<?php
namespace Admin\Controller;
use Think\Controller;
class MemberController extends BaseController{
public function index(){
    	$model='member';
    	$map=$this->_search($model);
    	
        $this->_select($model,$map);
        $fields=M($model)->getDbFields();
        array_pop($fields);

        $map=$this->_searchMap($model);
        $this->assign('map',$map);
        unset($fields[0]);
        unset($fields[2]);
        unset($fields[3]);
        unset($fields[4]);
        unset($fields[5]);
        unset($fields[6]);
        unset($fields[7]);
        unset($fields[10]);
        sort($fields);

        $this->assign('fields',$fields);
        $this->assign('model',$model);
        cookie("__CURRENTURL__",__SELF__);
    	$this->display();
    }
    protected  function _searchMap($name){
    	$model=D($name);
    	$map=array();
    	foreach ($model->getDbFields() as $key=>$val){
    		if(isset($_REQUEST[$val])&&$_REQUEST[$val]!=''){
    			$map[$val]=$_REQUEST[$val];
    		}
    	}
    	return $map;
    }
    protected  function _search($name){
    	$model=D($name);
    	$map=array();
    	foreach ($model->getDbFields() as $key=>$val){
    		if(isset($_REQUEST[$val])&&$_REQUEST[$val]!=''){
    			$map[$val]=array('like','%'.$_REQUEST[$val].'%');
    		}
    	}
    	return $map;
    }
    public function removeFilter(){
    	$model=I('get.model');
    	 
    	cookie("__MAP__".$model,null);
    	$jump=cookie('__CURRENTURL__');
    	$this->success('Clear Success',$jump);
    }
    public function exportMember(){
    	
    	$limit=isset($_GET['limit'])?I('get.limit'):0;
    	include 'PHPExcel/PHPExcel.php';
    	include 'PHPExcel/PHPExcel/IOFactory.php';
    	include 'PHPExcel/PHPExcel/Writer/Excel5.php';
    	
    	$result=new \PHPExcel();
    	$result->getActiveSheet()->setCellValue('A1','ID');
    	$result->getActiveSheet()->setCellValue('B1','Account');
    	$result->getActiveSheet()->setCellValue('C1','Login Count');
    	$result->getActiveSheet()->setCellValue('D1','Last Login Time');
    	$result->getActiveSheet()->setCellValue('E1','Region');
    	$result->getActiveSheet()->setCellValue('F1','Industry');
    	$result->getActiveSheet()->setCellValue('G1','Package');
    	$result->getActiveSheet()->setCellValue('H1','Lang');
    	$result->getActiveSheet()->setCellValue('I1','Email');
    	
    	$data=M()->query("select m.account,m.email,r.title as region,l.name as lang,i.title as industry,p.title as package from member as m left join regionlist as r on m.region=r.id left join industrylist as i on m.industry=i.id left join langlist as l on l.value=m.lang left join  packagelist as p on p.id=m.package limit $limit,10000");
    	
    	$i=2;
    	foreach ($data  as $item){
    		$result->getActiveSheet()->setCellValue('A'.$i,$item['id']);
    		$result->getActiveSheet()->setCellValue('B'.$i,$item['account']);
    		$result->getActiveSheet()->setCellValue('C'.$i,$item['region']);
    		$result->getActiveSheet()->setCellValue('D'.$i,$item['industry']);
    		$result->getActiveSheet()->setCellValue('E'.$i,$item['package']);
    		$result->getActiveSheet()->setCellValue('F'.$i,$item['lang']);
    		$result->getActiveSheet()->setCellValue('G'.$i,$item['email']);
    		
    		$i++;
    	}
    	
    	//导出文件名 
    	$outputFileName="Member_".$limit."_".($limit+10000).".xls";
    	$writer=new \PHPExcel_Writer_Excel5($result);
    	header("Content-Type:application/force-download");
    	header("Content-Type:application/octet-stream");
    	header("Content-Type:application/download");
    	header('Content-Disposition:inline;filename="'.$outputFileName.'"');
    	header("Content-Transfer-Encoding:binary");
    	header("Expires:Mon,26 Jul 1997 05:00:00 GMT");
    	header("Last-Modified:".gmdate("D,d M Y H:i:s")." GMT");
    	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    	header("Pragma: no-cache");
    	$writer->save("php://output"); 
    }
    public function control(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$tpl=isset($_GET['tpl'])?I('get.tpl'):'';
    	
    	$courses=M('programmeslist')->where(array('status'=>1))->order('sid desc,id desc')->select();
    	$this->assign('courses',$courses);
		$coursescode=M('coursescodelist')->where(array('status'=>1))->order('sid desc,id desc')->select();
    	$this->assign('coursescode',$coursescode);
    	if(!empty($id)){
    		$this->_control('member',$id);
    		if($tpl=='pwd')$this->display('controlPwd');
    		else	
    		$this->display('controlInfo');
    	}else{
    		
    		$this->display();
    	}
    }
    protected  function _control($name,$id){
    	$list=M($name)->where(array('id'=>$id))->find();
    	$this->assign('list',$list);
    }

    public function save(){
    	$jump=cookie("__CURRENTURL__");
    	$db=D('member');
    	
    	if(!$db->create()){
    		$this->error($db->getError());
    	}else{
    		$courses=$_POST['courses'];
    		$id=isset($_POST['id'])?I('post.id'):'';
    		if(!empty($courses)){
    			$courses=implode(',',$courses);
    			$db->courses=$courses;
    		}
			$coursescode=$_POST['coursescode'];
    		if(!empty($coursescode)){
    			$coursescode=implode(',',$coursescode);
    			$db->coursescode=$coursescode;
    		}
			
    		if(!empty($id)){
    			$query=$db->save();
    		}else{
    			$query=$db->add();
    		}
    		if ($query)$this->success('Member has been added successfully',$jump);
    		else $this->error('Member  added Failure',$jump);
    	}
    }

  
    public function _select($name,$map=array(),$order='',$sort='',$asc=false){
    	$model=D($name);
    	 
    	if(isset($_REQUEST['_order'])){
    		$order=$_REQUEST['_order'];
    	}else{
    		$order=!empty($order)?$order:$model->getPK();
    	}
    
    	if(isset($_REQUEST['_sort'])){
    		$sort=$_REQUEST['_sort']?'asc':'desc';
    	}else{
    		$sort=!empty($asc)?'asc':'desc';
    	}
    
    	$count=$model->where($map)->count();
    	
    	if ($count>0){
    		if(!empty($_REQUEST['listRows'])){
    			$listRows=$_REQUEST['listRows'];
    			cookie($name."_listRows",$listRows,3600);
    		}elseif(cookie($name."_listRows")){
    			$listRows=cookie($name."_listRows");
    		}else{
    			$pageNum=C("PAGENUM");
    			$listRows=!empty($pageNum)?$pageNum:15;
    		}
    		 
    		$p=new \Org\Util\Page($count,$listRows);
    		$p->setConfig('prev', '«');
    		$p->setConfig('next', '»');
    		$p->setConfig('last', 'the last Page');
    		$p->setConfig('first', 'the first Page');
    		$p->setConfig('theme','%upPage% %first%  %prePage% %linkPage%  %downPage%  %nextPage% %end%');
    		$list=$model->where($map)->order("`" . $order . "` " . $sort)->limit($p->firstRow.",".$p->listRows)->select();
    		$show=$p->show();
    		$this->assign("show",$show);
    		$this->assign('list',$list);
    		 
    		$this->assign("listRows",$listRows);
    		$fields=$model->getDbFields();
    		$this->assign('fields',$fields);
    		cookie("__CURRENTURL__",__SELF__);
    	}
    }
    public function del(){
    	$id=isset($_GET['id'])?I('get.id'):'';
    	$jump=cookie('__CURRENTURL__');
    	if(empty($id)||$id==1)$this->error('Delete Failure',$jump);
    	
    	$query=M('member')->where(array('id'=>$id))->delete();
    	if ($query)$this->success('Delete Success',$jump);
    	else $this->error('Delete Failure',$jump);
    }
}