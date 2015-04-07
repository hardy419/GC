-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 04 月 03 日 07:27
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vkids_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `vk_bannerlist`
--

CREATE TABLE IF NOT EXISTS `vk_bannerlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pic` varchar(60) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tag` varchar(60) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `vk_bannerlist`
--

INSERT INTO `vk_bannerlist` (`id`, `title`, `pic`, `sid`, `created`, `link`, `tag`, `type`) VALUES
(10, 'banner-8', '/bannerlist/20150206/b_54d48c566198f.jpg', 5, 0, '', '', 'banner'),
(11, 'banner-9', '/bannerlist/20150206/b_54d48c6e0bd5b.jpg', 4, 0, '', '', 'banner'),
(12, 'banner-10', '/bannerlist/20150206/b_54d48c7e715e8.jpg', 3, 0, '', '', 'banner'),
(13, 'banner-11', '/bannerlist/20150206/b_54d48c8ee93c0.jpg', 2, 0, '', '', 'banner'),
(14, 'banner-12', '/bannerlist/20150206/b_54d48c97981e5.jpg', 1, 0, '', '', 'banner'),
(15, 'banner-1', '/bannerlist/20150211/b_54daed081daf1.jpg', 1, 0, '', '', 'about'),
(16, 'banner-2', '/bannerlist/20150211/b_54daed20b29e0.jpg', 2, 0, '', '', 'about'),
(17, 'banner-3', '/bannerlist/20150211/b_54daedec458a6.jpg', 17, 0, '', '', 'about'),
(18, 'banner-4', '/bannerlist/20150211/b_54daee0adfcaf.jpg', 18, 0, '', '', 'about'),
(19, 'banner-5', '/bannerlist/20150211/b_54daee1b60dc0.jpg', 19, 0, '', '', 'about'),
(20, 'banner-6', '/bannerlist/20150211/b_54daee2d4daba.jpg', 20, 0, '', '', 'about'),
(21, 'banner-7', '/bannerlist/20150211/b_54daee3adcd05.jpg', 21, 0, '', '', 'about'),
(22, '123', '/bannerlist/20150320/b_550bbd152b8ab.png', 22, 0, '', '', 'banner');

-- --------------------------------------------------------

--
-- 表的结构 `vk_childlist`
--

CREATE TABLE IF NOT EXISTS `vk_childlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `pdf` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `orders` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `vk_childlist`
--

INSERT INTO `vk_childlist` (`id`, `title`, `date`, `pdf`, `status`, `orders`) VALUES
(1, '孩子之聲 第一期_001', 1385827200, './Uploads/document/5518be6fb2f78.pdf', 1, 1),
(2, '孩子之聲 第一期_002', 1385827200, './Uploads/document/5518bfd25a2f6.pdf', 1, 2),
(3, '孩子之聲 第二期_001', 1393603200, './Uploads/document/5518c06b6e7a3.pdf', 1, 3),
(4, '孩子之聲 第二期_002', 1393603200, './Uploads/document/5518c187f03d9.pdf', 1, 4),
(5, '孩子之聲 第三期_001', 1401552000, './Uploads/document/5518c0a1b2353.pdf', 1, 5),
(6, '孩子之聲 第三期_002', 1401552000, './Uploads/document/5518c0c6a115b.pdf', 1, 6),
(7, '孩子之聲 第四期_001', 1409500800, './Uploads/document/5518c0df5d07b.pdf', 1, 7),
(8, '孩子之聲 第四期_002', 1409500800, './Uploads/document/5518c0f2aaf09.pdf', 1, 8);

-- --------------------------------------------------------

--
-- 表的结构 `vk_content`
--

CREATE TABLE IF NOT EXISTS `vk_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_cn` text CHARACTER SET utf8 NOT NULL,
  `content_tw` text CHARACTER SET utf8 NOT NULL,
  `content_en` text CHARACTER SET utf8 NOT NULL,
  `pic` varchar(60) CHARACTER SET utf8 NOT NULL,
  `created` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `vk_cooplist`
--

CREATE TABLE IF NOT EXISTS `vk_cooplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date` varchar(255) NOT NULL,
  `sid` int(11) DEFAULT '0',
  `pid` int(11) DEFAULT '0',
  `pdf` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `vk_cooplist`
--

