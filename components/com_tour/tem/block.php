<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';

$sql="SELECT * FROM tbl_place WHERE code ='".$code."'";
$objmysql->Query($sql);
$r_place = $objmysql->Fetch_Assoc();
$banner = json_decode($r_place['images']);

// Get all childrent
$sql_childs="SELECT id, name, code, Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$r_place['id'];
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
	<section class="banner">
		<div class="slider-banner">
			<?php
			foreach ($banner as $key => $value) {
				echo '<div class="item slide-bg-image" data-background-img="'.$value->url.'" data-bg-position-x="center center" data-height="300" style="background-image: url('.$value->url.'); background-position: center center; height: 40vh; width: 100%; display: inline-block;"></div>';
			}
			?>
		</div>
		<div class="breadcrumb-banner">
			<div class="container text-center">
				<h2 class="text-uppercase">Du lịch Trong Nước</h2>
				<ul>
					<li><a href="http://dulichdanko.com/"><i class="fa fa-home"></i></a></li>
					<li> Du lịch Trong Nước</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="list-tours bg-light">
		<div class="container">
			<div class="row">
				<?php
				$sql1="SELECT * FROM tbl_tour WHERE place_id IN(".$r_childs['childs'].",".$r_place['id'].") ORDER BY cdate DESC";
				$objmysql->Query($sql1);
				while ($row1 = $objmysql->Fetch_Assoc()) {
					
					?>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="card card-1 rounded-bottom"><a class="card-link effect-btn" href="http://dulichdanko.com/tour/da-nang-son-tra-hoi-an-cu-lao-cham-ba-na-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2018/10/1540778708-1jpg" alt="ĐÀ NẴNG-SƠN TRÀ-HỘI AN-CÙ LAO CHÀM- BÀ NÀ ">
							<div class="extra rounded-bottom"><span class="availability">Số chỗ: 30</span><span class="timer">4N/3Đ</span></div><span class="btn btn-info">Chi tiết</span></a>
							<div class="card-body">
								<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/da-nang-son-tra-hoi-an-cu-lao-cham-ba-na-1">ĐÀ NẴNG-SƠN TRÀ-HỘI AN-CÙ LAO CHÀM- BÀ NÀ  </a></h5>
								<div class="card-text">Khởi hành: Hàng ngày</div>
								<div class="item-price">
									<span class="new-price">3,299,000 đ</span>
									<span class="old-price">Liên hệ</span>
								</div>
							</div>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
	</section>
	
</section>