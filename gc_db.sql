-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 04 月 13 日 08:15
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
DROP DATABASE IF EXISTS `gc_db`;
CREATE DATABASE `gc_db`;
USE `gc_db`;

-- --------------------------------------------------------

--
-- 表的结构 `gc_banner`
--

CREATE TABLE IF NOT EXISTS `gc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sid` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `gc_banner`
--

INSERT INTO `gc_banner` (`id`, `title`, `sid`, `url`) VALUES
(1, 'Banner for home page 1', 80001, 'Public/Img/GC/banners/banner1.jpg'),
(2, 'Banner for home page 2', 80002, 'Public/Img/GC/banners/banner2.jpg'),
(3, 'Banner for home page 3', 80003, 'Public/Img/GC/banners/banner3.jpg'),
(4, 'Banner for home page 4', 80004, 'Public/Img/GC/banners/banner1.jpg'),
(5, 'Banner for home page 5', 80005, 'Public/Img/GC/banners/banner2.jpg'),
(6, 'Banner for page "who we are"', 4, 'Public/Img/GC/banners/banner_whoweare.png'),
(7, 'Banner for page "what we do"', 3, 'Public/Img/GC/banners/banner_whatwedo.png'),
(8, 'Banner for page "client list"', 2, 'Public/Img/GC/banners/banner_clientlist.png'),
(9, 'Banner for page "contact us"', 1, 'Public/Img/GC/banners/banner_contactus.png');

-- --------------------------------------------------------

--
-- 表的结构 `gc_catagory`
--

