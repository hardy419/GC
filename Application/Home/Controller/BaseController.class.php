<?php 
namespace Home\Controller;
use Think\Controller;
class BaseController extends Controller {

	protected $lang;

	public function __construct(){
		parent::__construct();
		/* if(!$this->checkStatus()){
		    $loginMarked=md5(C('AUTH_Home_TOKEN'));
			if(isset($_SESSION[$loginMarked])){
				unset($_SESSION[$loginMarked]);
			}
		}  */
		$this->menu();

		$this->lang = I('cookie.lang', 'en');
		$this->assign ('lang', $this->lang);
	}
	private function menu(){
		$courses=M('programmeslist')->field('id,etitle,title')->order('sid desc,id desc')->select();
		$menu=array();
		$menu['courses']=$courses;
		
		$tutors=M('tutorslist')->field('id,title')->order('sid desc,id desc')->select();
	
		$menu['tutors']=$tutors;
		
		$this->assign('menu',$menu);
	}
    private  function checkStatus(){
      	 $loginMarked=md5(C('AUTH_Home_TOKEN'));
      	 
      	 if(!$_SESSION[$loginMarked]){
      	 	return false;
      	 }
      	 $cookie=explode("_",cookie($loginMarked));
      	 $outtime=C('LOGIN_Home_TIMEOUT');
      	 
      	 if(intval(time())>($outtime+end($cookie)))return false;
      	 if($cookie[0]!=$loginMarked)return false;
      	 cookie($loginMarked,$cookie[0].'_'.time(),0,'/');
      	 return true;
    }
	
}
?>