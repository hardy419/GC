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

<link  rel="stylesheet" type="text/css" href="/vkids/Public/Css/course.css"/>
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
             <img src="<?php echo SITE_PATH;?>Public/Img/Idea/banner.jpg" />
          </div>
   </div>
   <div id="pagemain" class="container">
      <div class="containerwraper coursewraper <?php if($list["id"] != 1): ?>coursewraper2<?php endif; ?>">
           <div class="contentwraper">
              <div class="leftColumn">
                    <div class="sectionlist">
                            <!--<div class="section <?php if($list["id"] == 2): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index',array('id'=>2));?>" class="story"></a>
                            </div>
                            <div class="section <?php if($list["id"] == 3): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index',array('id'=>3));?>" class="middleskill"></a>
                            </div>
                            <div class="section <?php if($list["id"] == 4): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index',array('id'=>4));?>" class="highskill"></a>
                            </div>
                            <div class="section <?php if($list["id"] == 5): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index',array('id'=>5));?>" class="westpainting"></a>
                            </div>
                            <div class="section <?php if($list["id"] == 6): ?>active<?php endif; ?>">
                               <a href="<?php echo U('index',array('id'=>6));?>" class="lnkpainting"></a>
                            </div>-->
                            <?php if(is_array($cate)): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="section <?php if($vo["id"] == $id): ?>active<?php endif; ?>">
                                 <a href="<?php echo U('index',array('id'=>$vo['id']));?>"><?php echo ($vo["title"]); ?></a>
                              </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
              </div>
              <div class="rightColumn">
                   <div class="pagetitle"><?php echo ($list["title"]); ?></div>
                   <div class="description"><?php echo (html_entity_decode($list["content"])); ?>
                      <div class="courselist">
                        <?php if(is_array($courseinfo)): $i = 0; $__LIST__ = $courseinfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="course" style="border: 1px solid <?php echo ($vo["color"]); ?>;">
                            <div class="head" style="background: none repeat scroll 0 0 <?php echo ($vo["color"]); ?>;">
                              <span><?php echo ($vo["title"]); ?></span><span class="age"><?php echo ($vo["age"]); ?></span><span class="fit"><?php echo ($vo["fit"]); ?></span>
                            </div>
                            <div class="main">
                              <div class="content"><?php echo (html_entity_decode($vo["content"])); ?></div>
                              <?php if($vo["time"] != ''): ?><div class="time">
                                <a data-lightbox="<?php echo ($list["id"]); ?>" href="<?php if($vo["time"] != ''): echo SITE_PATH; echo ($vo['time']); else: ?>javascript:void(0);<?php endif; ?>"><span>課程時間表</span></a>
                              </div><?php endif; ?>
                            </div>
                          </div><?php endforeach; endif; else: echo "" ;endif; ?>
                      </div>
                   </div>
                   
              </div>
           </div>
      </div
<!-- Footer starts -->
   <!-- footer start -->
   <div id="footer">
   
   </div>
   <!-- footer end-->
<!-- Footer ends -->
</body>
</html>