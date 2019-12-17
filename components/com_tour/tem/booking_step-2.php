<?php
$thisUrl = curPageURL();
$p_tour_id = isset($_POST['txt_tour']) ? addslashes(trim($_POST['txt_tour'])) : '';
if($p_tour_id == '') {
	page404();
}

// Get tour info by id
$sql = "SELECT * FROM tbl_tour WHERE `id` ='".$p_tour_id."'";
$objmysql->Query($sql);
if ($objmysql->Num_rows()>0) {
	$row = $objmysql->Fetch_Assoc();
	$name 		= stripcslashes($row['name']);
	$code 		= stripcslashes($row['code']);
	$place_id 	= $row['place_id'];
	$visited 	= number_format($row['visited']);
	$images 	= json_decode($row['images']);
	$thumb 		= getThumb($images[0]->url, 'rounded img-responsive', $name);
}?>
<section class="page page-contents">
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST.'tour/'.$row['un_name']; ?>"><?php echo $row['name']; ?></a></li>
				<li class="breadcrumb-item active" aria-current="page">Booking tour</li>
			</ol>
		</div>
	</section>

	<div class="container">
		<div class="tour-detail checkout">
			<div class="row">
				<div class="col-md-7 col-lg-8 col-xl-9 mb-3 mb-lg-0">
					<div class="row">
						<div class="col-lg-6">
							<figure class="figure-img">
								<?php echo $thumb; ?>
							</figure>
						</div>
						<div class="col-lg-6">
							<div class="header-tour-detail">
								<h1 class="page-title"><?php echo $name; ?></h1>
								<div class="code">Code: <span class="clr-blue">DK-TN-71</span></div>
								<ul class="list-unstyled list-info-tour">
									<li><i class="ico-map-marker-blue"></i>Nơi khởi hành: <strong><?php echo $row['starting_gate']; ?></strong></li>
									<li><i class="ico-time-blue"></i>Thời gian: <strong><?php echo TOUR_TIME[$row['days']]; ?></strong></li>
									<li><i class="ico-calendar-blue"></i>Khởi hành: <strong>Hàng ngày</strong></li>
									<li><i class="ico-paper-plane-blue"></i>Phương tiện: <strong><?php echo $row['vehicle']; ?></strong></li>
									<li><i class="ico-users-blue"></i>Số chỗ: <strong><?php echo $row['number_of_holes']; ?></strong></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5 col-lg-4 col-xl-3 mb-5 mb-lg-0">
					<div class="slidebar-fixed">
						<div class="inner-wrapper-sticky" style="position: relative;">                        
							<div class="info-tour">
								<div class="heading-flex">
									<h3 class="title">GIÁ TOUR</h3>
								</div>
								<div class="item-price">
									<div class="new-price"><?php echo number_format($row['price2']); ?> đ</div>
									<div class="old-price"><?php echo number_format($row['price1']); ?> đ</div>
								</div>                      
							</div>                      
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="gaps gaps-2x">
		<form method="POST" action="<?php echo ROOTHOST.'booking/tour/booking'.'/'.$row['un_name'].'/step2';?>" accept-charset="UTF-8">
			<input type="hidden" name="txt_tour" value="<?php echo (int)$_POST['txt_tour']; ?>">
			<input type="hidden" name="adult" value="<?php echo (int)$_POST['adult']; ?>">
			<input type="hidden" name="child" value="<?php echo (int)$_POST['child']; ?>">
			<input type="hidden" name="baby" value="<?php echo (int)$_POST['baby']; ?>">
			<input type="hidden" name="start_date" value="<?php echo (int)$_POST['start_date']; ?>">
			<input type="hidden" name="name" value="<?php echo $_POST['name']; ?>">
			<input type="hidden" name="tel" value="<?php echo $_POST['tel']; ?>">
			<input type="hidden" name="email" value="<?php echo $_POST['email']; ?>">
			<input type="hidden" name="address" value="<?php echo $_POST['address']; ?>">
			<div class="row">
				<div class="col-lg-6">
					<div class="book-dskh">
						<div class="heading">
							<h3 class="h5 text-uppercase">Số hành khách</h3>
						</div>
						<div class="form reset-select">
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Số người lớn:</label>
								<div class="col-md-9"><?php echo (int)$_POST['adult']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Số trẻ em:</label>
								<div class="col-md-9"><?php echo (int)$_POST['child']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Số em bé:</label>
								<div class="col-md-9"><?php echo (int)$_POST['baby']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Ngày đi</label>
								<div class="col-md-9"><?php echo date('d-m-Y', strtotime($_POST['start_date'])); ?></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="book-dskh">
						<div class="heading">
							<h3 class="h5 text-uppercase">Thông tin liên hệ</h3>
						</div>
						<div class="form reset-select">
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Họ và tên:</label>
								<div class="col-md-9"><?php echo $_POST['name']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Điện thoại:</label>
								<div class="col-md-9"><?php echo $_POST['tel']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Email:</label>
								<div class="col-md-9"><?php echo $_POST['email']; ?></div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 col-form-label">Địa chỉ</label>
								<div class="col-md-9"><?php echo $_POST['address']; ?></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- e: .row-->
			<!-- terms-->

			<!-- e: .terms-->
			<div class="book-footer text-center">
				<button class="btn btn-info text-uppercase min-width-10rem btn-lg" type="submit">Đặt ngay</button>
			</div>
		</form>
	</div>
</div>