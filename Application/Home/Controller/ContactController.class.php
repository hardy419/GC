<?php
namespace Home\Controller;
use Think\Controller;
class ContactController extends BaseController {
    public function index(){
        $this->display();
    }
    public function saveContact(){
        $name=I('post.name');
        $contact=I('post.phone');
        $email=I('post.email');
        $course=I('post.comments');
         
        require_once('Email/class.phpmailer.php');
        require_once('Email/class.smtp.php');
        $body = 'Name: '.htmlentities($_REQUEST['name'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
        $body.= 'Comments: '.htmlentities($_REQUEST['comments'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
        $body.= 'Telephone No.: '.htmlentities($_REQUEST['phone'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
        $body.= 'Email: ' . htmlentities($_REQUEST['email'], ENT_COMPAT | ENT_HTML401, 'UTF-8') . '<br />';
        $receiver ='info@mod-makeup.com';// 'modmakeuphk@gmail.com';
        $this->postmail($body, 'MOD Makeup - Contact Us', $receiver, '');
        $result ='Sent';
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