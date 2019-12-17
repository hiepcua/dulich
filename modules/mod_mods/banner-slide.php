<?php
$objmysql = new CLS_MYSQL();
$sql="SELECT * FROM tbl_slider WHERE isactive=1 ORDER BY `order` ASC,id ASC";
$objmysql->Query($sql);
$id_div = "slider-main";
$total = $objmysql->Num_rows();
?>
<div id="main-banner" class="owl-carousel owl-theme">
	<?php
	while($row = $objmysql->Fetch_Assoc()) {
		$thumb = stripcslashes($row['thumb']);
		?>
		<div class="banner-item item slide-bg-image" data-background-img="<?= $thumb ?>" style="background-image: url(<?= $thumb ?>); background-position: center center; width: 100%; display: inline-block;"></div>
	<?php } ?>
</div>
<script type="text/javascript">
	$('#main-banner').slick({
	dots: false,
    prevArrow: false,
    nextArrow: false,
	accessibility: false,
	infinite: true,
	speed: 500,
	fade: true,
	cssEase: 'linear',
	autoplay: true,
  	autoplaySpeed: 2000,
});
</script>