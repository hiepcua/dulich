<?php
$objmysql = new CLS_MYSQL();
$sql="SELECT * FROM tbl_categories WHERE isactive=1 AND par_id=".$r['category_id']." ORDER BY `order` ASC";
$objmysql->Query($sql);
?>
<section class="section-tour-type bg-light2">
	<div class="container">
		<div class="heading text-center">
			<h3 class="title h4">Tour chủ đề</h3>
			<p class="sub-title">Cung cấp các Tour giảm giá mới lạ hấp dẫn</p>
		</div>
		<div class="tour-type">
			<?php
			$i=0;
			while ($row = $objmysql->Fetch_Assoc()) { $i++;
				?>
				<div class="slider-item">
					<a class="tour-type-item" href="<?php echo ROOTHOST.'chu-de/'.$row['code']; ?>" title="<?php echo $row['name']; ?>">
						<span class="tour-type-icon tour-type-<?php echo $i; ?>"></span>
						<h5 class="tour-type-title"><?php echo $row['name']; ?></h5>
					</a>
				</div>
			<?php } ?>
		</div>
	</div>
</section>
<script type="text/javascript">
	$('.tour-type').slick({
		slidesToShow: 6,
		slidesToScroll: 1,
		arrows:true,
		dots:false,
		speed:300,
		autoplay:true,
		responsive: [
		{
			breakpoint: 991,
			settings: {
				rows:1,
				slidesToShow: 6,
			}
		},
		{
			breakpoint: 768,
			settings: {
				rows:1,
				slidesToShow: 4,
			}
		},
		{
			breakpoint: 575,
			settings: {
				rows:1,
				slidesToShow: 2,
				slidesToScroll: 2,
			}
		}
		]

	});
</script>