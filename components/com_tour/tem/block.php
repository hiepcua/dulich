<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') page404();

$sql="SELECT * FROM tbl_place WHERE code ='".$code."'";
$objmysql->Query($sql);
$r_cate = $objmysql->Fetch_Assoc();

// Begin pagging
define('OBJ_PAGE','BLOCK_TOUR');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_tour WHERE place_id = ".$r_cate['id'];
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
						<article class="blog-item">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<figure><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan"><img src="http://dulichdanko.com/upload/2018/11/1542097537-sapa-mua-he1jpgjpg" alt="Du Lịch Sapa mùa hè thú vị và hấp dẫn"></a></figure>
								</div>
								<div class="col-md-6">
									<h3><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan">Du Lịch Sapa mùa hè thú vị và hấp dẫn</a></h3>
									<p class="time clr-blue"><i class="ico-time-blue-2"></i> &nbsp;15:25 - 13/11/2018</p>
									<div class="desc dotdotdot ddd-truncated" style="overflow-wrap: break-word;">Chắc hẳn có rất nhiều người thắc mắc rằng du lịch Sapa vào mùa hè có nên đi hay không? Bởi vì họ không biết thời tiết và nhiệt độ tại Sapa như thế nào, trời mùa hè có hay mưa không. Du lịch Sapa mùa hè có nên đi hay không? Khi bắt đầu từ thán 6 – 7 -8 chính… </div>
								</div>
							</div>
						</article>
						<article class="blog-item">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<figure><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan"><img src="http://dulichdanko.com/upload/2018/11/1542097537-sapa-mua-he1jpgjpg" alt="Du Lịch Sapa mùa hè thú vị và hấp dẫn"></a></figure>
								</div>
								<div class="col-md-6">
									<h3><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan">Du Lịch Sapa mùa hè thú vị và hấp dẫn</a></h3>
									<p class="time clr-blue"><i class="ico-time-blue-2"></i> &nbsp;15:25 - 13/11/2018</p>
									<div class="desc dotdotdot ddd-truncated" style="overflow-wrap: break-word;">Chắc hẳn có rất nhiều người thắc mắc rằng du lịch Sapa vào mùa hè có nên đi hay không? Bởi vì họ không biết thời tiết và nhiệt độ tại Sapa như thế nào, trời mùa hè có hay mưa không. Du lịch Sapa mùa hè có nên đi hay không? Khi bắt đầu từ thán 6 – 7 -8 chính… </div>
								</div>
							</div>
						</article>
						<article class="blog-item">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<figure><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan"><img src="http://dulichdanko.com/upload/2018/11/1542097537-sapa-mua-he1jpgjpg" alt="Du Lịch Sapa mùa hè thú vị và hấp dẫn"></a></figure>
								</div>
								<div class="col-md-6">
									<h3><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan">Du Lịch Sapa mùa hè thú vị và hấp dẫn</a></h3>
									<p class="time clr-blue"><i class="ico-time-blue-2"></i> &nbsp;15:25 - 13/11/2018</p>
									<div class="desc dotdotdot ddd-truncated" style="overflow-wrap: break-word;">Chắc hẳn có rất nhiều người thắc mắc rằng du lịch Sapa vào mùa hè có nên đi hay không? Bởi vì họ không biết thời tiết và nhiệt độ tại Sapa như thế nào, trời mùa hè có hay mưa không. Du lịch Sapa mùa hè có nên đi hay không? Khi bắt đầu từ thán 6 – 7 -8 chính… </div>
								</div>
							</div>
						</article>
						<article class="blog-item">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<figure><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan"><img src="http://dulichdanko.com/upload/2018/11/1542097537-sapa-mua-he1jpgjpg" alt="Du Lịch Sapa mùa hè thú vị và hấp dẫn"></a></figure>
								</div>
								<div class="col-md-6">
									<h3><a href="http://dulichdanko.com/bai-viet/du-lich-sapa-mua-he-thu-vi-va-hap-dan">Du Lịch Sapa mùa hè thú vị và hấp dẫn</a></h3>
									<p class="time clr-blue"><i class="ico-time-blue-2"></i> &nbsp;15:25 - 13/11/2018</p>
									<div class="desc dotdotdot ddd-truncated" style="overflow-wrap: break-word;">Chắc hẳn có rất nhiều người thắc mắc rằng du lịch Sapa vào mùa hè có nên đi hay không? Bởi vì họ không biết thời tiết và nhiệt độ tại Sapa như thế nào, trời mùa hè có hay mưa không. Du lịch Sapa mùa hè có nên đi hay không? Khi bắt đầu từ thán 6 – 7 -8 chính… </div>
								</div>
							</div>
						</article>
					</div>
				</div>

				<div class="col-lg-4 col-xl-3">
					<div class="row">

						<div class="col-lg-12 col-md-6">

							<!-- blog-special-->

							<div class="blog-special">

								<div class="heading-flex sidebar-title">

									<div class="title h4">bài viết nổi bật</div>

								</div>

								<div class="bg-light">

									<div class="special-main">

										
										
										<figure><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-45-cho-hyundai-aero-space"><img src="http://dulichdanko.com/upload/2018/10/1538799485-highclass-913x600jpg" alt="Cho thuê xe du lịch 45 chỗ Hyundai Aero Space "></a></figure>

										<h3><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-45-cho-hyundai-aero-space">Cho thuê xe du lịch 45 chỗ Hyundai Aero Space </a></h3>

										<div class="desc">Với tiêu chí chất lượng hoàn hảo, chúng tôi đã nhập về c&amp;aac ...</div>

										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</div>

									<ul class="list-unstyled list-blog-special">

										
										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-hyundai-county-29-cho"><img src="http://dulichdanko.com/upload/2018/10/1538799106-img-0409-1-300x225-1-266x200jpg" alt="Cho thuê xe du lịch Hyundai County 29 chỗ "></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-hyundai-county-29-cho">Cho thuê xe du lịch Hyundai County 29 chỗ </a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-29-cho"><img src="http://dulichdanko.com/upload/2018/10/1538800303-img-0406-1jpg" alt="Cho thuê xe du lịch 29 chỗ "></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-29-cho">Cho thuê xe du lịch 29 chỗ </a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-16-cho"><img src="http://dulichdanko.com/upload/2018/10/1538800532-img-0407jpg" alt="Cho thuê xe du lịch 16 chỗ "></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/cho-thue-xe-du-lich-16-cho">Cho thuê xe du lịch 16 chỗ </a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/khuyen-mai-cac-duong-bay-quoc-te"><img src="http://dulichdanko.com/upload/2018/10/1539054292-vi-300x141-2jpg" alt="KHUYẾN MÃI CÁC ĐƯỜNG BAY QUỐC TẾ"></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/khuyen-mai-cac-duong-bay-quoc-te">KHUYẾN MÃI CÁC ĐƯỜNG BAY QUỐC TẾ</a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/tan-huong-nhung-cam-giac-thu-vi-cua-thien-duong-du-lich-vinpearl-land-phu-quoc-dang-cap-3"><img src="http://dulichdanko.com/upload/2018/10/1539076860-anh2-1024x768jpg" alt="Tận hưởng những cảm giác thú vị của thiên đường du lịch – Vinpearl land Phu Quoc ĐẲNG CẤP 3***"></a></figure>

											<div class="text">

												<h4 class="dotdotdot ddd-truncated" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/tan-huong-nhung-cam-giac-thu-vi-cua-thien-duong-du-lich-vinpearl-land-phu-quoc-dang-cap-3">Tận hưởng những cảm giác thú vị của thiên đường du lịch –… </a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/danko-san-ve-re-moi-luc"><img src="http://dulichdanko.com/upload/2018/10/1539053574-2-2jpg" alt="DANKO SĂN VÉ RẺ MỌI LÚC"></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/danko-san-ve-re-moi-luc">DANKO SĂN VÉ RẺ MỌI LÚC</a></h4>

											</div>

										</li>

										
										
										
										<li class="d-flex">

											<figure><a href="http://dulichdanko.com/bai-viet/lac-giua-may-troi-tai-3-resort-dep-nhat-ninh-binh"><img src="http://dulichdanko.com/upload/2018/10/1539076507-emeralda-resort-5-768x432jpg" alt="“LẠC GIỮA MÂY TRỜI” TẠI 3 RESORT ĐẸP NHẤT NINH BÌNH"></a></figure>

											<div class="text">

												<h4 class="dotdotdot" style="overflow-wrap: break-word;"><a href="http://dulichdanko.com/bai-viet/lac-giua-may-troi-tai-3-resort-dep-nhat-ninh-binh">“LẠC GIỮA MÂY TRỜI” TẠI 3 RESORT ĐẸP NHẤT NINH BÌNH</a></h4>

											</div>

										</li>

										
										


									</ul>

								</div>

							</div>

							<!-- e: blog-special-->

						</div>

						<div class="col-lg-12 col-md-6">

							<!-- tour special-->

							<div class="tour-special">

								<div class="heading-flex sidebar-title">

									<div class="title h4">Tour <span>nổi bật</span></div>

								</div>

								<div class="slider-tour-special slick-initialized slick-slider slick-dotted"><div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 2637px; transform: translate3d(-293px, 0px, 0px);"><div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" tabindex="-1" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572928114-cot-co-lung-cujpg" alt="TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-10%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1">TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN </a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,250,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" role="tabpanel" id="slick-slide10" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020" tabindex="0"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/12/1575608089-banner-dangbaijpg" alt="CHƯƠNG TRÌNH XEM BÓNG ĐÁ VÒNG LOẠI WC 2020">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 25</span><span class="timer">5N/4Đ</span></div><span class="sale-off">-20%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020" tabindex="0">CHƯƠNG TRÌNH XEM BÓNG ĐÁ VÒNG LOẠI WC 2020</a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">7,900,000 đ</span><span class="old-price">9,900,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1" role="tabpanel" id="slick-slide11" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572929775-tu-lejpg" alt="TOUR MÙ CANG CHẢI MÙA LÚA LÚA CHÍN - TẮM SUỐI NƯỚC NÓNG BẢN LƯỚT – MÂM XÔI – TÚ LỆ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-8%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le" tabindex="-1">TOUR MÙ CANG CHẢI MÙA LÚA LÚA CHÍN - TẮM SUỐI NƯỚC NÓNG BẢN LƯỚT – MÂM XÔI – TÚ LỆ</a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,280,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide" data-slick-index="2" aria-hidden="true" tabindex="-1" role="tabpanel" id="slick-slide12" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572928679-thac-ban-giocjpg" alt="TOUR HÀ NỘI – HỒ BA BỂ - THÁC BẢN GIỐC – ĐỘNG NGƯỜM NGAO – SUỐI LÊ NIN – PĂC BÓ ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-10%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo" tabindex="-1">TOUR HÀ NỘI – HỒ BA BỂ - THÁC BẢN GIỐC – ĐỘNG NGƯỜM NGAO – SUỐI LÊ NIN – PĂC BÓ </a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,250,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide" data-slick-index="3" aria-hidden="true" tabindex="-1" role="tabpanel" id="slick-slide13" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572928114-cot-co-lung-cujpg" alt="TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-10%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1">TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN </a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,250,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide slick-cloned" data-slick-index="4" aria-hidden="true" tabindex="-1" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/12/1575608089-banner-dangbaijpg" alt="CHƯƠNG TRÌNH XEM BÓNG ĐÁ VÒNG LOẠI WC 2020">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 25</span><span class="timer">5N/4Đ</span></div><span class="sale-off">-20%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/chuong-trinh-xem-bong-da-vong-loai-wc-2020" tabindex="-1">CHƯƠNG TRÌNH XEM BÓNG ĐÁ VÒNG LOẠI WC 2020</a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">7,900,000 đ</span><span class="old-price">9,900,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide slick-cloned" data-slick-index="5" aria-hidden="true" tabindex="-1" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572929775-tu-lejpg" alt="TOUR MÙ CANG CHẢI MÙA LÚA LÚA CHÍN - TẮM SUỐI NƯỚC NÓNG BẢN LƯỚT – MÂM XÔI – TÚ LỆ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-8%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-mu-cang-chai-mua-lua-lua-chin-tam-suoi-nuoc-nong-ban-luot-mam-xoi-tu-le" tabindex="-1">TOUR MÙ CANG CHẢI MÙA LÚA LÚA CHÍN - TẮM SUỐI NƯỚC NÓNG BẢN LƯỚT – MÂM XÔI – TÚ LỆ</a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,280,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide slick-cloned" data-slick-index="6" aria-hidden="true" tabindex="-1" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572928679-thac-ban-giocjpg" alt="TOUR HÀ NỘI – HỒ BA BỂ - THÁC BẢN GIỐC – ĐỘNG NGƯỜM NGAO – SUỐI LÊ NIN – PĂC BÓ ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-10%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-ha-noi-ho-ba-be-thac-ban-gioc-dong-nguom-ngao-suoi-le-nin-pac-bo" tabindex="-1">TOUR HÀ NỘI – HỒ BA BỂ - THÁC BẢN GIỐC – ĐỘNG NGƯỜM NGAO – SUỐI LÊ NIN – PĂC BÓ </a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,250,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div><div class="slick-slide slick-cloned" data-slick-index="7" aria-hidden="true" tabindex="-1" style="width: 293px;"><div><div class="item" style="width: 100%; display: inline-block;">

									<div class="card card-1 rounded-bottom mb-col"><a class="card-link effect-more" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1"><img class="card-img-top rounded" src="http://dulichdanko.com/upload/2019/11/1572928114-cot-co-lung-cujpg" alt="TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN ">

										<div class="extra rounded-bottom"><span class="availability">Số chỗ: 15</span><span class="timer">3N/2Đ</span></div><span class="sale-off">-10%</span><span class="btn btn-info" href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van">Chi tiết</span></a>

										<div class="card-body">

											<h5 class="cart-title"> <a href="http://dulichdanko.com/tour/tour-du-lich-ha-noi-quan-ba-yen-minh-cot-co-lung-cu-pho-co-dong-van" tabindex="-1">TOUR DU LỊCH: HÀ NỘI – QUẢN BẠ - YÊN MINH – CỘT CỜ LŨNG CÚ –  PHỐ CỔ ĐỒNG VĂN </a></h5>

											<div class="card-text">Khởi hành: 26/09/2018</div>

											<div class="item-price"><span class="new-price">2,250,000 đ</span><span class="old-price">2,500,000 đ</span></div>

										</div>

									</div>

								</div></div></div></div></div><ul class="slick-dots" style="display: block;" role="tablist"><li class="slick-active" role="presentation"><button type="button" role="tab" id="slick-slide-control10" aria-controls="slick-slide10" aria-label="1 of 4" tabindex="0" aria-selected="true">1</button></li><li role="presentation"><button type="button" role="tab" id="slick-slide-control11" aria-controls="slick-slide11" aria-label="2 of 4" tabindex="-1">2</button></li><li role="presentation"><button type="button" role="tab" id="slick-slide-control12" aria-controls="slick-slide12" aria-label="3 of 4" tabindex="-1">3</button></li><li role="presentation"><button type="button" role="tab" id="slick-slide-control13" aria-controls="slick-slide13" aria-label="4 of 4" tabindex="-1">4</button></li></ul></div>

							</div>

							<!-- tour special-->

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>