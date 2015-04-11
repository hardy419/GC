-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 04 月 11 日 05:53
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `gc_db`
--
CREATE DATABASE IF NOT EXISTS `gc_db`;
USE `gc_db`;

-- --------------------------------------------------------

--
-- 表的结构 `gc_banner`
--

CREATE TABLE IF NOT EXISTS `gc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `gc_banner`
--

INSERT INTO `gc_banner` (`id`, `title`, `sid`, `url`) VALUES
(1, 'Banner for who we are page', 90002, 'Public/Img/GC/banners/banner_whoweare.png'),
(2, 'Banner for what we do page', 90003, 'Public/Img/GC/banners/banner_whatwedo.png'),
(3, 'Banner for client list page', 90004, 'Public/Img/GC/banners/banner_clientlist.png'),
(4, 'Banner for contact us', 90005, 'Public/Img/GC/banners/banner_contactus.png'),
(5, 'Banner for test page id#2', 2, 'Public/Img/GC/banners/banner_clientlist.png'),
(6, 'Banner for home page 1', 80001, 'Public/Img/GC/banners/banner1.jpg'),
(7, 'Banner for home page 2', 80002, 'Public/Img/GC/banners/banner2.jpg'),
(8, 'Banner for home page 3', 80003, 'Public/Img/GC/banners/banner3.jpg'),
(9, 'Banner for home page 4', 80004, 'Public/Img/GC/banners/banner1.jpg'),
(10, 'Banner for home page 5', 80005, 'Public/Img/GC/banners/banner2.jpg'),
(23, 'Banner for test page#4', 4, 'Public/Img/GC/201405.png '),
(24, 'test', 3, 'Public/Img/GC/client_logo6.png');

-- --------------------------------------------------------

--
-- 表的结构 `gc_catagory`
--

CREATE TABLE IF NOT EXISTS `gc_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `type` enum('項目','備用1','備用2') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gc_catagory`
--

INSERT INTO `gc_catagory` (`id`, `name`, `type`) VALUES
(1, '類別1', '項目'),
(2, '類別2', '項目'),
(3, '類別3', '項目');

-- --------------------------------------------------------

--
-- 表的结构 `gc_page`
--

CREATE TABLE IF NOT EXISTS `gc_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90006 ;

--
-- 转存表中的数据 `gc_page`
--

