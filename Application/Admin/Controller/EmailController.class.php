<?php 
namespace Admin\Controller;
use Think\Controller;
class EmailController extends BaseController{
	public function index() {
		$programmes=M('programmeslist')->field('id,title,etitle')->select();
		$this->assign('programmes',$programmes);
		
		$coursecode=M('coursescodelist')->field('id,title,etitle,pid')->select();
		$coursecodes=array();
		foreach($coursecode as $value)
		{
			$coursecodes[$value['pid']][]=array('id'=>$value['id'],'title'=>$value['title'],'etitle'=>$value['etitle'],);
		}
		$this->assign('coursecodes',$coursecodes);
		$this->display();
	}
	public function sendEmail(){
		$course=I('post.coursecodes');
		$title=I('post.title');
		$content=I('post.content');
		$list=M('member')->field('id,account,email,phone')->where("coursescode like '%$course%'")->select();
		$courses=M('coursescodelist')->field('id,title')->where(array('id'=>$course))->find();
		$course=$courses['title'];
		require_once('Email/class.phpmailer.php');
		require_once('Email/class.smtp.php');
		$names=array();
		$emails=array();
		foreach ($list as $k=>$v){
			$name=$v['account'];
			$email=$v['email'];
			$list[$k]['course']=$course;
			$names[$k]=$name;
			$emails[$k]=$email;
		}
		$names=implode(';',$names);
		$emails=implode(';',$emails);
		$this->send($names, $course,$emails,$title, $content);
		echo json_encode($list);
	}
	public function send($name,$course,$email,$title,$content){
		$body.= 'Course: '.htmlentities($course, ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
		$body.= 'Content: ' .htmlspecialchars_decode($content). '<br />';
		$this->postmail($body,$title,$email,$name);
	}
    protected function postmail($body,$subject,$address,$name,$isHTML = true){
	
		$mail             = new \PHPMailer();
		$mail->CharSet="UTF-8";
		$mail->IsSMTP(); 		// telling the class to use SMTP
		$mail->SMTPDebug  =0;	// 1 = errors and messages, 2 = messages only
		$mail->SMTPAuth   = true;
		 
		$mail->Host = "mail.mod-makeup.com"; //SMTP服务器 以163邮箱为例子
		$mail->Port = 26;  //邮件发送端口
		$mail->Username = "info@mod-makeup.com";  //你的邮箱
		$mail->Password = "2201info##";  //你的密码
		 
		mb_internal_encoding('UTF-8');    // 內部預設編碼改為UTF-8
		$mail->Subject = mb_encode_mimeheader($subject, "UTF-8");
		 
		if(!$isHTML)
		{
			$mail->From = "info@mod-makeup.com";  //发件人地址（也就是你的邮箱）
			$mail->isHTML(false);
			$msg = $body;
			$mail->Body = $msg;
			 
		}else{
			$mail->From = "info@mod-makeup.com";  //发件人地址（也就是你的邮箱）
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
	    if(!$mail->Send()) {
			return false;
		} else {
			return true;
		}		 
   }
}
?>