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
<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/achievement.css"/>
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
             <img src="<?php echo SITE_PATH;?>Public/Img/Achievement/banner.jpg" />
          </div>
   </div>

   <!-- page-main -->
   <div id="pagemain" class="container">
      <div class="containerwraper achievementwraper">
           <div class="contentwraper">
              <div class="leftColumn">
                    <div class="sectionlist">
                            <div class="section <?php if(ACTION_NAME == 'index'): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index');?>" class="student"></a>
                            </div>
                            <div class="section <?php if(ACTION_NAME == 'work'): ?>active<?php endif; ?>">
                               <a href="<?php echo U('work');?>" class="work"></a>
                            </div>
                            <div class="section <?php if(CONTROLLER_NAME == 'Child'): ?>active<?php endif; ?>">
                               <a href="<?php echo U('Child/index');?>" class="child"></a>
                            </div>
                    </div>
              </div>
              <div class="rightColumn">
                    <div class="achievementlist">
                         <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="achievement">
                             <div class="img"><a href="javascript:void(0);"><img src="<?php echo SITE_PATH;?>Uploads/<?php echo ($vo["pic"]); ?>" width="230" /></a></div>
                             <div class="name"><a href="javascript:void(0);"><?php echo ($vo["title"]); ?></a></div>
                             <div class="author"><a href="javascript:void(0);">學生名稱：<?php echo ($vo["name"]); ?></a></div>
                         </div><?php endforeach; endif; else: echo "" ;endif; ?>
                         <div class="pagination pagination-right">
                        <ul>
                          <?php echo ($show); ?>
                       </ul>
                   </div>
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
</body>
</html>