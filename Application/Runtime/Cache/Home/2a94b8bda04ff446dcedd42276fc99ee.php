<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>vkids</title>
<base href="<?php echo SITE_PATH; echo THEME_PATH;?>" />
<meta charset="utf-8" />
<meta name="Description" content="vkids" />
<meta name="Keywords" content="vkids" />
<meta name="viewport" content="width=device-width,target-densitydpi=device-dpi">
<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/slick.css"/>
<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/base.css"/>
<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/home.css"/>
<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/lightbox.css"/>
<script src="/vkids/Public/Js/jquery-1.8.2.min.js"></script>
<script src="/vkids/Public/Js/lightbox.min.js"></script>
</head>
<body>

	<div id="box">
<!-- Header starts -->
   <div id="header">
      <div class="containerwraper">
         <div id="logo"><a href="<?php echo U('Index/index');?>"><img src="<?php echo SITE_PATH;?>Public/Img/Base/logo.png" /></a></div>
         <div id="navwraper">
              <div class="navlist">
	              <a href="<?php echo U('News/index');?>" class="nav newsnav">最新消息</a>
	              <a href="<?php echo U('Idea/index');?>" class="nav ideanav">教學理念  </a>
	              <a href="javascript:void(0);" class="nav teachernav">導師團隊  </a>
	              <a href="<?php echo U('Courses/index',array('id'=>1));?>" class="nav artnav">藝術課程</a>
	              <a href="<?php echo U('Achievement/index');?>" class="nav awardnav">獎項及作品  </a>
	              <a href="<?php echo U('Report/index');?>" class="nav reportnav">報章報導  </a>
	              <a href="<?php echo U('Cooperation/index');?>" class="nav outsidenav">對外合作  </a>
	              <a href="<?php echo U('Contact/index');?>" class="nav contactnav">聯絡我們</a>
              </div>
              <div class="navlist-rollover">
	              <a href="news.html" class="rollover newsnav1"></a>
	              <a href="idea.html" class="rollover newsnav2">  </a>
	              <a href="javascript:void(0);" class="rollover newsnav3">  </a>
	              <a href="course.html" class="rollover newsnav4"></a>
	              <a href="achievement.html" class="rollover newsnav5">  </a>
              </div>
         </div>
		 
      </div>
   </div>
<!-- Header ends -->
   <div class="banners">
          <div class="containerwraper">
             <img src="<?php echo SITE_PATH;?>Public/Img/Index/banner.jpg" />
             <div class="bannerswraper">
                <div class="bannerbox">
                       <img src="<?php echo SITE_PATH;?>Public/Img/Index/bannerbg.png" />
                       <div class="bannerlist" style="overflow:hidden;">
                            <div class="banner"><img src="<?php echo SITE_PATH;?>Public/Img/Index/banner-img.png" /></div>
                            <div class="banner"><img src="<?php echo SITE_PATH;?>Public/Img/Index/banner-img.png" /></div>
                            <div class="banner"><img src="<?php echo SITE_PATH;?>Public/Img/Index/banner-img.png" /></div>
                            <div class="banner"><img src="<?php echo SITE_PATH;?>Public/Img/Index/banner-img.png" /></div>
                       </div>
                </div>
             </div>
          </div>
   </div>
   
<div id="homewraper" class="container">
        <div class="containerwraper">
             <div id="news">
                 <div class="newswraper">
                        <div class="newslist">
                             <?php if(is_array($newslist)): $i = 0; $__LIST__ = $newslist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="news first">
                                <div class="date"><?php echo (date("Y-m-d",$vo["date"])); ?></div>
                                <div class="title"><a href="javascript:void(0);"> <?php echo ($vo["title"]); ?></a></div>
                                <div class="text"> <?php echo (mb_substr(strip_tags(html_entity_decode($vo["content"])),"0","30","utf-8")); ?></div>
                             </div>
                              <?php if($i < 3): ?><div class="line"></div><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                 </div>
                 <div class="more"><a href="<?php echo U('News/index');?>"><img src="<?php echo SITE_PATH;?>Public/Img/Index/more.png" /></a></div>
             </div>
             <div id="works">
                 <div class="head">
                        <div class="title"><img src="<?php echo SITE_PATH;?>Public/Img/Index/studentbg.png" /></div>
                        <div class="more"><a href="<?php echo U('Achievement/work');?>"><img src="<?php echo SITE_PATH;?>Public/Img/Index/more.png" /></a></div>
                 </div>
                  <div class="workslist">
                       <?php if(is_array($student)): $i = 0; $__LIST__ = $student;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="work">
                              <div class="img"><a href="javascript:void(0);"><img src="<?php echo SITE_PATH;?>Uploads/<?php echo ($vo["pic"]); ?>" width="173" /></a></div>
                              <div class="name"><a href="javascript:void(0);"><?php echo ($vo["name"]); ?></a></div>
                              <div class="infor"><?php echo (mb_substr($vo["title"],"0","50","utf-8")); ?></div>
                         </div><?php endforeach; endif; else: echo "" ;endif; ?>
                  </div>
             </div>
             
             <div class="rightcolumn">
                  <div id="award">
                   <div class="awardslist">
                           <div class="awardwraper">
                                 <div class="title">第14屆 星星河 2014</div>
                                 <div class="text">
                                    <dl>
                                      <dt>特等獎</dt><dt>徐碧彤</dt>	
                                    </dl>
                                    <dl>  
									  <dt>一等獎 </dt><dt>鄧穎潼</dt>
									</dl>
                                    <dl>  
									  <dt>二等獎 </dt><dt>鄺靜祈</dt>
                                    </dl>
                                 </div>
                           </div>
                           <div class="line"></div>
                           <div class="awardwraper">
                                 <div class="title">第14屆 星星河 2014</div>
                                 <div class="text">
                                    <dl>
                                      <dt>特等獎</dt><dt>徐碧彤</dt>	
                                    </dl>
                                    <dl>  
									  <dt>一等獎 </dt><dt>鄧穎潼</dt>
									</dl>
                                    <dl>
									  <dt>二等獎 </dt><dt>鄺靜祈</dt>
                                    </dl>
                                 </div>
                           </div>
                   </div>
                   <div class="more"><a href="javascript:void(0);"><img src="<?php echo SITE_PATH;?>Public/Img/Index/more.png" /></a></div>
                  </div>
                  <div id="contact">
                     <div class="title">兩點水工作室(九龍總校)</div>
                     <div class="text">
						<p>電話：2355 7700</p>
						<p>電郵：vkids2001@gmail.com</p>
						<p>地址：九龍界限街144號僑園sG座1樓</p>
                     </div>
                  </div>
             </div>
        </div>
   </div>
<!-- Footer starts -->
   <!-- footer start -->
   <div id="footer">
   
   </div>
   <!-- footer end-->
<!-- Footer ends -->
</div>
<script src="<?php echo SITE_PATH;?>Public/Js/jquery-1.8.2.min.js"></script>
<script src="<?php echo SITE_PATH;?>Public/Js/slick.js"></script>
<script>
   jQuery(function(){
	   $('.bannerlist').slick({
	        dots: true,
	        autoplay:false,
	        fade:true,
	        arrows:false,
	        onInit:function(){
	        	jQuery('.bannerlist').removeAttr('style');
	        }
	    });
   });
   
</scipt>
</body>
</html>