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
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/slick.css" >
	<!-- <link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/owl.carousel.min.css" > -->
	<!-- <link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/owl.theme.default.min.css"> -->
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/style-responsive.css" type="text/css" media="all">
	<link rel="stylesheet" href="<?php echo ROOTHOST; ?>css/Roboto.css" type="text/css" media="all">

	<!-- <script src="<?php echo ROOTHOST; ?>global/js/jquery-1.11.2.min.js"></script> -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="<?php echo ROOTHOST; ?>global/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src='<?php echo ROOTHOST; ?>js/slick.min.js'></script>
	<script src='<?php echo ROOTHOST; ?>js/gfscript.js'></script>
	<!-- <script src='<?php echo ROOTHOST; ?>js/owl.carousel.js'></script> -->
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
			<?php $tmp->loadModule('box3') ;?>
			<?php include_once("modules/mod_mods/home-body.php");?>
			<?php $tmp->loadModule('box4') ;?>
		<?php }else{ ?> 
			<?php $tmp->loadComponent(); ?> 
		<?php }?>
		<!-- <?php if($tmp->isFrontpage()){ ?>
			<div class="main-home">
				<section class="section-follow">
					<div class="container">
						<div id="slide-follow" class="owl-carousel owl-theme">
							<?php
							$sql="SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
							INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
							INNER JOIN tbl_categories AS d ON c.category_id=d.id
							WHERE c.isactive=1 AND c.ishot=1 ORDER BY c.cdate DESC, c.id DESC LIMIT 0, 10";
							$objmysql->Query($sql);
							while($row 	= $objmysql->Fetch_Assoc()) {
								$title 	= stripcslashes($row['title']);
								$code 	= $row['code'];
								$thumb 	= getThumb($row['thumb'], 'img-responsive', '');
								$views 	= (int)$row['visited'];
								$cdate 	= convert_date($row['cdate']);
								$cat_name	= $row['cat_name'];
								$price 		= convert_price($row['price']);
								$area  		= $row['area'];
								$type_land	= $row['type_of_land_id'];
								$type_name  = $row['type_name'];

								$sql_cate="SELECT * FROM tbl_categories WHERE isactive=1 AND id=".$row['category_id'];
								$objdata->Query($sql_cate);
								$r_cate = $objdata->Fetch_Assoc();
								$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';
								?>
								<div class="item">
									<div class="box-thumb"><a href="<?php echo $link;?>" title="<?php echo $title;?>"><?php echo $thumb;?></a></div>
									<div class="content">
										<div class="title"><a href="<?php echo $link;?>" title="<?php echo $title;?>"><?php echo $title;?></a></div>
										<div class="info">
											<div class="date">Giá: <b><?php if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;?></b></div>
											<div class="date">Diện tích: <?php if($area==="" || $area==0) echo 'Không xác định'; else echo number_format($area).'m²';?></div>
										</div>
										<div class="info">
											<span class="date"><?php echo $cdate;?></span>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
					</div>
				</section>

				<div class="container">
					<div class="row">
						<div class="col-md-8 col-sm-8">
							<div id="slide-hot-news" class="owl-carousel owl-theme">
								<?php
								$sql="SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
								INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
								INNER JOIN tbl_categories AS d ON c.category_id=d.id
								WHERE c.isactive = 1 ORDER BY c.cdate DESC,c.id DESC LIMIT 0, 3";
								$objmysql->Query($sql);
								while($row 	= $objmysql->Fetch_Assoc()) {
									$title 	= stripcslashes($row['title']);
									$code 	= $row['code'];
									$thumb 	= getThumb($row['thumb'], 'img-responsive', '');
									$views 	= (int)$row['visited'];
									$cdate 	= convert_date($row['cdate']);
									$intro 	= Substring(html_entity_decode(stripslashes($row['intro'])), 0, 60);
									$cat_name	= $row['cat_name'];
									$price 		= convert_price($row['price']);
									$area  		= $row['area'];
									$type_land	= $row['type_of_land_id'];
									$type_name  = $row['type_name'];

									$sql_cate="SELECT * FROM tbl_categories WHERE isactive=1 AND id=".$row['category_id'];
									$objdata->Query($sql_cate);
									$r_cate = $objdata->Fetch_Assoc();
									$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';
									?>
									<div class="item">
										<div class="box-thumb"><a href="<?php echo $link;?>" title="<?php echo $title;?>"><?php echo $thumb;?></a></div>
										<div class="content">
											<div class="title"><a href="<?php echo $link;?>" title="<?php echo $title;?>"><?php echo $title;?></a></div>
											<div class="info">
												<span class="date">Giá: <b><?php if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;?></b></span>
												<span class="date">Diện tích: <?php if($area==="" || $area==0) echo 'Không xác định'; else echo number_format($area).'m²';?></span>
											</div>
											<div class="info">
												<span class="date"><?php echo $cdate;?></span>
												<?php
												if($views > 0){
													echo '<span class="views">'.$views.' views</span>';
												} ?>
												<div class="intro"><?php echo $intro; ?></div>
											</div>
										</div>
									</div>
								<?php } ?>
							</div>
							<?php
							$sql="SELECT * FROM tbl_categories WHERE isactive=1 AND par_id = 0 ORDER BY `order` ASC";
							$objmysql->Query($sql);
							while ($r_cate = $objmysql->Fetch_Assoc()) {
								$cate_link = ROOTHOST.$r_cate['code'];
								echo '<section class="sec-category">
								<h2 class="sec-title"><i class="fa fa-circle" aria-hidden="true"></i><span><a href="'.$cate_link.'" title="'.$r_cate['name'].'">'.$r_cate['name'].'</a></span></h2>';

								echo '<div class="row list-items">';
								$sql_con="SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
								INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
								INNER JOIN tbl_categories AS d ON c.category_id=d.id
								WHERE c.isactive=1 AND c.category_id = ".$r_cate['id']." 
								ORDER BY c.cdate DESC, c.id DESC LIMIT 0,6";
								$objdata->Query($sql_con);
								while ($r_con = $objdata->Fetch_Assoc()) {
									$title 	= stripcslashes($r_con['title']);
									$code 	= $r_con['code'];
									$thumb 	= getThumb($r_con['thumb'], 'img-responsive', '');
									$views 	= (int)$r_con['visited'];
									$cdate 	= convert_date($r_con['cdate']);
									$intro 	= Substring(html_entity_decode(stripslashes($r_con['intro'])), 0, 60);
									$link 	= ROOTHOST.$r_cate['code'].'/'.$r_con['code'].'.html';
									$cat_name	= $r_con['cat_name'];
									$price 		= convert_price($r_con['price']);
									$area  		= $r_con['area'];
									$type_land	= $r_con['type_of_land_id'];
									$type_name  = $r_con['type_name'];
									
									echo '<div class="col-md-6 col-sm-6 item">
									<div class="box-thumb">
									<a href="'.$link.'" title="'.$title.'">'.$thumb.'</a>
									</div>
									<div class="content">
									<div class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></div>';
									echo '<div class="info">
										<span class="date">Giá: <b>';
									if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;
									echo '</b></span>
										<span class="date">Diện tích: ';
									if($area==="" || $area==0) echo 'Không xác định'; 
									else echo number_format($area).'m²';
									echo '</span>
									</div>
									<div class="info">
									<span class="date">'.$cdate.'</span>';
									if($views > 0){
										echo '<span class="views">'.$views.' views</span>';
									}
									echo '<div class="intro">'.$intro.'</div>
									</div>
									</div>
									</div>';
								}
								echo '</div>';
								echo '</section>';
							}
							?>

						</div>
						<div class="col-md-4 col-sm-4 wrap-aside">
							<?php include_once("modules/mod_content/layout.php");?>
						</div>
					</div>
				</div>
			</div>
		<?php }else{ ?> 
			<div class="component">
				<?php $tmp->loadComponent(); ?> 
			</div>
			<?php }?> -->

			<?php include_once("modules/mod_mods/footer.php");?>
		</div>
		<script type="text/javascript">
			var prevScrollpos = window.pageYOffset;
			window.onscroll = function() {
				var currentScrollPos = window.pageYOffset;
				if(currentScrollPos > 300){
					if (prevScrollpos > currentScrollPos) {
						document.getElementById("navbar").classList.add('position-fixed');
					// document.getElementById("navbar").style.top = "";
				} else {
					document.getElementById("navbar").classList.remove('position-fixed');
					// document.getElementById("navbar").style.top = "-50px";
				}
				prevScrollpos = currentScrollPos;
			}else{
				document.getElementById("navbar").classList.remove('position-fixed');
			}
		}

		$(".fa-caret-right").click(function () {
			$(".social-top>ul").toggleClass("show-social-top");
			return false;
		});
		$(".fa-caret-right").click(function () {
			$(this).toggleClass("show-icon-social");
			return false;
		});
	</script>
</body>
</html>