INSERT INTO `vk_cooplist` (`id`, `title`, `content`, `status`, `date`, `sid`, `pid`, `pdf`) VALUES
(1, '嘉年華藝術創作攤位-與九龍英基小學合作', '&lt;p&gt;\r\n	今次活動我們兩點水工作室於九龍英基小學開放日嘉年華擺設了藝術創作攤位,看看以下的照片,便知道當天熱鬧的情況。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	此外, 我們感謝九龍英基小學的邀請, 讓我們與孩子們渡過一個開心的週末!\r\n&lt;/p&gt;', 1, '1426262400', 0, 0, ''),
(2, '24.01.2015-19.02.2015 利是封義賣活動-與Angles for Orphans合辦', '&lt;p&gt;\r\n	是次義賣活動我們與慈善機構Angles for Orphans合作, 我們將學生設計的多款利是封作義賣，並將行動的收益捐給峇里島和柬埔寨有需要的孩子,希望將利是代表的祝福傳給當地孩子. 我們在 此感謝各位捐款人士的支持, 亦感謝Angles for Orphans 讓我們有機會幫助峇里島和柬埔寨有需要的孩子.\r\n&lt;/p&gt;', 1, '1427644800', 0, 0, ''),
(3, '24-25.02.2015 春之頌日營-與朗研社, 奧褔兒童音樂及思卓言語及吞嚥治療中心合辦', '是次活動我們與3間隸屬於不同專業範疇(嬰幼兒教育, 音樂及言語發展)的機構合作舉辦以春天為主題的日營, 讓孩子們 透過 多元化遊戲活動渡過一個充實愉快的春節假期 .&lt;br /&gt;\r\n我們在此感謝朗研社的劉琼玉姑娘, 促成是次4間機構的合作, 亦感謝奧褔兒童音樂及思卓言語及吞嚥治療中心的導師們, 你們所構思的活動令我們大開眼界, 亦令日營生色不少!', 1, '1427731200', 0, 0, ''),
(4, '7.09.2014, 21.09.2014, 5.10.2014 ,19.10.2014 親子教育工作坊-與朗研社合辦', '&lt;p&gt;\r\n	是次活動我們首次與具多年豐富嬰幼兒教育經驗的機構-朗研社合辦兩個月為期四次的親子教育工作坊,透過原創故事分享, 手工藝製作及多元化的主題講座, 讓爸爸媽媽認清孩子的需要, 讓孩子認識藝術之美..\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n另外,我們在此感謝朗研社的劉琼玉姑娘, 讓我們首次能與對外機構合作舉辦教育工作坊, 寄望我們未來會有更多的合作!', 1, '1427731200', 0, 0, ''),
(5, '09.2014 到校畫班-與文娜雅拔幼稚園合辦', '現於每個星期六早上, 我們兩點水工作室的姐姐們均會與文娜雅拔幼稚園的小朋友一同享受創作藝術的樂趣, 讓他們渡過一個快樂的上午!', 1, '1427731200', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `vk_coopphotoslist`
--

CREATE TABLE IF NOT EXISTS `vk_coopphotoslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `sid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pid` int(11) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- 转存表中的数据 `vk_coopphotoslist`
--

INSERT INTO `vk_coopphotoslist` (`id`, `title`, `pic`, `sid`, `status`, `pid`, `date`) VALUES
(1, '小朋友當日都把自己喜愛的元素加在油畫板上', '/coopphoto/20150331/551a09f4dde12.jpg', 4, 1, 1, 1427770808),
(2, '', '/coopphoto/20150331/551a0a1adf371.jpg', 5, 1, 1, 1427770815),
(3, '', '/coopphoto/20150331/551a0a1ccb0ea.jpg', 6, 1, 1, 1427770829),
(4, '', '/coopphoto/20150331/551a0a1fcfc3d.jpg', 7, 1, 1, 1427770848),
(5, '', '/coopphoto/20150331/551a0a351294d.jpg', 1, 1, 1, 1427770782),
(6, '在油畫板後綁上絲帶 , 便成了一個別緻的小掛飾便,小朋友很喜歡呢 !', '/coopphoto/20150331/551a0a3768965.jpg', 3, 1, 1, 1427770799),
(7, '', '/coopphoto/20150331/551a0a398f728.jpg', 2, 1, 1, 1427770789),
(8, '', '/coopphoto/20150331/551a0a3c02b90.jpg', 10, 1, 1, 1427770884),
(9, '', '/coopphoto/20150331/551a0a44890ab.jpg', 9, 1, 1, 0),
(10, '', '/coopphoto/20150331/551a0a4a85e8e.jpg', 9, 1, 1, 1427770874),
(11, '這是我們當日的藝術創作攤位 , Vivia姐還與在場來賓合照呢 !', '/coopphoto/20150331/551a0a4dd2352.jpg', 8, 1, 1, 1427770862),
(12, '', '/coopphoto/20150331/551a1933cdee9.jpg', 12, 1, 2, 0),
(13, '', '/coopphoto/20150331/551a41ea91cc8.jpg', 13, 1, 3, 0),
(14, '', '/coopphoto/20150331/551a41eeb6fc5.jpg', 14, 1, 3, 0),
(15, '為配合是次活動主題, 我們讓孩子們做一頂屬於自己的動物帽子, 迎接春天的來臨.看看孩子們都很投入聆聽Stephen哥哥同Vivian姐姐的講解啊!', '/coopphoto/20150331/551a41f0b2743.jpg', 15, 1, 3, 0),
(16, '', '/coopphoto/20150331/551a421b472c2.jpg', 16, 1, 3, 0),
(17, '其餘導師們也很落力呢!', '/coopphoto/20150331/551a422a7c7e2.jpg', 17, 1, 3, 0),
(18, '帽子還未完成, 柏儀已急不及待戴上了!', '/coopphoto/20150331/551a42462fc4e.jpg', 18, 1, 3, 0),
(19, '大功告成了! 戴上動物帽子的孩子們很可愛啊!', '/coopphoto/20150331/551a42a084ca6.jpg', 19, 1, 3, 0),
(20, '大功告成了! 戴上動物帽子的孩子們很可愛啊!', '/coopphoto/20150331/551a42cda051e.jpg', 20, 1, 3, 0),
(21, '大功告成了! 戴上動物帽子的孩子們很可愛啊!', '/coopphoto/20150331/551a430e86155.jpg', 21, 1, 3, 0),
(22, '大功告成了! 戴上動物帽子的孩子們很可愛啊!', '/coopphoto/20150331/551a431119bc3.jpg', 22, 1, 3, 0),
(23, '最後導師和孩子們還一起戴上動物帽子玩音樂呢!', '/coopphoto/20150331/551a4339dedf1.jpg', 23, 1, 3, 0),
(24, '最後導師和孩子們還一起戴上動物帽子玩音樂呢!', '/coopphoto/20150331/551a433e8e259.jpg', 24, 1, 3, 0),
(25, 'C:\\Users\\Support\\Desktop\\資料夾\\20150328\\VkidS Creative 網頁-對外合作 (7.09.2014, 21.09.2014, 5.10.2014 ,19.10.2014 親子教育工作坊-與朗研社合辦)-[1) 7.09.2014-中秋節.慶團圓]‏', '/coopphoto/20150331/551a43ebd9ccb.jpg', 25, 1, 4, 0),
(26, 'Stephen哥哥先向爸爸媽媽和孩子們分享他創作的中秋節故事', '/coopphoto/20150331/551a43faa164a.jpg', 26, 1, 4, 0),
(27, '故事分享完後, 爸爸/媽媽和孩子們便聆聽Vivian姐姐指示, 做一個音樂轉轉蜜蜂燈籠', '/coopphoto/20150331/551a440a249f0.jpg', 27, 1, 4, 0),
(28, '看看!小朋友同大人們多投入!', '/coopphoto/20150331/551a4420335fb.jpg', 28, 1, 4, 0),
(29, '看看!小朋友同大人們多投入!', '/coopphoto/20150331/551a442e7a1aa.jpg', 29, 1, 4, 0),
(30, '看看!小朋友同大人們多投入!', '/coopphoto/20150331/551a4437b2203.jpg', 30, 1, 4, 0),
(31, '小男孩:我想要蜜蜂的身體是紅色', '/coopphoto/20150331/551a444723f10.jpg', 31, 1, 4, 0),
(32, '另邊廂, 爸爸/媽媽好專心聽朗研社的姑娘講解', '/coopphoto/20150331/551a445a14f87.jpg', 32, 1, 4, 0),
(33, '轉眼間, 一個個音樂轉轉蜜蜂燈籠誕生啦! 相信他們今個中秋節一定過得好開心!', '/coopphoto/20150331/551a44702dfd3.jpg', 33, 1, 4, 0),
(34, '轉眼間, 一個個音樂轉轉蜜蜂燈籠誕生啦! 相信他們今個中秋節一定過得好開心!', '/coopphoto/20150331/551a4481b6c39.jpg', 34, 1, 4, 0),
(35, '今次活動 Stephen哥哥分享了一個小朋友很喜歡穿爸爸鞋子的故事,相信大人和小朋友們童年時都有此經歷吧!', '/coopphoto/20150331/551a44b952cb3.jpg', 35, 1, 4, 0),
(36, '又到做 手工藝的時間了, 今次Vivian姐姐教爸爸/媽媽和孩子們做一個拖鞋門牌', '/coopphoto/20150331/551a44c919b2b.jpg', 36, 1, 4, 0),
(37, '小朋友們:等我選擇我喜歡的絲帶顏色先!', '/coopphoto/20150331/551a44dee36d6.jpg', 37, 1, 4, 0),
(38, '小朋友自己慢慢貼上絲帶在拖鞋上作裝飾, 很用心呢!', '/coopphoto/20150331/551a44ec8df7f.jpg', 38, 1, 4, 0),
(39, '小朋友們在家長的協助下, 為拖鞋上代表自己和爸媽的臉上畫上眼睛, 鼻子和嘴巴, 很溫馨呢!', '/coopphoto/20150331/551a44f9d504a.jpg', 39, 1, 4, 0),
(40, '另一方面, 朗研社的劉琼玉姑娘正向爸爸/媽媽分享小一面試準備與策略', '/coopphoto/20150331/551a45134e2ff.jpg', 40, 1, 4, 1427785056),
(41, '小朋友們的拖鞋門牌快完成了!', '/coopphoto/20150331/551a452d9039e.jpg', 41, 1, 4, 0),
(42, '嘩!完成了! 門牌的造型就好像小孩的腳穿上了爸爸的拖鞋, 很是有趣!', '/coopphoto/20150331/551a453dceabd.jpg', 42, 1, 4, 0),
(43, '嘩!完成了! 門牌的造型就好像小孩的腳穿上了爸爸的拖鞋, 很是有趣!', '/coopphoto/20150331/551a45434cfa3.jpg', 43, 1, 4, 0),
(44, '柏儀和媽完成 門牌後很開心呢!', '/coopphoto/20150331/551a45503c2f2.jpg', 44, 1, 4, 0),
(45, '柏儀和媽完成 門牌後很開心呢!', '/coopphoto/20150331/551a45934c9c7.jpg', 45, 1, 4, 0),
(46, '是次活動 Stephen哥哥分享了一個媽媽的手與孩子之間經歷的故事', '/coopphoto/20150331/551a45a502249.jpg', 46, 1, 4, 0),
(47, '是次活動 Stephen哥哥分享了一個媽媽的手與孩子之間經歷的故事', '/coopphoto/20150331/551a45b1177ca.jpg', 47, 1, 4, 0),
(48, '是次活動 Stephen哥哥分享了一個媽媽的手與孩子之間經歷的故事', '/coopphoto/20150331/551a45bc60d2c.jpg', 48, 1, 4, 0),
(49, '今次手工藝活動很特別 , 我們 先為每個家庭拍上合照', '/coopphoto/20150331/551a45d1746da.jpg', 49, 1, 4, 0),
(50, '今次手工藝活動很特別 , 我們 先為每個家庭拍上合照', '/coopphoto/20150331/551a45d726b4f.jpg', 50, 1, 4, 0),
(51, '今次手工藝活動很特別 , 我們 先為每個家庭拍上合照', '/coopphoto/20150331/551a45dc1d079.jpg', 51, 1, 4, 0),
(52, '爸 媽媽和孩子再將顏料 塗在手 掌上, 再印在彩麗皮手掌上', '/coopphoto/20150331/551a45e77d4de.jpg', 52, 1, 4, 0),
(53, '爸 媽媽和孩子再將顏料 塗在手 掌上, 再印在彩麗皮手掌上', '/coopphoto/20150331/551a45ffa282f.jpg', 53, 1, 4, 0),
(54, '小男孩:我幫媽媽塗手掌', '/coopphoto/20150331/551a4607eb542.jpg', 54, 1, 4, 0),
(55, '一對對大手掌與小手掌, 很可愛', '/coopphoto/20150331/551a4613486fa.jpg', 55, 1, 4, 0),
(56, '經過一回拼拼貼貼後..... 猜猜他們做了什麼?', '/coopphoto/20150331/551a462691817.jpg', 56, 1, 4, 0),
(57, '經過一回拼拼貼貼後..... 猜猜他們做了什麼?', '/coopphoto/20150331/551a462fde42e.jpg', 57, 1, 4, 0),
(58, '經過一回拼拼貼貼後..... 猜猜他們做了什麼?', '/coopphoto/20150331/551a4632f1aad.jpg', 58, 1, 4, 0),
(59, '他們做了一個有爸爸/媽媽和自己手掌的相架呢! 看看! 相架中還有剛才拍的家庭合照呢!', '/coopphoto/20150331/551a463f74833.jpg', 59, 1, 4, 0),
(60, '他們做了一個有爸爸/媽媽和自己手掌的相架呢! 看看! 相架中還有剛才拍的家庭合照呢!', '/coopphoto/20150331/551a4643a1c1b.jpg', 60, 1, 4, 0),
(61, '他們做了一個有爸爸/媽媽和自己手掌的相架呢! 看看! 相架中還有剛才拍的家庭合照呢!', '/coopphoto/20150331/551a464d19209.jpg', 61, 1, 4, 0),
(62, '他們做了一個有爸爸/媽媽和自己手掌的相架呢! 看看! 相架中還有剛才拍的家庭合照呢!', '/coopphoto/20150331/551a46540f313.jpg', 62, 1, 4, 0),
(63, '他們做了一個有爸爸/媽媽和自己手掌的相架呢! 看看! 相架中還有剛才拍的家庭合照呢!', '/coopphoto/20150331/551a465744cd0.jpg', 63, 1, 4, 0),
(64, '今次活動Vivian而今次手工藝是 製作 一個 可裝糖果的烏龜爸盒子 , 以及 BB 龜手偶啊！ 龜手偶啊！', '/coopphoto/20150331/551a46ad96cf7.jpg', 64, 1, 4, 0),
(65, '你看! 爸爸/媽媽和孩子們正在為烏龜爸 的龜殼作 裝飾 呢!', '/coopphoto/20150331/551a46f775dee.jpg', 65, 1, 4, 0),
(66, '你看! 爸爸/媽媽和孩子們正在為烏龜爸 的龜殼作 裝飾 呢!', '/coopphoto/20150331/551a46fd0a00d.jpg', 66, 1, 4, 0),
(67, '你看! 爸爸/媽媽和孩子們正在為烏龜爸 的龜殼作 裝飾 呢!', '/coopphoto/20150331/551a4701b7540.jpg', 67, 1, 4, 0),
(68, '你看! 爸爸/媽媽和孩子們正在為烏龜爸 的龜殼作 裝飾 呢!', '/coopphoto/20150331/551a4706dc036.jpg', 68, 1, 4, 0),
(69, '紫宇:我正在為龜爸 的臉貼上眼睛 的臉貼上眼睛 , 讓牠可以看見我 !', '/coopphoto/20150331/551a470f9671c.jpg', 69, 1, 4, 0),
(70, '孩子們: 好嘢! 我們的烏龜爸糖果盒子 烏龜爸糖果盒子 , 以及 BB 龜手偶 完成啦 !', '/coopphoto/20150331/551a47212183a.jpg', 70, 1, 4, 0),
(71, '孩子們: 好嘢! 我們的烏龜爸糖果盒子 烏龜爸糖果盒子 , 以及 BB 龜手偶 完成啦 !', '/coopphoto/20150331/551a472888485.jpg', 71, 1, 4, 0),
(72, '孩子們: 好嘢! 我們的烏龜爸糖果盒子 烏龜爸糖果盒子 , 以及 BB 龜手偶 完成啦 !', '/coopphoto/20150331/551a47369b404.jpg', 72, 1, 4, 0),
(73, '完成後, 孩子和爸媽們均玩過不亦樂乎呢!', '/coopphoto/20150331/551a4744762fd.jpg', 73, 1, 4, 0),
(74, '完成後, 孩子和爸媽們均玩過不亦樂乎呢!', '/coopphoto/20150331/551a474b34548.jpg', 74, 1, 4, 0),
(75, '完成後, 孩子和爸媽們均玩過不亦樂乎呢!', '/coopphoto/20150331/551a47517b8c7.jpg', 75, 1, 4, 0),
(76, '完成後, 孩子和爸媽們均玩過不亦樂乎呢!', '/coopphoto/20150331/551a4757a1746.jpg', 76, 1, 4, 0),
(77, '完成後, 孩子和爸媽們均玩過不亦樂乎呢!', '/coopphoto/20150331/551a4765cd4e8.jpg', 77, 1, 4, 0),
(78, '小朋友們都很專心繪畫自己的作品呢!', '/coopphoto/20150331/551a47b5748ca.jpg', 78, 1, 5, 0),
(79, '小朋友們都很專心繪畫自己的作品呢!', '/coopphoto/20150331/551a47b79b943.jpg', 79, 1, 5, 0),
(80, '看看我們用心創作的圖畫多美麗, 而且每張圖畫也不一樣啊', '/coopphoto/20150331/551a47c6d63a7.jpg', 80, 1, 5, 0),
(81, '看看我們用心創作的圖畫多美麗, 而且每張圖畫也不一樣啊', '/coopphoto/20150331/551a47ca5793f.jpg', 81, 1, 5, 0),
(82, '看看我們用心創作的圖畫多美麗, 而且每張圖畫也不一樣啊', '/coopphoto/20150331/551a47d473edd.jpg', 82, 1, 5, 0),
(83, '看看我們用心創作的圖畫多美麗, 而且每張圖畫也不一樣啊', '/coopphoto/20150331/551a47d689ef8.jpg', 83, 1, 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vk_courseinfo`
--

CREATE TABLE IF NOT EXISTS `vk_courseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `age` varchar(255) DEFAULT NULL,
  `fit` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `vk_courseinfo`
--

INSERT INTO `vk_courseinfo` (`id`, `title`, `age`, `fit`, `content`, `time`, `color`, `cid`, `status`, `sid`) VALUES
(1, '學前兒童藝術課程', 'Age:2.5', '合適對象：2-3歲', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  訓練漸進式線條技巧，勾勒圖畫的雛型\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  培養對色彩的認知及敏感度\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  加入手工元素，訓練小手肌肉\r\n&lt;/p&gt;', './Uploads/document/551912b293fac.png', '#06aef5', 1, 1, 90),
(2, '幼兒故事繪畫課程', '', '合適對象：2.5-3歲', '&lt;p&gt;\r\n	培育目標：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  引導孩子以多種色彩繪畫，培養對顏色的敏感度。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  讓孩子掌握各類線條繪畫方法，增強手眼協調能力。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  鼓勵孩子使用不同物料繪畫，探索創作的可能性。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以撕、貼、搓、揉、拍等創作方式，訓練小肌肉。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	課程包含繪畫及手工拼貼畫，以塑膠彩、水彩為創作媒介，以水彩筆、海綿、牙刷為繪畫物料，教授小朋友以簡單線條或塗鴉的方法，運用豐富色彩，畫出故事裡的人物、動物或事物。\r\n&lt;/p&gt;', '', '#06aef5', 2, 1, 90),
(3, '兒童創意藝術課程', 'Grade 1', '合適對象：幼稚園學生', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-&amp;nbsp;&amp;nbsp;以故事為本，引發興趣及創作動力\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-&amp;nbsp;&amp;nbsp;訓練觀察力，學習繪畫人物、物件及環境空間的技巧\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-&amp;nbsp;&amp;nbsp;運用不同的藝術媒介，如粉彩、塑膠彩、水彩、手工材料等，讓作品更多樣化\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-&amp;nbsp;&amp;nbsp;進一步提高手部的靈活度\r\n&lt;/p&gt;', './Uploads/document/55191f420658a.png', '#090', 1, 1, 80),
(4, '兒童創意藝術課程', 'Grade 2', '合適對象：幼稚園學生', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以增強孩子的想像力及自信心為目標\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以開放式故事引領孩子想像\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  鼓勵孩子不斷嘗試，建立自豪感\r\n&lt;/p&gt;', './Uploads/document/55191f7b28978.png', '#909', 1, 1, 70),
(5, '兒童創意藝術課程', 'Grade 3-4', '合適對象：幼稚園學生', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  講求「原創」及「自主性」\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  使用鉛筆及墨水筆，增強描繪線條的能力\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  學習在故事中加入個人元素，建立個人藝術風格\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  初步體驗油畫、漫畫及顏色素描等視覺藝術技巧\r\n&lt;/p&gt;', './Uploads/document/55191fd55f33f.png', '#F69', 1, 1, 60),
(6, '兒童創意藝術課程', 'Grade 5-6', '合適對象：小學生以上', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  針對小學程藝術技巧的提升\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  學習繪畫技巧包括：素描、水彩及廣告彩畫、塑膠彩畫、漫畫插圖\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  引導學生建立個人藝術風格\r\n&lt;/p&gt;', './Uploads/document/5519201b79d7e.png', '#F90', 1, 1, 50),
(7, '專業西洋畫課程   -  塑膠彩畫', '', '合適對象：完成Grade6之學生', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;p&gt;\r\n		-&amp;nbsp;&amp;nbsp;為油畫入門之階梯，講求顏色運用及配搭\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		-&amp;nbsp;&amp;nbsp;體驗油畫布上繪畫風景、靜物及人像的技巧\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', './Uploads/document/5519209f539aa.png', '#630', 1, 1, 40),
(8, '專業西洋畫課程   -  素描', '', '', '&lt;p&gt;課程內容：&lt;/p&gt;\r\n&lt;p&gt;-  為視覺藝術裡不可或缺的基礎&lt;/p&gt;\r\n&lt;p&gt;-  學習素描的構圖原理、靜物素描、速寫技巧及顏色素描&lt;/p&gt;\r\n&lt;p&gt;-  掌握結構、比例、透視、空間及光線的運用&lt;/p&gt;', '', '#666', 1, 1, 30),
(9, '專業西洋畫課程   -  漫畫及插畫', '', '', '&lt;p&gt;課程內容：&lt;/p&gt;\r\n&lt;p&gt;-  以鉛筆、水彩、木顏色及墨水筆為工具&lt;/p&gt;\r\n&lt;p&gt;-  學習人物及動物的身體比例、表情、動作及造型&lt;/p&gt;\r\n&lt;p&gt;-  熟練環境空間的構圖、比例及透視等&lt;/p&gt;\r\n&lt;p&gt;-  掌握線條的運用及顏色的配搭&lt;/p&gt;', '', '#666', 1, 1, 20),
(10, '兒童故事繪畫課程', 'Grade 1', '合適對象：3-4歲', '&lt;p&gt;\r\n	培育目標：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  教導孩子以形狀及線條的組合，畫出事物的簡單輪廓。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  引導孩子以多種色彩繪畫，培養對顏色的敏感度。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  教授小朋友如何運用主體顏色及背景顏色，對構圖有初步概念。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  鼓勵小朋友利用不同的繪畫工具：水彩筆、粉彩筆等，學習握筆方法。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	課程包含繪畫及手工拼貼畫，以塑膠彩、水彩及粉彩為創作媒介，教授小朋友以簡單線條，繪畫課堂所教的人物、動物或事物，並為主體及背景塗上豐富色彩。老師更會鼓勵孩子互動學習，聆聽故事之餘，亦表達所畫的故事及想法。\r\n&lt;/p&gt;', '', '#00a650', 2, 1, 80),
(11, '兒童故事繪畫課程', 'Grade 2', '合適對象：4-5歲', '&lt;p&gt;\r\n	培育目標：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  讓孩子掌握各種人物、動物及事物等更細緻的繪畫方法。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  教授孩子如何配搭顏色，讓圖畫的色彩及層次更鮮明。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  引導孩子去編排圖畫中的內容，掌握用圖畫清楚表達概念。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  學習以粉彩及水彩做出不同效果，掌握用色技法。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	課程以粉彩、水彩及塑膠彩為創作媒介，教授小朋友繪畫各種人和物的身體部份、面部表情及花紋特徵等，令圖畫更細緻。而故事亦成為孩子繪畫的參考，導師會鼓勵他們想像圖畫人物的行為動作，豐富故事情節。\r\n&lt;/p&gt;', '', '#7f3e98', 2, 1, 70),
(12, '兒童中級繪畫技巧課程', 'Grade 3', '合適對象：5-6歲', '&lt;p&gt;\r\n	培育目標：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  讓學生掌握香港及日常生活事物的繪畫方法，能夠即時畫出線條圖。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  想像畫練習，加強學生的多元想像。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  引導學生表達圖畫內容，熟習如何表達意念。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	課程以訓練鉛筆線條畫為主，會以家庭、職業、交通工具、動物等為繪畫內容，配以想像畫環節，引導學生利用形狀如三角形、圓形及多邊形，去畫出想像的圖畫。最後，學生更會輪流表達畫中的內容，與導師進行對答。課堂後，導師會與家長分享評估報告。\r\n&lt;/p&gt;', '', '#ed008c', 3, 1, 90),
(13, '兒童中級繪畫技巧課程', 'Grade 4', '合適對象：5-6歲', '&lt;p&gt;\r\n	培育目標：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  讓學生掌握塑膠彩基本技巧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  加強學生對顏料運用及色彩配搭的知識。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  在油畫架上作畫，加強手部握筆的穩定性。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	課程以塑膠彩畫為主。教授學生塑膠彩顏料的特性及繪畫技法，如三原色及調色原理。主題創意及技巧兼備，內容包含抽象幻想畫、動物、節日、維港風景等，讓學生繪畫具個人風格及色彩鮮明的作品。\r\n&lt;/p&gt;', '', '#ee5d31', 3, 1, 80),
(14, '課程內容', '', '合適對象：6-8歲', '&lt;p&gt;\r\n	素描：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  學習素描及透視學的基本原理\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  掌握結構、比例、透視、空間及光線的運用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  描繪石膏幾何模型和靜物。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  初步掌握立體觀察和描繪物體的方法和技巧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  認識三維立體空間的表達手法\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	水彩畫：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以深入淺出的手法，讓學員學習水彩技巧及各種特殊技法。(如：濕畫法，縫合法，濕中乾等。)\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以風景、靜物、現代畫等不同題材作教學例子，透過實踐去認識不同畫派的繪畫特色。\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	塑膠彩畫：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  加深學生對色彩的認識、運用及配搭，如三原色、對比色及色彩明暗關係。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  認識油畫的物料使用及不同的繪畫技巧\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  體驗油畫布上繪畫風景、靜物的技巧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  為油畫技法打好基礎\r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	插畫：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  以鉛筆、水彩、木顏色及墨水筆為工具。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  學習人物及動物的身體比例、表情、動作及造型。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  熟練環境空間的構圖、比例及透視等。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  掌握線條的運用及顏色的配搭。\r\n&lt;/p&gt;', '', '#06aef5', 4, 1, 90);

-- --------------------------------------------------------

--
-- 表的结构 `vk_courselist`
--

CREATE TABLE IF NOT EXISTS `vk_courselist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `vk_courselist`
--

INSERT INTO `vk_courselist` (`id`, `title`, `content`, `status`) VALUES
(1, '兒童故事繪畫課程', '&lt;div class=&quot;teacher&quot;&gt;\r\n	&lt;div class=&quot;photo&quot;&gt;\r\n		&lt;img src=&quot;http://localhost/vkids/Public/Img/Course/vivian.jpg&quot; /&gt; \r\n	&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&lt;div class=&quot;infor&quot;&gt;\r\n			藝術課程策劃：Vivian姐姐\r\n		&lt;/div&gt;\r\n		&lt;div class=&quot;introduction&quot;&gt;\r\n			香港理工大學設計系學士學位畢業，曾修畢清華大學心理諮詢與輔導課程 及 香港感覺運動學會感覺運動師資證書課程。現正修讀輔導學學士課程。Vivian姐姐為資深兒童藝術教育工作者，擁有十二年兒童視覺藝術教學經驗，過去曾為多間藝術培育機構、幼稚園及青年機構等，開辦適合不同年齡小朋友的藝術課程。\r\nVivian姐姐曾獲亞洲電視兒童台邀請，擔任藝術環節的主持，亦曾為《砵砵子兒童雙周刊》撰寫手工藝專欄。更曾獲香港理工大學「創新我未來」計劃邀請，擔任「互動科技探索及概念原型法」課程策劃及導師。\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;group&quot;&gt;\r\n	&lt;img src=&quot;http://localhost/vkids/Public/Img/Course/group.jpg&quot; /&gt; \r\n&lt;/div&gt;', 1),
(2, '兒童故事繪畫課程', '&lt;div class=&quot;description&quot;&gt;\r\n	小孩喜愛看圖畫，看圖書，更喜愛聽故事。本課程結合故事及繪畫，導師會演說一系列自創插圖故事，主題包括大自然景象、動物世界、生活常識、節日及人物等，與孩子分享知識之餘，亦與他們產生互動，鼓勵表達個人的意見及想法。這樣，故事插圖、真實圖片及對答更能引發觀察、想像及創意，成為小孩們創作的靈感泉源，在圖畫中表達一個嶄新的故事。\r\n&lt;/div&gt;', 1),
(3, '兒童中級繪畫技巧課程', '&lt;div class=&quot;description&quot;&gt;\r\n	本課程為幼稚園高班(K.3)而設計，結合線條訓練及塑膠彩畫學習。課程前半期，針對學生小一面試的繪圖部份，學習繪畫各種有關香港及日常生活的人物及事物，並加插想像畫的訓練，讓學生為面試作好準備。而課程後半期，會以塑膠彩畫為主，學生集中以油畫板及塑膠彩創作，在油畫架上繪圖，配合循序漸進的教學內容，為將來的小學視藝課程打好根基。\r\n&lt;/div&gt;', 1),
(4, '少兒高級繪畫技巧課程', '&lt;div class=&quot;description&quot;&gt;\r\n	課程會分為Grade 5及Grade 6兩個級別，各以三個月為一季。全年教授學生四項繪畫技法，包裝：1) 插畫。2) 素描。3.) 塑膠彩畫。4) 水彩畫)。導師會與學生賞析中外著名畫家的作品，認識各種藝術媒介的特色、表現形式及風格。讓學生能夠依循正統方法學習繪畫的同時，亦能從中探索個人愛好，初步選擇自己喜歡的繪畫類別。升級至Grade 6時，導師會加深學生技巧的熟練度，提高不同的藝術媒介的多元化運用，進一步鞏固學生的繪畫基礎。\r\n&lt;/div&gt;', 1),
(5, '專業西洋畫課程', '完成Grade 6的學生，已對 插畫、素描、塑膠彩畫、水彩畫 具一定程度的掌握。在專業西洋畫課程階段，學員可根據個人喜好，選擇擅長及想繼續深造的繪畫媒介 (例如：麥克筆、塑膠彩、油彩、廣告彩、水彩、針筆、木顏色、乾粉彩、油粉彩、素描筆等)，在導師的指導下，繪畫達專業級別的作品。學員亦可根據導師建議，報考不同藝術類別及不同等級的「全國美術考級試」。畫室亦會安排模擬考試，讓學生作充份準備。 &lt;br /&gt;\r\n(全國美術考級試，是由中國文化部考級機構及香港考試及評核局所合辦的綜合美術考試。具有不同藝術類別的考級試，如：西洋畫 (素描、水粉畫、水彩畫、油畫) 及中國畫 (人物、山水、花鳥) 。', 1),
(6, '學前兒童藝術課程', '&lt;p&gt;\r\n	課程內容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  訓練漸進式線條技巧，勾勒圖畫的雛型\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  培養對色彩的認知及敏感度\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	-  加入手工元素，訓練小手肌肉\r\n&lt;/p&gt;', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vk_documentlist`
--

CREATE TABLE IF NOT EXISTS `vk_documentlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pdf` varchar(60) CHARACTER SET utf8 NOT NULL,
  `created` int(13) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `vk_documentlist`
--

INSERT INTO `vk_documentlist` (`id`, `title`, `pdf`, `created`, `sid`, `pid`) VALUES
(5, '课程一', './Uploads/document/54acdaaa379b7.pdf', 1420560000, 0, 1),
(6, '课程二', './Uploads/document/54acdd75db999.pdf', 1420560000, 0, 1),
(7, '1111', '', 1421856000, 0, 2),
(9, 'dsfgsdg', '', 1421856000, 0, 6),
(10, 'test', './Uploads/document/54eec9bb52f39.pdf', 1422374400, 0, 4),
(11, '02', './Uploads/document/54eec9de8a08e.pdf', 1424880000, 11, 4),
(12, '123', '', 1424966400, 12, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vk_idea`
--

CREATE TABLE IF NOT EXISTS `vk_idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `vk_idea`
--

INSERT INTO `vk_idea` (`id`, `title`, `content`, `status`) VALUES
(1, '教學理念1', '&lt;div class=&quot;text&quot;&gt;\r\n	&lt;p&gt;\r\n		爸爸媽媽為甚麼要讓小朋友去學「畫畫」呢？\r\n	&lt;/p&gt;\r\n&lt;br /&gt;\r\n	&lt;p&gt;\r\n		為了訓練子女多角度思考？培養他們的藝術美感？增強他們的表達能力及自信心？訓練他們的小肌肉？為學校的功課做準備？……\r\n	&lt;/p&gt;\r\n&lt;br /&gt;\r\n	&lt;p&gt;\r\n		若我們以小朋友的角度去看，會發現他們大部份都喜歡接觸色彩；喜愛用顏色去描繪所看見的事物；會滿心歡喜的與家人分享自己的畫作；喜歡將畫中的得意故事向老師同學一一道來。每一個作品，對小孩來說，就像一本圖冊，有說不完的故事。但很多時候，父母會忽略了子女的聲音，著眼點只放在作品上。\r\n	&lt;/p&gt;\r\n&lt;br /&gt;\r\n	&lt;p&gt;\r\n		有家長會問：「我的孩子很喜歡畫畫，很有天份，可不可以儘早教他深一點的繪畫技巧？」可能父母會認為，小朋友的畫只要畫得真，能夠在畫中運用所學的技巧，就可以畫出一幅好畫。但我們覺得，畫得真，畫得有技巧，但裡面沒有小朋友的感受，沒有小朋友的故事，沒有小朋友的靈魂，那麼繪畫只會變成空洞的東西。\r\n	&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;h4&gt;\r\n	我們的信念是 ─ 繪畫對小朋友的價值，不止限於美與不美，繪畫是他們表達感受的溝通媒介，是健康成長的好伙伴。\r\n&lt;/h4&gt;\r\n&lt;div class=&quot;leftColumn&quot;&gt;\r\n	&lt;div class=&quot;text&quot;&gt;\r\n		&lt;p&gt;\r\n			藝術創作並不孤獨，它可以令關係密切的人更加了解對方；它可以令不相識的人惺惺相惜。當看見小朋友拿著起自己的創作，面露滿足的笑容，或者興奮得手舞足蹈，藝術的力量已超出作品本身，它讓我們感受到小朋友的情緒，它讓我們觸碰小小生命的靈魂。父母有時會想，怎樣與子女溝通，但原來在視覺藝術世界中，小孩已經不知不覺與大人們說話了。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			所以，父母及老師擔當的角色，並不只教導，而是陪在小朋友左右，用心去引發他們、鼓勵他們、聆聽他們，從中引發他們對藝術的興趣，鼓勵他們作多方面的嘗試。讓他們相信利用自己的小手掌，都可以發揮出大力量；聆聽他們的分享，進入幼小的內心世界，變為子女成長路上的知心友。\r\n		&lt;/p&gt;\r\n	&lt;/div&gt;\r\n	&lt;h4&gt;\r\n		擁有靈魂及個人風格的作品，才是最感動人及富有藝術價值。\r\n	&lt;/h4&gt;\r\n	&lt;div class=&quot;text&quot;&gt;\r\n		只要用「心」創造， 繪畫必定是最「美」的。就讓我們一起陪伴可愛的小孩，啟發他們、鼓勵他們，以自己的力量完成腦海中的意念，在藝術創作的路上快樂成長。\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;rightColumn&quot;&gt;\r\n	&lt;img src=&quot;http://localhost/vkids/Public/Img/Idea/idea.jpg&quot; /&gt; \r\n&lt;/div&gt;', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vk_newslist`
--

CREATE TABLE IF NOT EXISTS `vk_newslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `vk_newslist`
--

INSERT INTO `vk_newslist` (`id`, `pic`, `title`, `content`, `status`, `date`, `sid`) VALUES
(4, '/newslist/20150331/551a1a7c60e06.jpg', 'Easter Workshops 2015 ( 1, 2, 9, 10 April)', '一年一度嘅Easter Workshops 正式開始接受報名啦!&lt;br /&gt;', 1, '1427817600', 4),
(5, '/newslist/20150331/551a34ddf0967.jpg', '第34屆中國-日本國際書畫大賽結果', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;恭喜&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;各位得&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;獎同學&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;!&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;你們用心的創作被&lt;em&gt;&lt;span style=&quot;color:black;&quot;&gt;國際比賽的評審&lt;/span&gt;&lt;/em&gt;肯定&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;導師們也感到很高興&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;!&lt;/span&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:windowtext;&quot;&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;鄧珮珊&lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt; &lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;Tang Pui Shan Rainie&lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;金&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;溫浠婷&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Wan Hei Ting&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;馬穎褆&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Ma Wing Tai Lavinia&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;區逸懿&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Au Yet Yi&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;陳霈澄&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Chan Pui Tsing Sofie&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;陳享知&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Chan Han Gi Angie&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;龔俊豪&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Kung Jun Hao Duncan&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;陳浩嫣&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Chen Annika Brandy&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;梁紫晞&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Leung Tsz Hei, Angelina&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;梁紫晴&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Leung Tsz Ching, Annice&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;鄧穎潼&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Tang Wing Tung Cherry&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;銀&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:black;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/em&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;洪仲研&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Hong Chung Yin Cayden&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;林嘉希&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Lam Kar Hei&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;鄭曉澄&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Cheng Calista Hiu Ching&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;朱蔚蕎&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Chu Wai Kiu&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;薛贊辰&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Sit Jensen&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;銅&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;何臻羲&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Brandon Angelo Ho&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;何臻晟&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Anjay Angelo Ho&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;陳樂欣&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chan Lok Yan&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;銅&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;方游&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Charmaine Fong&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優秀&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;凌哲&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Lin Chit Isaac&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;優秀&lt;span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;br /&gt;', 1, '1426262400', 5),
(6, '/newslist/20150331/551a3f0e1e1e2.JPG', '2015當代青少年及兒童藝術節- 新春繪畫比賽結果', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;恭喜&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;各位得&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;獎同學&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;!&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;你們每位同學的作品均滿載喜氣洋洋的新年氣氛&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;令人也想置身其中呢&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;!&lt;/span&gt;&lt;em&gt;&lt;span style=&quot;font-family:華康海報體W12;color:windowtext;&quot;&gt;&lt;/span&gt;&lt;/em&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;楊韻笙&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Yeung Wan Sang Ria&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;A&lt;/span&gt;組 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;冠軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;張冬愛&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Teresa Cheung&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;B&lt;/span&gt;組 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;冠軍&lt;span&gt; &lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;董貝婧&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Karis Kathleen Tung &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;A&lt;/span&gt;組 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;亞軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;黃皓信 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Wong Ho Chun&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;B&lt;/span&gt;組 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;亞軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;虞康立 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Yu Hong Lap &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 兒童&lt;span&gt;A&lt;/span&gt;組 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;亞軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;朱皓頤&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chu Ho Yee&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt; Chloe &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;A&lt;/span&gt;組&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;溫浠婷&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Wan Hei Ting&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;李柏賢&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Lee Pak Yin Ansen&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;幼兒&lt;span&gt;B&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;陳俙而 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chan Hay Yee Jessy &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;楊梓淇&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Yeung Tsz Ki&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;彭珞怡&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Pang Lok Yi Chloe&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;油畫 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;季軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;周正淳&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chow Jason&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;陳明毅&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Linus\r\nChan&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;兒童畫&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;幼兒&lt;span&gt;B&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;朱仲頤&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chu Chung Yee&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt; Victoria&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;幼兒&lt;span&gt;B&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;陳梓業&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chan Tsz Yip Matthew&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;兒童畫&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;兒童&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;楊心攸 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Yeung Sum Yau&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;林嘉希 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Lam Kar Hei &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;高懿雅 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Ko Yi Nga Ashley &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;李琳禧&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Lee Lam Hei Jade&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;何紫悅&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Ho Tze Yuet &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;朱蔚蕎&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Chu Wai Kiu&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt; &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 幼兒&lt;span&gt;B&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;黃敏妍&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Wong Man Yin Madelene&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 兒童&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;伍穎謙&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;Ng Wing Him &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 兒童&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:justify;&quot;&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;麥凱淇 &lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;Mak Hoi Ki&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;水&lt;span&gt;,&lt;/span&gt;粉&lt;span&gt;,&lt;/span&gt;彩 兒童&lt;span&gt;A&lt;/span&gt;組&lt;span&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;優異&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;', 1, '1426262400', 6),
(7, '/newslist/20150331/551a3f384a819.jpg', '2014 梵高 “共築香港夢“ 繪畫比賽 結果', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;恭喜司徒浩揚同學在&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;2014&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;梵高博物館「共築香港夢」繪畫比賽榮獲冠軍殊榮，並得到曾志偉先生親自頒獎，感到十分感恩。同時&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;,&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;恭喜&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;各其餘得&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;獎同學&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;!&lt;/span&gt;&lt;span style=&quot;font-family:細明體;&quot;&gt; &lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;司徒浩陽 &lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;SE TO HO YEUNG MORTON&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;Group\r\nC&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;冠軍&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;馬穎褆&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Ma Wing Tai Lavinia&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;Group\r\nA&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;優異&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:華康海報體W12;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;黃崇銘&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Wong Gareth Sung Ming&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Group B&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;優異&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:華康海報體W12;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;楊東琪&lt;span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Yeung Tung Ki&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Group E&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;優異&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Wong Hoi Shan Melody&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;Group E&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:華康海報體W12;&quot;&gt;優異&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:華康海報體W12;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;', 1, '1426262400', 7);

-- --------------------------------------------------------

--
-- 表的结构 `vk_newsphotoslist`
--

CREATE TABLE IF NOT EXISTS `vk_newsphotoslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `vk_newsphotoslist`
--

INSERT INTO `vk_newsphotoslist` (`id`, `title`, `pic`, `sid`, `status`, `pid`) VALUES
(5, '在鳥語花的季節', '/newsphotoslist/20150331/551a32f607990.jpg', 99, 1, 4),
(6, '輕黏土恐龍音樂盒加上朱古力蛋製作創新又好玩！', '/newsphotoslist/20150331/551a33451ae66.jpg', 6, 1, 4),
(7, '還有兩面Hero cushion ，一次過抱走心口發光的Iron Man 和Captain America ！', '/newsphotoslist/20150331/551a335261fad.jpg', 7, 1, 4),
(8, '還有兩面Hero cushion ，一次過抱走心口發光的Iron Man 和Captain America ！', '/newsphotoslist/20150331/551a3354b290c.jpg', 8, 1, 4),
(9, 'Workshop時間請詳閱以下單張', '/newsphotoslist/20150331/551a3372333b9.JPG', 9, 1, 4),
(10, '曾志偉先生與各得獎者大合照', '/newsphotoslist/20150331/551a3f4e656a2.jpg', 10, 1, 7),
(11, '曾志偉先生致詞', '/newsphotoslist/20150331/551a3f5ba6c88.jpg', 11, 1, 7),
(12, 'Ms Vivian Leung與得獎指導作品', '/newsphotoslist/20150331/551a3f722fd27.jpg', 12, 1, 7),
(13, '司徒浩揚同學喜獲得HK$7000參加“荷蘭 “梵高博物館 主題探索與學習課程” 之旅 贊助', '/newsphotoslist/20150331/551a3f7fb7b58.jpg', 13, 1, 7),
(14, '指導老師Ms Vivian Leung與司徒浩揚同學合照', '/newsphotoslist/20150331/551a3fa73a122.jpg', 14, 1, 7);

-- --------------------------------------------------------

--
-- 表的结构 `vk_reportlist`
--

CREATE TABLE IF NOT EXISTS `vk_reportlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `pdf` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `orders` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `vk_reportlist`
--

INSERT INTO `vk_reportlist` (`id`, `title`, `date`, `pdf`, `status`, `orders`) VALUES
(1, '報章報導', 1427644800, './Uploads/document/5518f59ef26cc.pdf', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vk_studentlist`
--

CREATE TABLE IF NOT EXISTS `vk_studentlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pic` varchar(60) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `vk_studentlist`
--

INSERT INTO `vk_studentlist` (`id`, `title`, `pic`, `sid`, `status`, `link`) VALUES
(1, 'test', '', 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `vk_studentphotoslist`
--

CREATE TABLE IF NOT EXISTS `vk_studentphotoslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pic` varchar(60) CHARACTER SET utf8 NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `vk_studentphotoslist`
--

INSERT INTO `vk_studentphotoslist` (`id`, `title`, `pic`, `sid`, `pid`, `name`, `created`) VALUES
(1, '國際兒童繪畫比賽 - 金獎', '/studentphotoslist/20150326/55139ece57a9a.jpg', 99, 1, '陳大文', 0),
(2, '世界兒童繪畫比賽 - 銀獎', '/studentphotoslist/20150326/5513a208261b5.jpg', 98, 1, '陳大文', 0),
(3, '「信心存摺」繪畫比賽 - 銀獎', '/studentphotoslist/20150326/5513a2238b63b.jpg', 97, 1, '陳大文', 0),
(4, '中國青少年藝術節香港區選拔賽 （繪畫比賽） - 金獎', '/studentphotoslist/20150326/5513a23863145.jpg', 96, 1, '陳大文', 0),
(5, '中、菲、日國際書畫大賽-金獎', '/studentphotoslist/20150326/5513a273ab9b3.jpg', 95, 1, '陳大文', 0),
(6, '國際兒童繪畫比賽 - 金獎', '/studentphotoslist/20150326/5513a27f28744.jpg', 94, 1, '陳大文', 0),
(7, '世界兒童繪畫比賽 - 銀獎', '/studentphotoslist/20150326/5513a28c2da3e.jpg', 93, 1, '陳大文', 0),
(8, '世界兒童繪畫比賽 - 銀獎', '/studentphotoslist/20150326/5513a29a88e7d.jpg', 92, 1, '陳大文', 0),
(9, '2015當代青少年及兒童藝術節(新春繪畫比賽)-冠軍', '/studentphotoslist/20150326/5513a6a763317.jpg', 99, 2, '張冬愛', 0),
(10, '2015當代青少年及兒童藝術節(新春繪畫比賽)-冠軍', '/studentphotoslist/20150326/5513a7bce944e.jpg', 98, 2, '楊韻笙', 0),
(11, '2015當代青少年及兒童藝術節(新春繪畫比賽)-亞軍', '/studentphotoslist/20150326/5513a7eec07df.jpg', 97, 2, '黃皓信', 0),
(12, '2015當代青少年及兒童藝術節(新春繪畫比賽)-亞軍', '/studentphotoslist/20150326/5513a80b6b531.jpg', 96, 2, '董貝婧', 0),
(13, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513a8267171e.jpg', 95, 2, '司徒浩陽', 0),
(14, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513adf147ff1.jpg', 94, 2, '朱皓頤', 0),
(17, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b0282ba09.jpg', 93, 2, '陳俙而', 0),
(19, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b069513b3.jpg', 92, 2, '彭珞怡', 0),
(20, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b3b69317a.jpg', 91, 2, '李柏賢', 0),
(21, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b3eb69c6a.jpg', 90, 2, '楊梓淇', 0),
(22, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b41b37a53.jpg', 89, 2, '溫浠婷', 0),
(23, '2015當代青少年及兒童藝術節(新春繪畫比賽)-季軍', '/studentphotoslist/20150326/5513b42beff0e.jpg', 88, 2, '虞康立', 0),
(24, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b5c73cb72.jpg', 87, 2, '伍穎謙', 0),
(25, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b5cc831ff.jpg', 86, 2, '朱仲頤', 0),
(26, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b65c4483a.jpg', 85, 2, '朱蔚蕎', 0),
(27, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b5f22d72c.jpg', 84, 2, '何紫悅', 0),
(28, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6814b8fd.jpg', 83, 2, '李琳禧', 0),
(29, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6902258d.jpg', 82, 2, '周正淳', 0),
(30, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6a3abf79.jpg', 81, 2, '林嘉希', 0),
(31, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6b211200.jpg', 80, 2, '高懿雅', 0),
(32, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6c89a45e.jpg', 79, 2, '陳明毅', 0),
(33, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6db4a32e.jpg', 78, 2, '陳梓業', 0),
(34, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6eca74d5.jpg', 77, 2, '黃敏妍', 0),
(35, '2015當代青少年及兒童藝術節(新春繪畫比賽)-優異', '/studentphotoslist/20150326/5513b6f859b4e.jpg', 76, 2, '楊心攸', 0),
(36, '孩子之聲 第一期_001', '/studentphotoslist/20150327/5514cdb92eeb6.jpg', 36, 3, '', 0),
(37, '孩子之聲 第一期_002', '/studentphotoslist/20150327/5514cdc6ba197.jpg', 37, 3, '', 0),
(38, '孩子之聲 第二期_001', '/studentphotoslist/20150327/5514cdd21b2bf.jpg', 38, 3, '', 0),
(39, '孩子之聲 第二期_001', '/studentphotoslist/20150327/5514cdd981abb.jpg', 39, 3, '', 0),
(40, '孩子之聲 第三期_001', '/studentphotoslist/20150327/5514ce182a945.jpg', 40, 3, '', 0),
(41, '孩子之聲 第三期_002', '/studentphotoslist/20150327/5514ce1d7bbcb.jpg', 41, 3, '', 0),
(42, '孩子之聲 第四期_001', '/studentphotoslist/20150327/5514ce2b188f6.png', 42, 3, '', 0),
(43, '孩子之聲 第四期_002', '/studentphotoslist/20150327/5514ce30b9803.png', 43, 3, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vk_user`
--

CREATE TABLE IF NOT EXISTS `vk_user` (
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
-- 转存表中的数据 `vk_user`
--

INSERT INTO `vk_user` (`id`, `account`, `login_count`, `last_login_time`, `password`, `status`, `nickname`, `last_login_ip`) VALUES
(1, 'admin', '126', '1427780086', 'b59c67bf196a4758191e42f76670ceba', 1, '', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `vk_userb`
--

CREATE TABLE IF NOT EXISTS `vk_userb` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `current` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `vk_userb`
--

INSERT INTO `vk_userb` (`id`, `user`, `pass`, `created`, `current`, `last`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2012-10-11 16:22:02', '2014-12-24 07:28:41', '2014-11-25 07:32:38');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
