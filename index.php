<?php
session_start();
ini_set("display_errors", 1);
setlocale(LC_MONETARY, 'vi_VN');

define("ISHOME", true);
if (!isset($_SESSION['LANGUAGE'])) {
	$_SESSION['LANGUAGE'] = '0';
}
$isMobile = (bool) preg_match('#\b(ip(hone|od|ad)|android|opera m(ob|in)i|windows (phone|ce)|blackberry|tablet' .
	'|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp|laystation portable)|nokia|fennec|htc[\-_]' .
	'|mobile|up\.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\b#i', $_SERVER['HTTP_USER_AGENT']);
$actual_link = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";

require_once "global/libs/gfinit.php";
require_once "global/libs/gfconfig.php";
require_once "global/libs/gffunc.php";
require_once 'libs/cls.mysql.php';
require_once 'libs/cls.template.php';
require_once 'libs/cls.menuitem.php';
require_once 'libs/cls.module.php';
require_once 'libs/cls.configsite.php';

$tmp = new CLS_TEMPLATE();
$objmysql = new CLS_MYSQL();
$objdata = new CLS_MYSQL();
$obj_mnuitems = new CLS_MENUITEM();
$conf = new CLS_CONFIG();
$conf->load_config();
global $tmp;global $conf;
?>
<!DOCTYPE html>
<html language='vi'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="index, follow" />
	<meta property="og:type" content="website" />
	<meta property="og:author" content='<?php echo $conf->CompanyName; ?>' />
	<meta property="og:locale" content='vi_VN'/>
	<meta property="og:title" content="<?php echo $conf->Title; ?>"/>
	<meta property="og:keywords" content='<?php echo $conf->Meta_key; ?>' />
	<meta property='og:description' content='<?php echo $conf->Meta_desc; ?>' />
	<meta property="og:url" content="<?php echo $actual_link ?>" />
	<meta property="og:image" content="<?php echo $conf->Img; ?>" />

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $conf->Title; ?></title>
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/bootstrap.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/font-awesome.min.css" type="text/css" media="all" >
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/slick.css">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/datepicker.css">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/jquery-customselect-1.9.1.css">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style-responsive.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/Roboto.css" type="text/css" media="all">

	<!-- <script src="<?php echo ROOTHOST; ?>js/jquery-3.4.1.slim.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="<?php echo ROOTHOST; ?>js/popper.min.js"></script>
	<script src="<?php echo ROOTHOST; ?>js/bootstrap.min.js"></script>
	<script src="<?php echo ROOTHOST; ?>js/sticky-sidebar.js"></script>
	<script src='<?php echo ROOTHOST; ?>js/slick.min.js'></script>
	<script src='<?php echo ROOTHOST; ?>js/gfscript.js'></script>
</head>
<body>
	<!-- Load Facebook SDK for JavaScript -->
	<!-- <div id="fb-root"></div>
	<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script> -->

	<div class="wrapper" id="wrapper">
		<?php include_once("modules/mod_mods/header.php");?>
		<?php if($tmp->isFrontpage()){ ?>
			<?php include_once("modules/mod_mods/banner-slide.php");?>
			<?php $tmp->loadModule('box2') ;?>
			<?php $tmp->loadModule('box3') ;?>
			<?php $tmp->loadModule('box5') ;?>
			<?php $tmp->loadModule('box4') ;?>
			<?php $tmp->loadModule('box6') ;?>
		<?php }else{ ?> 
			<?php $tmp->loadComponent(); ?> 
		<?php }?>
		<?php include_once("modules/mod_mods/footer.php");?>
	</div>
	<script type="text/javascript" src="<?php echo ROOTHOST; ?>js/jquery-customselect-1.9.1.min.js"></script>
	<script type="text/javascript" src="<?php echo ROOTHOST; ?>js/datepicker.js"></script>
	<script type="text/javascript" src="<?php echo ROOTHOST; ?>js/main.js"></script>
</body>
</html>