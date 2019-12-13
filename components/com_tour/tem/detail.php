<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') {
	page404();
}

// Get tour info by un_name
$sql = "SELECT * FROM tbl_tour WHERE `un_name` ='".$code."'";
$objmysql->Query($sql);
if ($objmysql->Num_rows()>0) {
	$row = $objmysql->Fetch_Assoc();
	$name 		= stripcslashes($row['name']);
	$code 		= stripcslashes($row['code']);
	$place_id 	= $row['place_id'];
	$visited 	= number_format($row['visited']);
	$images 	= json_decode($row['images']);
	
	// Update visited
	if(!isset($_SESSION['VIEW-TOUR-'.$row['id']])){
		$sql_update = "UPDATE `tbl_tour` SET `visited` = `visited` + 1 WHERE `id` = ".$row['id'];
		$_SESSION['VIEW-TOUR-'.$row['id']] = 1;
		$objdata->Exec($sql_update);
	}

	// Get place info
	$sql_place = "SELECT id, name, code FROM tbl_place WHERE `id` ='".$place_id."'";
	$objdata->Query($sql_place);
	$row_place = $objdata->Fetch_Assoc();

	// Get all childrent
	$sql_childs="SELECT Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$place_id;
	$objmysql->Query($sql_childs);
	$r_childs = $objmysql->Fetch_Assoc();

}?>
<section class="page page-contents">
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST.'diem-den/'.$row_place['code']; ?>"><?php echo $row_place['name']; ?></a></li>
				<li class="breadcrumb-item active" aria-current="page"><?php echo $name; ?></li>
			</ol>
		</div>
	</section>
	<div class="article component">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-xl-9 mb-4 mb-lg-0">
					<div class="content">
						<div class="header-tour-detail">
							<h1 class="page-title"><?php echo $name; ?></h1>
							<div class="entry-flex d-flex align-items-sm-center justify-content-between">
								<div class="left">
									<div class="social"></div>
									<div class="code text-uppercase">
										CODe: <span class="clr-blue"><?php echo $code; ?></span>
									</div>
								</div>
								<div class="viewer"><i class="ico-eye-blue"></i><?php echo $visited; ?></div>
							</div>
						</div>
						<?php if(count($images) > 0){ ?>
							<!-- slider-for-->
							<div class="slider-for slick-slider">
								<?php
								foreach ($images as $key => $value) {
									echo '<div class="item"><img src="'.$value->url.'" alt="'.$value->alt.'"></div>';
								}
								?>
							</div>
							<!-- e: slider-for-->
						<?php } ?>

						<?php if(count($images) > 1){ ?>
							<!-- slider-for-->
							<div class="slider-nav slick-slider">
								<?php
								foreach ($images as $key => $value) {
									echo '<div class="item"><img src="'.$value->url.'" alt="'.$value->alt.'"></div>';
								}
								?>
							</div>
							<!-- e: slider-for-->
						<?php } ?>
						<div class="content-tour-detail">
							<ul class="nav nav-tour-detail" id="myTab">	
								<li class="nav-item">
									<a href="#tab-content-1" id="nav-tab-1" class="nav-link active" role="tab" data-toggle="tab" aria-controls="tab-content-1" aria-selected="false">GIỚI THIỆU TOUR</a>
								</li>
								<li class="nav-item">
									<a href="#tab-content-2" id="nav-tab-2" class="nav-link" role="tab" data-toggle="tab" aria-controls="tab-content-2" aria-selected="false">LỊCH TRÌNH TOUR</a>
								</li>
								<li class="nav-item">
									<a href="#tab-content-3" id="nav-tab-3" class="nav-link" role="tab" data-toggle="tab" aria-controls="tab-content-3" aria-selected="false">CHÍNH SÁCH</a>
								</li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content tab-content-tour-detail">
								<div class="tab-pane container fade show active" id="tab-content-1" role="tabpanel" aria-labelledby="nav-tab-1"><?php echo $row['content']; ?></div>
								<div class="tab-pane container fade show" id="tab-content-2" role="tabpanel" aria-labelledby="nav-tab-3"><?php echo $row['schedule']; ?></div>
								<div class="tab-pane container fade show" id="tab-content-3" role="tabpanel" aria-labelledby="nav-tab-3"><?php echo $row['policy']; ?></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 mb-2 mb-lg-0">
					<div class="slidebar-fixed">
						<div class="inner-wrapper-sticky" style="position: relative;">                        
							<div class="info-tour">
								<div class="heading-flex">
									<h3 class="title">thông tin<span> tour</span></h3>
								</div>
								<div class="item-price">
									<div class="new-price">3,299,000 đ</div>
									<div class="old-price">Liên hệ</div>
								</div>                            
								<hr class="gaps">
								<ul class="list-unstyled list-info-tour">
									<li>
										<i class="ico-map-marker-blue"></i>
										Nơi khởi hành: <strong>Hà Nội</strong>
									</li>                                
									<li>
										<i class="ico-time-blue"></i>
										Thời gian: <strong>4N/3Đ</strong>
									</li>                                
									<li>
										<i class="ico-calendar-blue"></i>
										Khởi hành: <strong>Hàng ngày</strong>
									</li>                                
									<li>
										<i class="ico-paper-plane-blue"></i>
										Phương tiện: <strong>Ô tô, Máy bay</strong>
									</li>                                
									<li>
										<i class="ico-users-blue"></i>
										Số chỗ: <strong>30</strong>
									</li>                            
								</ul>                            
								<div class="text-center">
									<a class="btn btn-info" href="http://dulichdanko.com/booking/tour/da-nang-son-tra-hoi-an-cu-lao-cham-ba-na-1">Đặt ngay</a>
								</div>                        
							</div>                      
						</div>
					</div>
				</div>
			</div>
		</div>

		<?php
		if($r_childs['childs'] == '') $r_childs['childs'] = 0;
		$sql_release="SELECT * FROM tbl_tour WHERE isactive=1 AND place_id IN(".$r_childs['childs'].",".$place_id.") AND id <>".$row['id'];
		$objmysql->Query($sql_release);
		if($objmysql->Num_rows() > 0){
			?>
			<!-- related tour-->
			<div class="related-tour bg-light">
				<div class="container">
					<h2 class="text-center text-uppercase"> tour liên quan</h2>
					<div class="slider-related-tour slick-slider">
						<?php
						while ($row_rlease = $objmysql->Fetch_Assoc()) {
							$rlease_name = stripcslashes($row_rlease['name']);
							$rlease_link = ROOTHOST.'tour/'.$row_rlease['un_name'];
							$rlease_images = json_decode($row_rlease['images']);
							$rlease_thumb = getThumb($rlease_images[0]->url, 'rounded w-100', $rlease_images[0]->alt);
							$rlease_price1 = number_format($row_rlease['price1']);
							$rlease_price2 = number_format($row_rlease['price2']);
							?>
							<div class="item">
								<div class="card card-1 rounded-bottom">
									<a class="card-link effect-btn" href="<?php echo $rlease_link; ?>" title="<?php echo $rlease_name; ?>">
										<?php echo $rlease_thumb; ?>
										<div class="extra rounded-bottom">
											<span class="availability">Số chỗ: <?php echo $row_rlease['number_of_holes']; ?></span>
											<span class="timer"><?php echo $row_rlease['days']; ?></span>
										</div>
										<span class="btn btn-info">Chi tiết</span>
									</a>
									<div class="card-body">
										<h5 class="cart-title">
											<a href="<?php echo $rlease_link; ?>" title="<?php echo $rlease_name; ?>"><?php echo $rlease_name; ?></a>
										</h5>                               
										<div class="card-text">Khởi hành: Hàng ngày</div>                          
										<div class="item-price">
											<span class="new-price"><?php echo $rlease_price2; ?> đ</span>
											<span class="old-price"><?php echo $rlease_price1; ?> đ</span>
										</div>
									</div>
								</div>
							</div>
							<?php
						}
						?>
					</div>
				</div>
			</div>
			<!-- e: related tour-->
		<?php } ?>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		var sidebar = new StickySidebar('.slidebar-fixed', {topSpacing: 90, bottomSpacing: 20});
		$('#myTab .nav-link').click(function () {
			var sidebar = new StickySidebar('.slidebar-fixed', {topSpacing: 90, bottomSpacing: 20});
		});
		sidebar.updateSticky();
		$(window).scroll(function () {
			if ($(this).scrollTop() < 90) {
				$('.slidebar-fixed').removeAttr('style');
				$('.inner-wrapper-sticky').removeAttr('style');
			}
		})
	});
	
	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		speed:800,
		asNavFor: '.slider-nav'
	});

	$('.slider-nav').slick({
		slidesToShow: 5,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: false,
		focusOnSelect: true,
		arrows:true,
		speed:800,
		responsive: [
		{
			breakpoint: 566,
			settings: {
				slidesToShow: 3
			}
		}
		]
	});

	$('.slider-related-tour').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		dots: false,
		arrows:true,
		speed:700,
		responsive: [
		{
			breakpoint: 992,
			settings: {
				slidesToShow: 3
			}
		},
		{
			breakpoint: 768,
			settings: {
				slidesToShow: 2
			}
		},
		{
			breakpoint: 566,
			settings: {
				slidesToShow: 1
			}
		}
		]
	});
</script>