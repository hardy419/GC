-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 04 月 10 日 02:08
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `gc_banner`
--

INSERT INTO `gc_banner` (`id`, `title`, `sid`, `url`) VALUES
(1, 'Banner for who we are page', 90002, 'Public/Img/GC/banner_whoweare.png'),
(2, 'Banner for what we do page', 90003, 'Public/Img/GC/banner_whatwedo.png'),
(3, 'Banner for client list page', 90004, 'Public/Img/GC/banner_clientlist.png'),
(4, 'Banner for contact us', 90005, 'Public/Img/GC/banner_contactus.png'),
(5, 'Banner for test page id#2', 2, 'Public/Img/GC/banner_clientlist.png'),
(23, 'Banner for test page#4', 4, 'Public/Img/GC/201405.png '),
(24, 'test', 3, 'Public/Img/GC/client_logo6.png'),
(25, 'wedgfwe', 99, 'qwdeqw');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gc_page`
--

INSERT INTO `gc_page` (`id`, `title`, `content`, `status`) VALUES
(1, '教學理念1', '&lt;div class=&quot;text&quot;&gt;\n	&lt;p&gt;\n		爸爸媽媽為甚麼要讓小朋友去學「畫畫」呢？\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		為了訓練子女多角度思考？培養他們的藝術美感？增強他們的表達能力及自信心？訓練他們的小肌肉？為學校的功課做準備？……\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		若我們以小朋友的角度去看，會發現他們大部份都喜歡接觸色彩；喜愛用顏色去描繪所看見的事物；會滿心歡喜的與家人分享自己的畫作；喜歡將畫中的得意故事向老師同學一一道來。每一個作品，對小孩來說，就像一本圖冊，有說不完的故事。但很多時候，父母會忽略了子女的聲音，著眼點只放在作品上。\n	&lt;/p&gt;\n&lt;br /&gt;\n	&lt;p&gt;\n		有家長會問：「我的孩子很喜歡畫畫，很有天份，可不可以儘早教他深一點的繪畫技巧？」可能父母會認為，小朋友的畫只要畫得真，能夠在畫中運用所學的技巧，就可以畫出一幅好畫。但我們覺得，畫得真，畫得有技巧，但裡面沒有小朋友的感受，沒有小朋友的故事，沒有小朋友的靈魂，那麼繪畫只會變成空洞的東西。\n	&lt;/p&gt;\n&lt;/div&gt;\n&lt;h4&gt;\n	我們的信念是 ─ 繪畫對小朋友的價值，不止限於美與不美，繪畫是他們表達感受的溝通媒介，是健康成長的好伙伴。\n&lt;/h4&gt;\n&lt;div class=&quot;leftColumn&quot;&gt;\n	&lt;div class=&quot;text&quot;&gt;\n		&lt;p&gt;\n			藝術創作並不孤獨，它可以令關係密切的人更加了解對方；它可以令不相識的人惺惺相惜。當看見小朋友拿著起自己的創作，面露滿足的笑容，或者興奮得手舞足蹈，藝術的力量已超出作品本身，它讓我們感受到小朋友的情緒，它讓我們觸碰小小生命的靈魂。父母有時會想，怎樣與子女溝通，但原來在視覺藝術世界中，小孩已經不知不覺與大人們說話了。\n		&lt;/p&gt;\n		&lt;p&gt;\n			所以，父母及老師擔當的角色，並不只教導，而是陪在小朋友左右，用心去引發他們、鼓勵他們、聆聽他們，從中引發他們對藝術的興趣，鼓勵他們作多方面的嘗試。讓他們相信利用自己的小手掌，都可以發揮出大力量；聆聽他們的分享，進入幼小的內心世界，變為子女成長路上的知心友。\n		&lt;/p&gt;\n	&lt;/div&gt;\n	&lt;h4&gt;\n		擁有靈魂及個人風格的作品，才是最感動人及富有藝術價值。\n	&lt;/h4&gt;\n	&lt;div class=&quot;text&quot;&gt;\n		只要用「心」創造， 繪畫必定是最「美」的。就讓我們一起陪伴可愛的小孩，啟發他們、鼓勵他們，以自己的力量完成腦海中的意念，在藝術創作的路上快樂成長。\n	&lt;/div&gt;\n&lt;/div&gt;\n&lt;div class=&quot;rightColumn&quot;&gt;\n	&lt;img src=&quot;http://localhost/vkids/Public/Img/Idea/idea.jpg&quot; /&gt; \n&lt;/div&gt;', 1),
(2, '1234', '&lt;p&gt;\r\n	&amp;lt;h1&amp;gt;ahahahaha...&amp;lt;/h1&amp;gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;lt;p&amp;gt;hahahahahahahahahahah&amp;lt;/p&amp;gt;\r\n&lt;/p&gt;', 1),
(3, 'test', '&lt;h1&gt;Hardy&lt;/h1&gt;\r\n&lt;p&gt;Test..&lt;/p&gt;\r\n', 1),
(4, 'test2', '1234', 1),
(5, 'test3', '&amp;lt;b&amp;gt;test3&amp;lt;/b&amp;gt;', 1),
(6, 'test4', '1q2wrqwe3frq2w3r', 1);

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
(1, 'admin', '138', '1428631604', 'b59c67bf196a4758191e42f76670ceba', 1, '', '127.0.0.1');

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
