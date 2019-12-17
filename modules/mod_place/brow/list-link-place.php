<?php
$objmysql = new CLS_MYSQL();
$objmysql3 = new CLS_MYSQL();
$sql="SELECT * FROM tbl_place WHERE isactive=1 AND id=".$r['place_id'];
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
?>
<h3><?php echo $row['name']; ?></h3>
<div class="row">
	<?php
	$sql2="SELECT * FROM tbl_place WHERE isactive=1 AND par_id=".$r['place_id']." LIMIT 0,3";
	$objmysql->Query($sql2);
	while ($row2 = $objmysql->Fetch_Assoc()) {
		?>
		<div class="col-md-4">
			<div class="links-toggle">
				<h4 class="toggle-h4"><?php echo $row2['name']; ?><i class="fa fa-angle-down d-md-none"></i></h4>
				<ul class="list-unstyled">
					<?php
					$sql3="SELECT * FROM tbl_place WHERE isactive=1 AND par_id=".$row2['id']." LIMIT 0,7";
					$objmysql3->Query($sql3);
					while ($row3 = $objmysql3->Fetch_Assoc()) {
						echo '<li><a href="'.ROOTHOST.'diem-den/'.$row3['code'].'" title="'.$row3['name'].'">'.$row3['name'].'</a></li>';
					}?>
				</ul>
			</div>
		</div>
		<?php
	}
	?>
</div>