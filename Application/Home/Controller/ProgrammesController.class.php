<?php
namespace Home\Controller;
use Think\Controller;
class ProgrammesController extends BaseController {
    public function index(){
    	$list=M('programmeslist')->order('sid desc,id desc')->select();
    	foreach ($list as $k=>$v){
    		$courses=$this->str_cut($v['parta']);
    		$list[$k]['parta']=$courses;
    		$courses=$this->str_cut($v['partb']);
    		$list[$k]['partb']=$courses;
    		$courses=$this->str_cut($v['partc']);
    		$list[$k]['partc']=$courses;
    	}
    	$this->assign('list',$list);
        $this->display();
    }
    public function saveClass(){
    	$name=I('post.name');
    	$contact=I('post.contactNo');
    	$email=I('post.email');
    	$course=I('post.course');
    	
    	require_once('Email/class.phpmailer.php');
    	require_once('Email/class.smtp.php');
    	$body = 'Name: '.htmlentities($_REQUEST['name'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
    	$body.= 'Course: '.htmlentities($_REQUEST['course'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
    	$body.= 'Telephone No.: '.htmlentities($_REQUEST['contactNo'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
    	$body.= 'Email: ' . htmlentities($_REQUEST['email'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
    	$receiver ='960766435@qq.com';// 'modmakeuphk@gmail.com';
    	$this->postmail($body, 'MOD Makeup - Free Class Trial', $receiver, '');
    	$result ='Sent';
    }
    protected function postmail($body,$subject,$address,$name,$isHTML = true){

    	$mail             = new \PHPMailer();
    	$mail->CharSet="UTF-8";
    	$mail->IsSMTP(); 		// telling the class to use SMTP
    	$mail->SMTPDebug  =2;	// 1 = errors and messages, 2 = messages only
    	$mail->SMTPAuth   = true;
    	//$mail->SMTPSecure = 'ssl';
    	/* $mail->Host       = "smtp.gmail.com";
    	$mail->Port       = 465;
    	$mail->Username   = "modmakeuphk@gmail.com";
    	$mail->Password   = "modmakeup50";
    	 */
    	
    	$mail->Host = "smtp.163.com"; //SMTP服务器 以163邮箱为例子
    	$mail->Port = 25;  //邮件发送端口
    	$mail->Username = "rust1989@163.com";  //你的邮箱
    	$mail->Password = "960766435rust";  //你的密码
    	
    	mb_internal_encoding('UTF-8');    // 內部預設編碼改為UTF-8
    	$mail->Subject = mb_encode_mimeheader($subject, "UTF-8");
    	
    	if(!$isHTML)
    	{
    		$mail->From = "rust1989@163.com";  //发件人地址（也就是你的邮箱）
    		//$mail->SetFrom('noreply@mod-makeup.com', 'MOD Makeup');
    		//$mail->AddReplyTo("noreply@mod-makeup.com", "MOD Makeup");
    		$mail->isHTML(false);
    		$msg = $body;
    		$mail->Body = $msg;
    			
    	}else{
    		$mail->From = "rust1989@163.com";  //发件人地址（也就是你的邮箱）
    		//$mail->SetFrom('noreply@mod-makeup.com', 'MOD Makeup');
    		//$mail->AddReplyTo("noreply@mod-makeup.com", "MOD Makeup");
    		$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!";
    		$msg .= $body;
    		$mail->MsgHTML($msg);
    	}
    	
    	$addressArray = explode(";", $address);
    	$nameArray = explode(";", $name);
    	
    	for($i=0; $i < count($addressArray); $i++)
    	{
    	$mail->AddAddress($addressArray[$i], $nameArray[$i]);
    	}
    	$mail->AddCC('jesse@mod-makeup.com');
    	if(!$mail->Send()){
    		return "Mailer Error: " . $mail->ErrorInfo;
    	}else{
    		return "Sent";
    	}
    	
    }
    protected  function str_cut($str,$per='//'){
    	if(empty($str)||!strpos($str,$per))return $str;
    	return explode($per,$str);
    }
}