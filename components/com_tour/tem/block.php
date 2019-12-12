<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') page404();

$sql="SELECT * FROM tbl_place WHERE code ='".$code."'";
$objmysql->Query($sql);
$r_cate = $objmysql->Fetch_Assoc();

// Get all childrent
$sql_childs="SELECT id, name, code, Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$r_cate['id'];
$objmysql->Query($sql_childs);
$r_childs = $objmysql->Fetch_Assoc();

// Begin pagging
define('OBJ_PAGE','BLOCK_TOUR');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_tour WHERE place_id IN(".$r_childs['childs'].")";
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

$MAX_ROWS = 9;
if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/$MAX_ROWS)){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/$MAX_ROWS);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<section class="page page-contents">
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
				<li class="breadcrumb-item active" aria-current="page"><?php echo $r_cate['name']; ?></li>
			</ol>
		</div>
	</section>

	<div class="container">
		<div class="page-content">
			<div class="row">
				<div class="col-lg-8 col-xl-9 mb-3 mb-lg-0">
					<h1 class="page-title"><?php echo $r_cate['name']; ?></h1>
					<div class="blog-list">
						<?php
						$star = ($cur_page - 1) * $MAX_ROWS;
						$sql = "SELECT * FROM tbl_tour WHERE isactive=1 AND place_id IN(".$r_childs['childs'].") ORDER BY `cdate` DESC LIMIT $star,".$MAX_ROWS;
						$objmysql->Query($sql);
						while ($row = $objmysql->Fetch_Assoc()) {
							$title 	= stripcslashes($row['name']);
							$un_name= $row['un_name'];
							$images = json_decode($row['images']);
							$thumb 	= getThumb($images[0]->url, 'img-responsive', $images[0]->alt);
							$cdate 	= convert_date($row['cdate']);
							$intro 	= Substring(html_entity_decode(stripslashes($row['intro'])), 0, 60);
							$link 	= ROOTHOST.'bai-viet/'.$un_name;
							?>
							<article class="blog-item">
								<div class="row">
									<div class="col-md-6 mb-3 mb-md-0">
										<figure><a href="<?php echo $link; ?>"><?php echo $thumb; ?></a></figure>
									</div>
									<div class="col-md-6">
										<h3><a href="<?php echo $link; ?>"><?php echo $title; ?></a></h3>
										<p class="time clr-blue"><i class="ico-time-blue-2"></i> &nbsp;<?php echo $cdate; ?></p>
										<div class="desc dotdotdot ddd-truncated" style="overflow-wrap: break-word;"><?php echo $intro;?></div>
									</div>
								</div>
							</article>
							<?php
						}
						?>
					</div>
				</div>

				<div class="col-lg-4 col-xl-3">
					<?php $this->loadModule('ads1'); ?>
					<?php $this->loadModule('ads2'); ?>
				</div>
			</div>
		</div>
	</div>
</section>