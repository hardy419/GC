<?php 
if(version_compare(PHP_VERSION, '5.3.0','<'))die('require PHP > 5.3.0 !');

$_GET['c'] = 'Contactus';

define('SITE_PATH','/gc/');
define('APP_PATH','./Application/');
define('APP_DEBUG',true);
define('BANNER_WIDTH',1100);
define('BANNER_HEIGHT',240);
define('BANNER_HEIGHT_MAIN',330);
require './ThinkPHP/ThinkPHP.php';
?>