CREATE TABLE IF NOT EXISTS `gc_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `type` enum('項目','備用1','備用2') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `gc_page`
--

INSERT INTO `gc_page` (`id`, `title`, `content`, `status`) VALUES
(1, 'Contact Us', '    &lt;style&gt;\r\n    ul {padding:0px;}\r\n\r\n    .intro-title {border-left: 8px solid rgb(254,168,21); padding-left:7px; font-size:24px; font-weight:800; color:#646464;}\r\n\r\n    #contact-div {float:left; width:48%; margin-left:8px;}\r\n    #contact-div .intro-title {margin-bottom:30px;}\r\n    #contact-div tr {margin-bottom:20px;}\r\n    #contact-div tr td {font-size:16px; font-style:italic; color:#323232; font-weight:300; vertical-align:top;}\r\n    #contact-div tr td:first-child {width:20%;}\r\n    #contact-div tr td:last-child {width:80%;}\r\n\r\n    #info-div  {float:right; width:460px; border-left: 2px solid rgb(254,168,21); padding-left:60px;}\r\n    #info-div p {font-size:16px; font-style:italic; color:#323232; font-weight:300; margin:5px auto;}\r\n    #info-div img {margin-top:20px;}\r\n    &lt;/style&gt;\r\n\r\n    &lt;div id=&quot;contact-div&quot;&gt;\r\n        &lt;div class=&quot;intro-title&quot;&gt;CONTACT US&lt;/div&gt;\r\n        &lt;form name=&quot;contact&quot; action=&quot;#&quot; method=&quot;GET&quot;&gt;\r\n            &lt;table cellspacing=&quot;10&quot;&gt;\r\n                &lt;tr&gt;&lt;td&gt;Name:&lt;/td&gt;&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;name&quot;&gt;&lt;/input&gt;&lt;/td&gt;&lt;/tr&gt;\r\n                &lt;tr&gt;&lt;td&gt;Email:&lt;/td&gt;&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;email&quot;&gt;&lt;/input&gt;&lt;/td&gt;&lt;/tr&gt;\r\n                &lt;tr&gt;&lt;td&gt;Phone:&lt;/td&gt;&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;phone&quot;&gt;&lt;/input&gt;&lt;/td&gt;&lt;/tr&gt;\r\n                &lt;tr&gt;&lt;td&gt;Message:&lt;/td&gt;&lt;td&gt;&lt;textarea name=&quot;message&quot; rows=&quot;6&quot; cols=&quot;35&quot;&gt;&lt;/textarea&gt;&lt;/td&gt;&lt;/tr&gt;\r\n            &lt;/table&gt;\r\n        &lt;/form&gt;\r\n    &lt;/div&gt;\r\n    &lt;div id=&quot;info-div&quot;&gt;\r\n        &lt;p&gt;Tel  :  2898 8283&lt;/p&gt;\r\n        &lt;p&gt;Fax  :  3914 6999&lt;/p&gt;\r\n        &lt;p&gt;Email  :  info@gccomhk.com&lt;/p&gt;\r\n        &lt;p&gt;Address  :  Rm B10, 1/F, King Yip Factory Bldg, 59 King Yip St., Kwun Tong, Hong Kong&lt;/p&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/contact_map.png&quot;&gt;&lt;/img&gt;\r\n    &lt;/div&gt;\r\n    &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n', 1),
(2, 'Client List', '    &lt;style&gt;\r\n    ul {padding:0px;}\r\n\r\n    #clientlist-container {width:810px;margin:40px auto 50px;}\r\n    .intro-title {border-left: 8px solid rgb(254,168,21); padding-left:7px; font-size:24px; font-weight:800; color:#646464;}\r\n    .clientlist-title {}\r\n    .clientlist-div ul {list-style: outside none none;}\r\n    .clientlist-div ul li ul {clear:both;}\r\n    .clientlist-div ul li ul li {float:left;}\r\n    .li-w33 {width:33%;}\r\n    &lt;/style&gt;\r\n\r\n    &lt;div id=&quot;clientlist-container&quot;&gt;\r\n        &lt;div class=&quot;intro-title clientlist-title&quot;&gt;Client List&lt;/div&gt;\r\n        &lt;hr/&gt;\r\n        &lt;div class=&quot;clientlist-div&quot;&gt;\r\n            &lt;ul&gt;\r\n                &lt;li&gt;\r\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo1.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo2.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo3.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo4.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo5.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo6.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo7.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo8.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo9.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo10.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo11.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo12.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li class=&quot;li-w33&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;/gc/Public/Img/GC/client_logo13.png&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\r\n                &lt;/li&gt;\r\n            &lt;/ul&gt;\r\n            &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n', 1),
(3, 'What We Do', '    &lt;style&gt;\r\n    ul {padding:0px;}\r\n\r\n    .intro-title {border-left: 8px solid rgb(254,168,21); padding-left:7px; font-size:24px; font-weight:800; color:#646464;}\r\n\r\n    .detail-title {font-style:italic; font-size:18px; color:#484848; font-weight:400; margin:20px auto 10px 16px;}\r\n\r\n    .whatwedo-intro {margin:40px auto 40px;}\r\n    .whatwedo-intro&gt;img {float:left; width:150px;}\r\n    .whatwedo-intro li {margin:4px 0px;}\r\n    .intro-text {float:left; width:830px; margin-left:20px;}\r\n    .intro-text p {margin-left:16px; text-align:justify;line-height:1.2;}\r\n    .detail-title+div+ul {list-style: outside none none;}\r\n    .detail-title+div+ul li ul {list-style:none outside url(''/gc/Public/Img/GC/list_style_image.png''); clear:both;}\r\n    .detail-title+div+ul li ul li {float:left; font-size:12px; position:relative; left:16px;}\r\n    &lt;/style&gt;\r\n\r\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/whatwedo_pic1.png&quot;&gt;&lt;/img&gt;\r\n        &lt;div class=&quot;intro-text&quot;&gt;\r\n            &lt;div class=&quot;intro-title&quot;&gt;Marketing and branding communications&lt;/div&gt;\r\n            &lt;p&gt;The keys to success in marketing are having strong brand awareness and a good reputation.  Effective marketing strategies are able to put brands and products under the spotlights and build consumer’s loyalty.  Having brands become sponsors of large- scale events is one of the strategies to enhance image of the brand.  GC helps clients identify the best opportunity to place sponsorships according to the nature of their business and market positioning.  With careful planning and the employment of promotion strategies, we pledged to provide the most cost-effective and special marketing campaign for clients.&lt;/p&gt;\r\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\r\n            &lt;div&gt;&lt;/div&gt;\r\n            &lt;ul&gt;\r\n                &lt;li&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:33%&quot;&gt;Marketing communications&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Hosting press conferences&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Brand crossover and sponsorships&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:33%&quot;&gt;Branding strategies&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Brand promotion and new product launch&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Production of promotion materials&lt;/li&gt;&lt;/ul&gt;\r\n                &lt;/li&gt;\r\n            &lt;/ul&gt;\r\n        &lt;/div&gt;\r\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;hr/&gt;\r\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/whatwedo_pic2.png&quot;&gt;&lt;/img&gt;\r\n        &lt;div class=&quot;intro-text&quot;&gt;\r\n            &lt;div class=&quot;intro-title&quot;&gt;Digital and social media marketing&lt;/div&gt;\r\n            &lt;p&gt;In today’s information age, making use of the internet, social media and mobile devices for marketing purposes is a growing trend.  GC has a team of digital marketing veterans who knows the online world inside out and are capable communicator and innovators in the digital world.  GC tailor-made social media promotion strategies for clients.  Through online forums, social media groups and bloggers, GC ensures client’s marketing messages reach the target audience in the most-cost-effective way, helping brands enhance their popularity.&lt;/p&gt;\r\n            &lt;p&gt;GC also monitors what is being said on social media about clients.  Through analysing these data, GC is able to come up with the best marketing strategies to help clients build and enhance market share.&lt;/p&gt;\r\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\r\n            &lt;div&gt;&lt;/div&gt;\r\n            &lt;ul&gt;\r\n                &lt;li&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:66%&quot;&gt;Promotion on social media&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Blogger outreach&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:66%&quot;&gt;Design and promotion strategies for product placement in online advertisement&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Social media and online advertising&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:66%&quot;&gt;Planning for interactive online promotion activities&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Social media research and monitoring&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:66%&quot;&gt;Corporate website design, website content development and updates&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Social media management&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:66%&quot;&gt;Digital marketing strategies&lt;/li&gt;&lt;li style=&quot;width:33%&quot;&gt;Gathering market updates and giving analysis&lt;/li&gt;&lt;/ul&gt;\r\n                &lt;/li&gt;\r\n            &lt;/ul&gt;\r\n        &lt;/div&gt;\r\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;hr/&gt;\r\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/whatwedo_pic3.png&quot;&gt;&lt;/img&gt;\r\n        &lt;div class=&quot;intro-text&quot;&gt;\r\n            &lt;div class=&quot;intro-title&quot;&gt;Media relations&lt;/div&gt;\r\n            &lt;p&gt;Giving media interviews and getting media coverage is the best way for brands and corporate to build reputation and boost brand awareness.  GC is familiar with the operation of traditional and online media.  It has close relationship with local media including newspaper, magazine, radio stations, television stations and news agencies, helping clients build trust among media and gain positive coverage.&lt;/p&gt;\r\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\r\n            &lt;div&gt;&lt;/div&gt;\r\n            &lt;ul&gt;\r\n                &lt;li&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:33%&quot;&gt;Arranging media interviews&lt;/li&gt;&lt;li style=&quot;width:42%&quot;&gt;Market positioning and indentifying news angles&lt;/li&gt;&lt;li style=&quot;width:25%&quot;&gt;Hosting media gatherings&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:33%&quot;&gt;Writing and distribution of press releases&lt;/li&gt;&lt;li style=&quot;width:42%&quot;&gt;Organising of media tours&lt;/li&gt;&lt;li style=&quot;width:25%&quot;&gt;Monitor media coverage&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:33%&quot;&gt;Hosting press conferences&lt;/li&gt;&lt;li style=&quot;width:42%&quot;&gt;Hosting corporate events&lt;/li&gt;&lt;/ul&gt;\r\n                &lt;/li&gt;\r\n            &lt;/ul&gt;\r\n        &lt;/div&gt;\r\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;hr/&gt;\r\n    &lt;div class=&quot;whatwedo-intro&quot;&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/whatwedo_pic4.png&quot;&gt;&lt;/img&gt;\r\n        &lt;div class=&quot;intro-text&quot;&gt;\r\n            &lt;div class=&quot;intro-title&quot;&gt;Event planning&lt;/div&gt;\r\n            &lt;p&gt;Hosting activities, conferences, seminars and exhibitions are great ways for target consumers to learn about services and products.  Such events are also able to help brands create positive images and build relations with target customers.  GC helps clients host events from start to finish, providing one stop event planning for all kinds of activities.  From coming up with a theme to event planning, making the budget and locating venues, GC does it all.  GC provides clients with events that are able enhance the reputation of their brands.&lt;/p&gt;\r\n            &lt;p&gt;GC has a lot of experience in managing events.   It helps clients set-up venues, providing support such as on-stage lightings and sound systems and recruiting MCs and performers.  GC also invites celebrities to be spokesperson for brands or make appearances as guests for conferences and seminars.  GC brings clients unique and refreshing events.&lt;/p&gt;\r\n            &lt;div class=&quot;detail-title&quot;&gt;List of services provided by GC&lt;/div&gt;\r\n            &lt;div&gt;&lt;/div&gt;\r\n            &lt;ul&gt;\r\n                &lt;li&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Locating venues and providing design and production of venues&lt;/li&gt;&lt;li style=&quot;width:48%&quot;&gt;Annual dinners&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Hosting activities and seminars&lt;/li&gt;&lt;li style=&quot;width:48%&quot;&gt;Opening ceremonies&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Organise event run-downs&lt;/li&gt;&lt;li style=&quot;width:48%&quot;&gt;Exhibitions and road shows&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Media reception and public relations&lt;/li&gt;&lt;li style=&quot;width:48%&quot;&gt;Formal receptions&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Production of publications, souvenir and sourcing for supplies for events&lt;/li&gt;&lt;li style=&quot;width:48%&quot;&gt;Catering and transport arrangements for events&lt;/li&gt;&lt;/ul&gt;\r\n                    &lt;ul&gt;&lt;li style=&quot;width:52%&quot;&gt;Hosting seminars, forums, exhibitions and lectures&lt;/li&gt;&lt;/ul&gt;\r\n                &lt;/li&gt;\r\n            &lt;/ul&gt;\r\n        &lt;/div&gt;\r\n        &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n    &lt;/div&gt;\r\n', 1),
(4, 'Who We Are', '    &lt;style&gt;\r\n    ul {padding:0px;}\r\n\r\n    .intro-title {border-left: 8px solid rgb(254,168,21); padding-left:7px; font-size:24px; font-weight:800; color:#646464;}\r\n    #intro img {float:left; margin:30px 20px 20px 0px;}\r\n    #intro-text {float:left; width:720px; margin:30px 0px 20px 0px;}\r\n    #intro-text p {position:relative; left:16px; text-align:justify;line-height:1.2;}\r\n\r\n    #details {}\r\n    #details&gt;ul {list-style: outside none none;}\r\n    #details&gt;ul&gt;li {margin-bottom:20px;}\r\n    .detail-title {font-style:italic; font-size:18px; color:#484848; font-weight:400; margin:20px auto 10px 16px;}\r\n    .detail-li-left {width:30%;}\r\n    .detail-li-middle {width:36%;}\r\n    .detail-li-right {width:30%;}\r\n    .detail-li-left,.detail-li-middle {float:left;}\r\n    .detail-li-right {float:right;}\r\n    .detail-title+ul {list-style:none outside url(''/gc/Public/Img/GC/list_style_image.png'');}\r\n    .detail-title+ul li {font-size:13px; font-weight:300; margin:10px 0px 0px 0px; position:relative; left:16px;}\r\n    .detail-title+ul li ul {clear:both;}\r\n    .detail-title+ul li ul li {float:left;}\r\n    &lt;/style&gt;\r\n\r\n    &lt;div id=&quot;intro&quot;&gt;\r\n        &lt;img src=&quot;/gc/Public/Img/GC/bulb.png&quot;&gt;&lt;/img&gt;\r\n        &lt;div id=&quot;intro-text&quot;&gt;\r\n            &lt;div class=&quot;intro-title&quot;&gt;WHO WE ARE&lt;/div&gt;\r\n            &lt;p&gt;GC is a public relations firm that provides marketing solution for corporate and clients.  Our scope of service include corporate communication, event planning, media relations and social media marketing etc.  We pledge to provide all-rounded public relations services.&lt;/p&gt;\r\n            &lt;p&gt;GC is committed to providing the best for clients, we listen attentively to their needs and provide the best solutions that are within the client’s budget.  Clients can count on us to come up with the most effective marketing campaign and communication strategies to help them boost sales and arouse brand awareness.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;hr style=&quot;clear:both&quot; /&gt;\r\n    &lt;div id=&quot;details&quot;&gt;\r\n        &lt;ul&gt;\r\n            &lt;li class=&quot;detail-li-left&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;GC’s scope of service&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Marketing and brand communications&lt;/li&gt;\r\n                    &lt;li&gt;Marketing communications&lt;/li&gt;\r\n                    &lt;li&gt;Branding strategies&lt;/li&gt;\r\n                    &lt;li&gt;Hosting press conferences&lt;/li&gt;\r\n                    &lt;li&gt;Brand promotion and new product launch&lt;/li&gt;\r\n                    &lt;li&gt;Brand crossover and sponsorships&lt;/li&gt;\r\n                    &lt;li&gt;Production of promotion materials&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;li class=&quot;detail-li-middle&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;Digital and social media marketing&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Promotion on social media&lt;/li&gt;\r\n                    &lt;li&gt;Design and promotion strategies for product placement in online advertisement&lt;/li&gt;\r\n                    &lt;li&gt;Planning for interactive online promotion activities&lt;/li&gt;\r\n                    &lt;li&gt;Corporate website design, website content development and updates&lt;/li&gt;\r\n                    &lt;li&gt;Digital marketing strategies&lt;/li&gt;\r\n                    &lt;li&gt;Blogger outreach&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;li class=&quot;detail-li-right&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Social media and online advertising&lt;/li&gt;\r\n                    &lt;li&gt;Social media research and monitoring&lt;/li&gt;\r\n                    &lt;li&gt;Social media management&lt;/li&gt;\r\n                    &lt;li&gt;Gathering market updates and giving analysis&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n            &lt;li class=&quot;detail-li-left&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;Media relations&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Arranging media interviews&lt;/li&gt;\r\n                    &lt;li&gt;Writing and distribution of press releases&lt;/li&gt;\r\n                    &lt;li&gt;Hosting press conferences&lt;/li&gt;\r\n                    &lt;li&gt;Market positioning and indentifying news angles&lt;/li&gt;\r\n                    &lt;li&gt;Organising of media tours&lt;/li&gt;\r\n                    &lt;li&gt;Hosting corporate events&lt;/li&gt;\r\n                    &lt;li&gt;Hosting media gatherings&lt;/li&gt;\r\n                    &lt;li&gt;Monitor media coverage&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;li class=&quot;detail-li-middle&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;Event planning&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Locating venues and providing design and production of venues&lt;/li&gt;\r\n                    &lt;li&gt;Hosting activities and seminars&lt;/li&gt;\r\n                    &lt;li&gt;Organise event run-downs&lt;/li&gt;\r\n                    &lt;li&gt;Media reception and public relations&lt;/li&gt;\r\n                    &lt;li&gt;Production of publications, souvenir and sourcing for supplies for events&lt;/li&gt;\r\n                    &lt;li&gt;Hosting seminars, forums, exhibitions and lectures&lt;/li&gt;\r\n                    &lt;li&gt;Annual dinners&lt;/li&gt;\r\n                    &lt;li&gt;Opening ceremonies&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;li class=&quot;detail-li-right&quot;&gt;\r\n                &lt;div class=&quot;detail-title&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;Exhibitions and road shows&lt;/li&gt;\r\n                    &lt;li&gt;Formal receptions&lt;/li&gt;\r\n                    &lt;li&gt;Catering and transport arrangements for events&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/li&gt;\r\n            &lt;div style=&quot;clear:both;&quot;&gt;&lt;/div&gt;\r\n        &lt;/ul&gt;\r\n    &lt;/div&gt;\r\n', 1);

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
(1, 'admin', '148', '1428904755', 'b59c67bf196a4758191e42f76670ceba', 1, '', '127.0.0.1');

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
