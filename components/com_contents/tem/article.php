<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';

$sql="SELECT * FROM tbl_contents WHERE `code` ='".$code."'";
$objmysql->Query($sql); 
if ($objmysql->Num_rows()>0) {
	$result = $objmysql->Fetch_Assoc();
	$con_id = $result['id'];

	if(!isset($_SESSION['VIEW-CONTENT-'.$con_id])){
		$sql_update = "UPDATE `tbl_contents` SET `visited` = `visited` + 1 WHERE `id` = ".$con_id;
		$_SESSION['VIEW-CONTENT-'.$con_id] = 1;
		$objdata->Exec($sql_update);
	}

	$cat_id 	= $result['category_id'];
	$views 		= $result['visited'];
	$cdate 		= convert_date($result['cdate']);
	$thumb 		= getThumb($result['thumb'], '', 'img-responsive');
	$link  		= ROOTHOST.'bai-viet/'.$result['code'];

	/* Get category info */
	$sql2="SELECT * FROM tbl_categories WHERE id=".$cat_id;
	$objmysql->Query($sql2);
	$r_cate = $objmysql->Fetch_Assoc();
}
?>
<section class="page page-contents">
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST.'chuyen-muc/'.$r_cate['code']; ?>"><?php echo $r_cate['name']; ?></a></li>
				<li class="breadcrumb-item active" aria-current="page"><?php echo $result['title']; ?></li>
			</ol>
		</div>
	</section>
	<div class="article component">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-xl-9 mb-3 mb-lg-0">
					<div class="content">
						<h1 class="entry-title"><?php echo stripslashes(html_entity_decode($result['title'])); ?></h1>
						<p class="entry-meta"><i class="ico-time-green"></i> <?php echo $cdate; ?></p>
						<div class="fulltext"><?php echo stripcslashes($result['fulltext']); ?></div>
					</div>

					<!-- Related news -->
					<div class="releated_news">
						<h2><span>Bài viết liên quan</span></h2>
						<ul class="list-unstyled">
							<?php 
							$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND id <> $con_id AND category_id = $cat_id ORDER BY cdate DESC LIMIT 0,6";
							$objmysql->Query($sql);
							while($r = $objmysql->Fetch_Assoc()) { 
								$name = stripslashes(html_entity_decode($r['title'])); 
								$code = $r['code'];
								$link = ROOTHOST.'bai-viet/'.$code;
								echo '<li><a href="'.$link.'" title="'.$name.'"><i class="fa fa-circle" aria-hidden="true"></i>'.$name.'</a></li>';
							} ?>
						</ul>
					</div>
					<!-- End Related news -->
				</div>

				<div class="col-lg-4 col-xl-3">
					<?php $this->loadModule('ads1'); ?>
					<?php $this->loadModule('ads2'); ?>
				</div>
			</div>
		</div>
	</div>
</div>