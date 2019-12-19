<section class="section-expiring section">
	<div class="heading text-center">
		<h3 class="title h4">TOUR NỔI BẬT</h3>
		<p class="sub-title">Cung cấp các tour giảm giá mới lạ hấp dẫn</p>
	</div>
	<div class="container">
		<div class="expires carousel-center slick-slider">
			<?php
			$objmysql = new CLS_MYSQL();
			$objdata = new CLS_MYSQL();
			$sql="SELECT * FROM tbl_tour WHERE isactive = 1 AND ishot = 1 LIMIT 0,9";
			$objmysql->Query($sql);
			while ($row = $objmysql->Fetch_Assoc()) {
				$title = stripslashes($row['name']);
				$images = json_decode($row['images']);
				$thumb = getThumb($images[0]->url, 'expire-img w-100 rounded', $title);
				$link = ROOTHOST.'tour/'.$row['un_name'];
				?>
				<div class="item expire-item">
					<a class="expire-link effect-more shadow-bottom" href="<?php echo $link; ?>">
						<?php echo $thumb; ?>
						<div class="expire-info rounded-bottom">
							<div class="expire-info-wrap">
								<h3 class="tour-name"><?php echo $title; ?></h3>
								<div class="item-price">
									<?php
									$price1 = (int)$row['price1'];
									$price2 = (int)$row['price2'];
									if($price1 !== 0 && $price2 !== 0){
										echo '<span class="new-price">'.number_format($price2).' đ</span>';
										echo '<span class="old-price">'.number_format($price1).' đ</span>';
									}else if($price1 === 0 && $price2 === 0){
										echo '<span>Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
									}else if($price1 !== 0 && $price2 === 0){
										echo '<span class="new-price">'.number_format($price1).' đ</span>';
									}
									?>
								</div>
							</div>
						</div>
						<span class="btn btn-info" href="<?php echo $link; ?>">Chi tiết</span>
					</a>
				</div>
				<?php
			}
			?>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		$('.expires').slick({
			speed: 700,
			slidesToShow: 3,
			slidesToScroll: 1,
			dots: false,
			arrows: true,  
			autoplay:true,
			responsive: [
			{
				breakpoint: 1200,
				settings: {
					slidesToShow: 2
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 1,
					dots: true,
				}
			}
			]
		});
	})

</script>