<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') page404();

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
									<h3 class="title">thông tin<span> tour</span></h3>
								</div>
								<div class="item-price">
									<div class="new-price"><?php echo $row['price2']; ?></div>
									<div class="old-price"><?php echo $row['price1']; ?></div>
								</div>                            
								<hr class="gaps">
								<ul class="list-unstyled list-info-tour">
									<li>
										<i class="ico-map-marker-blue"></i>
										Nơi khởi hành: <strong><?php echo $row['starting_gate']; ?></strong>
									</li>                                
									<li>
										<i class="ico-time-blue"></i>
										Thời gian: <strong><?php echo $row['days']; ?></strong>
									</li>                                
									<li>
										<i class="ico-calendar-blue"></i>
										Khởi hành: <strong>Hàng ngày</strong>
									</li>                                
									<li>
										<i class="ico-paper-plane-blue"></i>
										Phương tiện: <strong><?php echo $row['vehicle']; ?></strong>
									</li>                                
									<li>
										<i class="ico-users-blue"></i>
										Số chỗ: <strong><?php echo $row['number_of_holes']; ?></strong>
									</li>                            
								</ul>                            
								<div class="text-center">
									<a class="btn btn-info" href="<?php echo ROOTHOST.'booking/tour/'.$row['un_name']; ?>">Đặt ngay</a>
								</div>                        
							</div>                      
						</div>
					</div>
				</div>
			</div>
			<hr class="gaps gaps-2x">
			<form id="frm_booking" method="POST" action="<?php echo ROOTHOST.'booking/tour/booking/step2'; ?>">
				<input type="hidden" name="txt_booking">
				<input type="hidden" name="txt_tour" value="<?php echo $row['id']; ?>">
				<div class="row">
					<div class="col-lg-6">
						<div class="book-dskh">
							<div class="heading">
								<h3 class="h5 text-uppercase">Số hành khách</h3>
							</div>
							<div class="form reset-select">
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Số người lớn:</label>
									<div class="col-md-9">
										<input class="form-control" type="text" name="adult">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Số trẻ em:</label>
									<div class="col-md-9">
										<input class="form-control" type="text" name="child">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Số em bé:</label>
									<div class="col-md-9">
										<input class="form-control" type="text" name="baby">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Chọn ngày đi</label>
									<div class="col-md-9">
										<div class="start-date">
											<input class="form-control" type="date" name="start_date">
										</div>
									</div>
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
									<div class="col-md-9">
										<input class="form-control" type="text" name="name" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Điện thoại:</label>
									<div class="col-md-9">
										<input class="form-control" type="text" name="tel" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Email:</label>
									<div class="col-md-9">
										<input class="form-control" type="text" name="email" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">Địa chỉ</label>
									<div class="col-md-9">
										<input class="form-control" name="address" type="text">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="book-footer text-center">
					<button class="btn btn-info text-uppercase min-width-10rem btn-lg" type="submit">Đặt ngay</button>
				</div>
			</form>
		</div>
	</div>
</div>