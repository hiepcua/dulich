<?php
$objmysql = new CLS_MYSQL();
$sql = "SELECT * FROM tbl_languages WHERE isactive = 1 ORDER BY `order` ASC LIMIT 0, 14";
$objmysql->Query($sql);
?>
<aside class="aside aside-languages">
	<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Ngôn ngữ nổi bật</span></h3>
	<div class="content">
		<?php
		while ($row = $objmysql->Fetch_Assoc()) {
			echo '<div class="item">
			<div class="wrap-thumb"><img src="'.$row['image'].'" class="img-responsive"/></div>
			<div class="name">'.$row['name'].'</div>
			</div>';
		}
		?>
	</div>
	<div class="view-all"><a href="<?php echo ROOTHOST; ?>ngon-ngu" title="Xem tất cả ngôn ngữ">Xem tất cả ngôn ngữ</a></div>
</aside>