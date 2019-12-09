<section class="footer-links">
	<div class="container">
		<h3>Website links</h3>
		<div class="row">
			<?php
			$sql="SELECT * FROM tbl_type_of_land WHERE isactive = 1 LIMIT 0,6";
			$objmysql->Query($sql);
			while ($row = $objmysql->Fetch_Assoc()) {
				?>
				<div class="col-md-2">
					<div class="links-toggle">
						<h4 class="toggle-h4"><?php echo $row['title']; ?></h4>
						<ul class="list-unstyled">
							<?php
							$sql2="SELECT `name`, `code` FROM tbl_categories WHERE isactive = 1 AND type_id = ".$row['id'];
							$objdata->Query($sql2);
							while ($row2 = $objdata->Fetch_Assoc()) {
								echo '<li><a href="'.ROOTHOST.$row['code'].'/'.$row2['code'].'" title="'.$row2['name'].'">'.$row2['name'].'</a></li>';
							}
							?>
						</ul>
					</div>
				</div>
				<?php
			}
			?>
		</div>
	</div>
</section>
<footer>
	<div class="container">
		<div class="row text-center">
			<?php $tmp->loadModule('footer');?>
		</div>
	</div>
	<div class="copyright bg_copyright"><?php $tmp->loadModule('bottom');?></div>
</footer>