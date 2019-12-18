<aside class="row">
	<div class="col-lg-12 col-md-6">
		<!-- tour special-->
		<div class="heading-flex sidebar-title">
			<div class="title h4">Tour <span>nổi bật</span></div>
		</div>
		<aside class="tour-special">
			<?php
			$objmysql = new CLS_MYSQL();
			$sql="SELECT * FROM tbl_tour WHERE isactive = 1 AND ishot=1 ORDER BY `order` ASC LIMIT 0, 5";
			$objmysql->Query($sql);
			while ($row = $objmysql->Fetch_Assoc()) {
				$link = ROOTHOST.'tour/'.$row['code'];
				$name = stripcslashes($row['name']);
				$number_of_holes = (int)$row['number_of_holes'];
				$days = stripcslashes($row['days']);
				$images = json_decode($row['images']);
				$thumb = getThumb($images[0]->url, 'img-responsive', $name);
				?>
				<div class="item">
					<div class="card card-1 rounded-bottom mb-col">
						<a class="card-link effect-more" href="<?php echo $link; ?>">
							<?php echo $thumb; ?>
							<div class="extra rounded-bottom">
								<span class="availability">Số chỗ: <?php echo $number_of_holes; ?></span>
								<span class="timer"><?php echo $days; ?></span>
							</div>
							<?php if((int)$row['price1'] !== 0 && (int)$row['price2'] !== 0){ ?>
								<span class="sale-off"><?php echo round((($row['price1'] - $row['price2'])/$row['price1'])*100); ?>%</span>
							<?php } ?>
							<span class="btn btn-info" href="<?php echo $link; ?>">Chi tiết</span>
						</a>

						<div class="card-body">

							<h5 class="cart-title">
								<a href="<?php echo $link; ?>" title="<?php echo $name; ?>"><?php echo $name; ?></a>
							</h5>
							<div class="card-text">
								<?php
								if($row['departure'] > 0){
									echo 'Khởi hành: <strong>'.date('d-m-Y', $row['departure']).'</strong>';
								}else{
									echo 'Khởi hành: <strong>Hàng ngày</strong>';
								}?>
							</div>
							<div class="item-price">
								<?php
								$price1 = (int)$row['price1'];
								$price2 = (int)$row['price2'];
								if($price1 !== 0 && $price2 !== 0){
									echo '<span class="new-price">'.number_format($price2).' đ</span>';
									echo '<span class="old-price">'.number_format($price1).' đ</span>';
								}else if($price1 === 0 && $price2 === 0){
									echo '<span>Liên hệ: <a href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</a></span>';
								}else if($price1 !== 0 && $price2 === 0){
									echo '<span class="new-price">'.number_format($price1).' đ</span>';
								}?>
							</div>
						</div>

					</div>
				</div>
				<?php
			}
			?>
		</aside>
	</div>
</aside>
<script type="text/javascript">
	$('.tour-special').slick({
		dots: true,
		prevArrow: false,
		nextArrow: false,
		slidesToShow: 1,
		accessibility: false,
		infinite: true,
		speed: 500,
		fade: true,
		cssEase: 'linear',
		autoplay: true,
		autoplaySpeed: 2000,
	});
</script>