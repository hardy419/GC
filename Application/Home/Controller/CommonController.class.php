<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends BaseController {
    public function about(){
    	$banners=M('bannerlist')->where(array('type'=>'about'))->order('sid desc,id desc')->select();
    	$this->assign('banners',json_encode($banners));
        $this->display();
    }
    public function register(){
    	$this->display();
    }
    public function verify(){
    	$config =    array(
    			'imageW'=>100,    // 验证码字体大小
    			'imageH'=>30,
    			'length'=>4,     // 验证码位数   \
    			'useCurve'=>false,
    			'fontSize'=>14,
    			'useNoise'    =>false, // 关闭验证码杂点
    	);
    	$Verify = new \Think\Verify($config);
    	$Verify->entry(1);
    }
    protected function check_verify($code, $id = ''){
    	$verify = new \Think\Verify();
    	return $verify->check($code, $id);
    }
    public function checkLog(){
    	$verify=I('post.secode');
    	if(empty($verify)||!$this->check_verify($verify,1)){
    		$this->error('The Verify is not correct!');
    	}
    	
    	$map=array();
    	$map['status']=1;
    	$map['account']=$_POST['account'];
    	$authInfo=M('member')->where($map)->find();
    	
    	if($authInfo==false){
    		$this->error('Account or Password not correct！');
    	}else{
    	
    		if($authInfo['password']!=md5($_POST['password'])){
    			$this->error('Password not correct！');
    		}
    		$loginMarked=md5(C('AUTH_Home_TOKEN'));
    		$_SESSION[$loginMarked]=$authInfo['id'];
    		$_SESSION['memail']	=	$authInfo['email'];
    		$_SESSION['mloginUserName']		=	$authInfo['account'];
    		$_SESSION['mlastLoginTime']		=	$authInfo['last_login_time'];
    		$_SESSION['mlogin_count']	=	$authInfo['login_count'];
    		cookie($loginMarked,$loginMarked.'_'.time(),0,'/');
    		//保存登录信息
    		$DB=M('member');
    		$data=array();
    		$data['id']=$authInfo['id'];
    		//$data['last_login_ip']=get_client_ip();
    		$data['last_login_time']=time();
    		$data['login_count']=array('exp','login_count+1');
    		$DB->save($data);
    	
    		$this->success('Login Success',U('Member/index'));
    	}
    }
    public function logout(){
    	$loginMarked=md5(C('AUTH_Home_TOKEN'));
    	if(isset($_SESSION[$loginMarked])){
    		unset($_SESSION[$loginMarked]);
    		unset($_SESSION['mloginUserName']);
    		$this->success('Logout Success',U('Common/login'));
    	}else{
    		 
    		$this->success('Logout Success',U('Common/login'));
    	}
    }
    public function saveReg(){
    	$db=D('member');
    	if(!$db->create()){
    		$this->error($db->getError(),U('register'));
    	}else{
    		$query=$db->add();
    		if($query){
    			$this->success('register success',U('login'));
    		}else{
    			$this->error('register failure',U('register'));
    		}
    	}
    }
}