INSERT INTO `gc_page` (`id`, `title`, `content`, `status`) VALUES
(1, '教學理念1', '&lt;div class=&quot;text&quot;&gt;\n	&lt;p&gt;\n		爸爸媽媽為甚麼要讓小朋友去學「畫畫」呢？\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		為了訓練子女多角度思考？培養他們的藝術美感？增強他們的表達能力及自信心？訓練他們的小肌肉？為學校的功課做準備？……\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		若我們以小朋友的角度去看，會發現他們大部份都喜歡接觸色彩；喜愛用顏色去描繪所看見的事物；會滿心歡喜的與家人分享自己的畫作；喜歡將畫中的得意故事向老師同學一一道來。每一個作品，對小孩來說，就像一本圖冊，有說不完的故事。但很多時候，父母會忽略了子女的聲音，著眼點只放在作品上。\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		有家長會問：「我的孩子很喜歡畫畫，很有天份，可不可以儘早教他深一點的繪畫技巧？」可能父母會認為，小朋友的畫只要畫得真，能夠在畫中運用所學的技巧，就可以畫出一幅好畫。但我們覺得，畫得真，畫得有技巧，但裡面沒有小朋友的感受，沒有小朋友的故事，沒有小朋友的靈魂，那麼繪畫只會變成空洞的東西。\n	&lt;/p&gt;\n&lt;/div&gt;\n&lt;h4&gt;\n	我們的信念是 ─ 繪畫對小朋友的價值，不止限於美與不美，繪畫是他們表達感受的溝通媒介，是健康成長的好伙伴。\n&lt;/h4&gt;\n&lt;div class=&quot;leftColumn&quot;&gt;\n	&lt;div class=&quot;text&quot;&gt;\n		&lt;p&gt;\n			藝術創作並不孤獨，它可以令關係密切的人更加了解對方；它可以令不相識的人惺惺相惜。當看見小朋友拿著起自己的創作，面露滿足的笑容，或者興奮得手舞足蹈，藝術的力量已超出作品本身，它讓我們感受到小朋友的情緒，它讓我們觸碰小小生命的靈魂。父母有時會想，怎樣與子女溝通，但原來在視覺藝術世界中，小孩已經不知不覺與大人們說話了。\n		&lt;/p&gt;\n		&lt;p&gt;\n			所以，父母及老師擔當的角色，並不只教導，而是陪在小朋友左右，用心去引發他們、鼓勵他們、聆聽他們，從中引發他們對藝術的興趣，鼓勵他們作多方面的嘗試。讓他們相信利用自己的小手掌，都可以發揮出大力量；聆聽他們的分享，進入幼小的內心世界，變為子女成長路上的知心友。\n		&lt;/p&gt;\n	&lt;/div&gt;\n	&lt;h4&gt;\n		擁有靈魂及個人風格的作品，才是最感動人及富有藝術價值。\n	&lt;/h4&gt;\n	&lt;div class=&quot;text&quot;&gt;\n		只要用「心」創造， 繪畫必定是最「美」的。就讓我們一起陪伴可愛的小孩，啟發他們、鼓勵他們，以自己的力量完成腦海中的意念，在藝術創作的路上快樂成長。\n	&lt;/div&gt;\n&lt;/div&gt;\n&lt;div class=&quot;rightColumn&quot;&gt;\n	&lt;img src=&quot;http://localhost/vkids/Public/Img/Idea/idea.jpg&quot; /&gt; \n&lt;/div&gt;', 1),
(2, '1234', '&lt;p&gt;\r\n	&amp;lt;h1&amp;gt;ahahahaha...&amp;lt;/h1&amp;gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;lt;p&amp;gt;hahahahahahahahahahah&amp;lt;/p&amp;gt;\r\n&lt;/p&gt;', 1),
(3, 'test', '&lt;h1&gt;\r\n	Haaaardy\r\n&lt;/h1&gt;\r\n&lt;p&gt;\r\n	Test..\r\n&lt;/p&gt;', 1),
(4, 'test2', '1234', 1),
(90002, 'Who We Are', '    &lt;div id=&quot;intro&quot;&gt;\n        &lt;img src=&quot;../../../../Public/Img/GC/bulb.png&quot;&gt;&lt;/img&gt;\n        &lt;div id=&quot;intro-text&quot;&gt;\n            &lt;div class=&quot;intro-title&quot;&gt;WHO WE ARE&lt;/div&gt;\n            &lt;p&gt;GC is a public relations firm that provides marketing solution for corporate and clients.  Our scope of service include corporate communication, event planning, media relations and social media marketing etc.  We pledge to provide all-rounded public relations services.&lt;/p&gt;\n            &lt;p&gt;GC is committed to providing the best for clients, we listen attentively to their needs and provide the best solutions that are within the client’s budget.  Clients can count on us to come up with the most effective marketing campaign and communication strategies to help them boost sales and arouse brand awareness.&lt;/p&gt;\n        &lt;/div&gt;\n    &lt;/div&gt;\n    &lt;hr style=&quot;clear:both&quot; /&gt;\n    &lt;div id=&quot;details&quot;&gt;\n        &lt;ul&gt;\n            &lt;li class=&quot;detail-li-left&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;GC’s scope of service&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Marketing and brand communications&lt;/li&gt;\n                    &lt;li&gt;Marketing communications&lt;/li&gt;\n                    &lt;li&gt;Branding strategies&lt;/li&gt;\n                    &lt;li&gt;Hosting press conferences&lt;/li&gt;\n                    &lt;li&gt;Brand promotion and new product launch&lt;/li&gt;\n                    &lt;li&gt;Brand crossover and sponsorships&lt;/li&gt;\n                    &lt;li&gt;Production of promotion materials&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;li class=&quot;detail-li-middle&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;Digital and social media marketing&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Promotion on social media&lt;/li&gt;\n                    &lt;li&gt;Design and promotion strategies for product placement in online advertisement&lt;/li&gt;\n                    &lt;li&gt;Planning for interactive online promotion activities&lt;/li&gt;\n                    &lt;li&gt;Corporate website design, website content development and updates&lt;/li&gt;\n                    &lt;li&gt;Digital marketing strategies&lt;/li&gt;\n                    &lt;li&gt;Blogger outreach&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;li class=&quot;detail-li-right&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;&amp;nbsp;&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Social media and online advertising&lt;/li&gt;\n                    &lt;li&gt;Social media research and monitoring&lt;/li&gt;\n                    &lt;li&gt;Social media management&lt;/li&gt;\n                    &lt;li&gt;Gathering market updates and giving analysis&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n            &lt;li class=&quot;detail-li-left&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;Media relations&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Arranging media interviews&lt;/li&gt;\n                    &lt;li&gt;Writing and distribution of press releases&lt;/li&gt;\n                    &lt;li&gt;Hosting press conferences&lt;/li&gt;\n                    &lt;li&gt;Market positioning and indentifying news angles&lt;/li&gt;\n                    &lt;li&gt;Organising of media tours&lt;/li&gt;\n                    &lt;li&gt;Hosting corporate events&lt;/li&gt;\n                    &lt;li&gt;Hosting media gatherings&lt;/li&gt;\n                    &lt;li&gt;Monitor media coverage&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;li class=&quot;detail-li-middle&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;Event planning&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Locating venues and providing design and production of venues&lt;/li&gt;\n                    &lt;li&gt;Hosting activities and seminars&lt;/li&gt;\n                    &lt;li&gt;Organise event run-downs&lt;/li&gt;\n                    &lt;li&gt;Media reception and public relations&lt;/li&gt;\n                    &lt;li&gt;Production of publications, souvenir and sourcing for supplies for events&lt;/li&gt;\n                    &lt;li&gt;Hosting seminars, forums, exhibitions and lectures&lt;/li&gt;\n                    &lt;li&gt;Annual dinners&lt;/li&gt;\n                    &lt;li&gt;Opening ceremonies&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;li class=&quot;detail-li-right&quot;&gt;\n                &lt;div class=&quot;detail-title&quot;&gt;&amp;nbsp;&lt;/div&gt;\n                &lt;ul&gt;\n                    &lt;li&gt;Exhibitions and road shows&lt;/li&gt;\n                    &lt;li&gt;Formal receptions&lt;/li&gt;\n                    &lt;li&gt;Catering and transport arrangements for events&lt;/li&gt;\n                &lt;/ul&gt;\n            &lt;/li&gt;\n            &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n        &lt;/ul&gt;\n    &lt;/div&gt;\n', 1),
(90003, 'What We Do', '    &lt;div class=&quot;whatwedo-intro&quot;&gt;\n        &lt;img src=&quot;../../../../Public/Img/GC/whatwedo_pic1.png&quot;&gt;&lt;/img&gt;\n        &lt;div class=&quot;intro-text&quot;&gt;\n            &lt;div class=&quot;intro-title&quot;&gt;Marketing and branding communications&lt;/div&gt;\n            &lt;p&gt;The keys to success in marketing are having strong brand awareness and a good reputation.  Effective marketing strategies are able to put brands and products under the spotlights and build consumer’s loyalty.  Having brands become sponsors of large- scale events is one of the strategies to enhance image of the brand.  GC helps clients identify the best opportunity to place sponsorships according to the nature of their business and market positioning.  With careful planning and the employment of promotion strategies, we pledged to provide the most cost-effective and special marketing campaign for clients.&lt;/p&gt;\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\n            &lt;div&gt;&lt;/div&gt;\n            &lt;ul&gt;\n                &lt;li&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;Marketing communications&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Hosting press conferences&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Brand crossover and sponsorships&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;Branding strategies&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Brand promotion and new product launch&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Production of promotion materials&lt;/li&gt;&lt;/ul&gt;\n                &lt;/li&gt;\n            &lt;/ul&gt;\n        &lt;/div&gt;\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n    &lt;/div&gt;\n    &lt;hr/&gt;\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\n        &lt;img src=&quot;../../../../Public/Img/GC/whatwedo_pic2.png&quot;&gt;&lt;/img&gt;\n        &lt;div class=&quot;intro-text&quot;&gt;\n            &lt;div class=&quot;intro-title&quot;&gt;Digital and social media marketing&lt;/div&gt;\n            &lt;p&gt;In today’s information age, making use of the internet, social media and mobile devices for marketing purposes is a growing trend.  GC has a team of digital marketing veterans who knows the online world inside out and are capable communicator and innovators in the digital world.  GC tailor-made social media promotion strategies for clients.  Through online forums, social media groups and bloggers, GC ensures client’s marketing messages reach the target audience in the most-cost-effective way, helping brands enhance their popularity.&lt;/p&gt;\n            &lt;p&gt;GC also monitors what is being said on social media about clients.  Through analysing these data, GC is able to come up with the best marketing strategies to help clients build and enhance market share.&lt;/p&gt;\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\n            &lt;div&gt;&lt;/div&gt;\n            &lt;ul&gt;\n                &lt;li&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Promotion on social media&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Blogger outreach&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Design and promotion strategies for product placement in online advertisement&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Social media and online advertising&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Planning for interactive online promotion activities&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Social media research and monitoring&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Corporate website design, website content development and updates&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Social media management&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Digital marketing strategies&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Gathering market updates and giving analysis&lt;/li&gt;&lt;/ul&gt;\n                &lt;/li&gt;\n            &lt;/ul&gt;\n        &lt;/div&gt;\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n    &lt;/div&gt;\n    &lt;hr/&gt;\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\n        &lt;img src=&quot;../../../../Public/Img/GC/whatwedo_pic3.png&quot;&gt;&lt;/img&gt;\n        &lt;div class=&quot;intro-text&quot;&gt;\n            &lt;div class=&quot;intro-title&quot;&gt;Media relations&lt;/div&gt;\n            &lt;p&gt;Giving media interviews and getting media coverage is the best way for brands and corporate to build reputation and boost brand awareness.  GC is familiar with the operation of traditional and online media.  It has close relationship with local media including newspaper, magazine, radio stations, television stations and news agencies, helping clients build trust among media and gain positive coverage.&lt;/p&gt;\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\n            &lt;div&gt;&lt;/div&gt;\n            &lt;ul&gt;\n                &lt;li&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;Arranging media interviews&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Market positioning and indentifying news angles&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Hosting media gatherings&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;Writing and distribution of press releases&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Organising of media tours&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Monitor media coverage&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;Hosting press conferences&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;Hosting corporate events&lt;/li&gt;&lt;/ul&gt;\n                &lt;/li&gt;\n            &lt;/ul&gt;\n        &lt;/div&gt;\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n    &lt;/div&gt;\n    &lt;hr/&gt;\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\n        &lt;img src=&quot;../../../../Public/Img/GC/whatwedo_pic4.png&quot;&gt;&lt;/img&gt;\n        &lt;div class=&quot;intro-text&quot;&gt;\n            &lt;div class=&quot;intro-title&quot;&gt;Event planning&lt;/div&gt;\n            &lt;p&gt;Hosting activities, conferences, seminars and exhibitions are great ways for target consumers to learn about services and products.  Such events are also able to help brands create positive images and build relations with target customers.  GC helps clients host events from start to finish, providing one stop event planning for all kinds of activities.  From coming up with a theme to event planning, making the budget and locating venues, GC does it all.  GC provides clients with events that are able enhance the reputation of their brands.&lt;/p&gt;\n            &lt;p&gt;GC has a lot of experience in managing events.   It helps clients set-up venues, providing support such as on-stage lightings and sound systems and recruiting MCs and performers.  GC also invites celebrities to be spokesperson for brands or make appearances as guests for conferences and seminars.  GC brings clients unique and refreshing events.&lt;/p&gt;\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\n            &lt;div&gt;&lt;/div&gt;\n            &lt;ul&gt;\n                &lt;li&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Locating venues and providing design and production of venues&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Annual dinners&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Hosting activities and seminars&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Opening ceremonies&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Organise event run-downs&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Exhibitions and road shows&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Media reception and public relations&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Formal receptions&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Production of publications, souvenir and sourcing for supplies for events&lt;/li&gt;&lt;li class=&quot;li-w40&quot;&gt;Catering and transport arrangements for events&lt;/li&gt;&lt;/ul&gt;\n                    &lt;ul&gt;&lt;li class=&quot;li-w60&quot;&gt;Hosting seminars, forums, exhibitions and lectures&lt;/li&gt;&lt;/ul&gt;\n                &lt;/li&gt;\n            &lt;/ul&gt;\n        &lt;/div&gt;\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\n    &lt;/div&gt;\n', 1),
(90004, 'Client List', '&lt;div class=&quot;intro-title clientlist-title&quot;&gt;\r\n	Client List\r\n&lt;/div&gt;\r\n&lt;hr /&gt;\r\n&lt;div class=&quot;clientlist-div&quot;&gt;\r\n	&lt;ul&gt;\r\n		&lt;li&gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo1.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo2.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo3.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo4.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo5.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo6.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo7.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo8.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo9.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo10.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo11.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo12.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;li-w33&quot;&gt;\r\n					&lt;a href=&quot;http://192.168.1.101/gc/admin.php/Pageadmin/add/id/#&quot;&gt;&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/client_logo13.png&quot; /&gt;&lt;/a&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;div style=&quot;clear:both;&quot;&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;', 1),
(90005, 'Contact Us', '&lt;div id=&quot;contact-div&quot;&gt;\r\n	&lt;div class=&quot;intro-title&quot;&gt;\r\n		CONTACT US\r\n	&lt;/div&gt;\r\n	&lt;form name=&quot;contact&quot; action=&quot;#&quot; method=&quot;GET&quot;&gt;\r\n		&lt;table cellspacing=&quot;10&quot;&gt;\r\n			&lt;tbody&gt;\r\n				&lt;tr&gt;\r\n					&lt;td&gt;\r\n						Name:\r\n					&lt;/td&gt;\r\n					&lt;td&gt;\r\n						&lt;input name=&quot;name&quot; type=&quot;text&quot; /&gt;\r\n					&lt;/td&gt;\r\n				&lt;/tr&gt;\r\n				&lt;tr&gt;\r\n					&lt;td&gt;\r\n						Email:\r\n					&lt;/td&gt;\r\n					&lt;td&gt;\r\n						&lt;input name=&quot;email&quot; type=&quot;text&quot; /&gt;\r\n					&lt;/td&gt;\r\n				&lt;/tr&gt;\r\n				&lt;tr&gt;\r\n					&lt;td&gt;\r\n						Phone:\r\n					&lt;/td&gt;\r\n					&lt;td&gt;\r\n						&lt;input name=&quot;phone&quot; type=&quot;text&quot; /&gt;\r\n					&lt;/td&gt;\r\n				&lt;/tr&gt;\r\n				&lt;tr&gt;\r\n					&lt;td&gt;\r\n						Message:\r\n					&lt;/td&gt;\r\n					&lt;td&gt;\r\n						&lt;textarea name=&quot;message&quot; rows=&quot;5&quot; cols=&quot;30&quot;&gt;&lt;/textarea&gt;\r\n					&lt;/td&gt;\r\n				&lt;/tr&gt;\r\n			&lt;/tbody&gt;\r\n		&lt;/table&gt;\r\n	&lt;/form&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;info-div&quot;&gt;\r\n	&lt;table cellspacing=&quot;10&quot;&gt;\r\n		&lt;tbody&gt;\r\n			&lt;tr&gt;\r\n				&lt;td&gt;\r\n					Tel:\r\n				&lt;/td&gt;\r\n				&lt;td&gt;\r\n					2898 8283\r\n				&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n			&lt;tr&gt;\r\n				&lt;td&gt;\r\n					Fax:\r\n				&lt;/td&gt;\r\n				&lt;td&gt;\r\n					3914 6999\r\n				&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n			&lt;tr&gt;\r\n				&lt;td&gt;\r\n					Email:\r\n				&lt;/td&gt;\r\n				&lt;td&gt;\r\n					info@gccomhk.com\r\n				&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n			&lt;tr&gt;\r\n				&lt;td&gt;\r\n					Address:\r\n				&lt;/td&gt;\r\n				&lt;td&gt;\r\n					Rm B10, 1/F, King Yip Factory Bldg, 59 King Yip St., Kwun Tong, Hong Kong\r\n				&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;/tbody&gt;\r\n	&lt;/table&gt;\r\n&lt;img src=&quot;http://192.168.1.101/gc/Public/Img/GC/contact_map.png&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;clear:both;&quot;&gt;\r\n&lt;/div&gt;', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gc_project`
--

CREATE TABLE IF NOT EXISTS `gc_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `preview` varchar(256) NOT NULL,
  `images` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `gc_project`
--

INSERT INTO `gc_project` (`id`, `title`, `cid`, `description`, `preview`, `images`) VALUES
(1, '工程1', 1, '工程1描述', 'Public/Img/GC/brand.jpg', 'Public/Img/GC/brand.jpg|Public/Img/GC/bulb.png|add'),
(2, '工程2', 1, '工程2描述', 'Public/Img/GC/client_logo2.png', 'Public/Img/GC/client_logo1.png|Public/Img/GC/client_logo2.png|Public/Img/GC/client_logo3.png|Public/Img/GC/client_logo4.png|Public/Img/GC/client_logo5.png|Public/Img/GC/client_logo6.png'),
(5, 'TEST2', 2, 'ahaha', 'Public/Img/GC/client_logo12.png', 'Public/Img/GC/client_logo12.png|Public/Img/GC/client_logo11.png|hahahahah'),
(7, 'Project3', 3, 'catagory3test', 'Public/Img/GC/client_logo5.png', 'Public/Img/GC/client_logo5.png');

-- --------------------------------------------------------

--
-- 表的结构 `gc_user`
--

CREATE TABLE IF NOT EXISTS `gc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `login_count` varchar(50) NOT NULL,
  `last_login_time` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nickname` varchar(255) NOT NULL,
  `last_login_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gc_user`
--

INSERT INTO `gc_user` (`id`, `account`, `login_count`, `last_login_time`, `password`, `status`, `nickname`, `last_login_ip`) VALUES
(1, 'admin', '145', '1428730536', 'b59c67bf196a4758191e42f76670ceba', 1, '', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gc_userb`
--

CREATE TABLE IF NOT EXISTS `gc_userb` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `current` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gc_userb`
--

INSERT INTO `gc_userb` (`id`, `user`, `pass`, `created`, `current`, `last`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2012-10-11 08:22:02', '2014-12-23 23:28:41', '2014-11-24 23:32:38');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
