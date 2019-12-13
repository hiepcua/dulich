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
			if(count($banner) > 0){
				foreach ($banner as $key => $value) {
					if(file_exists($value->url)){
						echo '<div class="item slide-bg-image" data-background-img="'.$value->url.'" data-bg-position-x="center center" data-height="300" style="background-image: url('.$value->url.'); background-position: center center; height: 40vh; width: 100%; display: inline-block;"></div>';
					}else{
						echo '<div class="item slide-bg-image" data-background-img="'.ROOTHOST.BANNER_DEFAULT.'" data-bg-position-x="center center" data-height="300" style="background-image: url('.ROOTHOST.BANNER_DEFAULT.'); background-position: center center; height: 40vh; width: 100%; display: inline-block;"></div>';
					}
				}
			}else{
				echo '<div class="item slide-bg-image" data-background-img="'.ROOTHOST.BANNER_DEFAULT.'" data-bg-position-x="center center" data-height="300" style="background-image: url('.ROOTHOST.BANNER_DEFAULT.'); background-position: center center; height: 40vh; width: 100%; display: inline-block;"></div>';
			}
			?>
		</div>
		<div class="breadcrumb-banner">
			<div class="container text-center">
				<h2 class="text-uppercase"><?php echo $r_place['name']; ?></h2>
				<ul>
					<li><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
					<li><?php echo $r_place['name']; ?></li>
				</ul>
			</div>
		</div>
	</section>

	<section class="list-tours bg-light">
		<div class="container">
			<?php if($r_place['par_id'] == 0){ ?>
				<ul class="nav nav-tour justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="<?php echo ROOTHOST.'diem-den/'.$r_place['code']; ?>">Tất cả</a></li>
					<?php
					// Take the direct directly children
					$sqldir="SELECT `name`, `code` FROM tbl_place WHERE isactive=1 AND par_id = ".$r_place['id'];
					$objmysql->Query($sqldir);
					while ($rowdir = $objmysql->Fetch_Assoc()) {
						echo '<li class="nav-item"><a class="nav-link" href="'.ROOTHOST.'diem-den/'.$rowdir['code'].'">'.$rowdir['name'].'</a></li>';
					}
					?>
				</ul>
			<?php } ?>
			<div class="row">
				<?php
				$star = ($cur_page - 1) * $MAX_ROWS;
				$sql1="SELECT * FROM tbl_tour WHERE place_id IN(".$r_childs['childs'].",".$r_place['id'].") ORDER BY cdate DESC LIMIT $star,".$MAX_ROWS;
				$objmysql->Query($sql1);
				while ($row1 = $objmysql->Fetch_Assoc()) {
					$name = stripcslashes($row1['name']);
					$link = ROOTHOST.'tour/'.$row1['un_name'];
					$images = json_decode($row1['images']);
					$thumb = getThumb($images[0]->url, 'card-img-top rounded', $images[0]->alt);
					$days = stripcslashes($row1['days']);
					$price1 = number_format($row1['price1']);
					$price2 = number_format($row1['price2']);
					$num_of_holes = (int)$row1['number_of_holes'];
					?>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="card card-1 rounded-bottom">
							<a class="card-link effect-btn" href="<?php echo $link; ?>">
								<?php echo $thumb; ?>
								<div class="extra rounded-bottom">
									<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
									<span class="timer"><?php echo $days; ?></span>
								</div>
								<span class="btn btn-info">Chi tiết</span>
							</a>
							<div class="card-body">
								<h5 class="cart-title">
									<a href="<?php echo $link; ?>"><?php echo $name; ?></a>
								</h5>
								<div class="card-text">Khởi hành: Hàng ngày</div>
								<div class="item-price">
									<span class="new-price"><?php echo $price2; ?> đ</span>
									<span class="old-price"><?php echo $price1; ?> đ</span>
								</div>
							</div>
						</div>
					</div>
				<?php } ?>
			</div>

			<div class="text-center">
				<?php paging($total_rows,$MAX_ROWS,$cur_page); ?>
			</div>
		</div>
	</section>
	
</section>