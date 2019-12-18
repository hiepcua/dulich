<?php
$objmysql = new CLS_MYSQL();
$objmysql2 = new CLS_MYSQL();
$t_days = unserialize(TOUR_TIME);	// Global config
$object_data = array();
$arr_tour_by_place = array();
$arr_child1 = array(); // Array directly children
$arr_childs = array(); // Array all children id
$_place_id = (int)$r['place_id'];
$arr_contents_of_category = array();

// Get place info by id
$sql="SELECT * FROM tbl_place WHERE id=".$_place_id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
$place_link = ROOTHOST.'diem-den/'.$row['code'];

// Take the direct directly children
$sql1="SELECT * FROM tbl_place WHERE par_id = ".$_place_id;
$objmysql->Query($sql1);
while ($r_child1 = $objmysql->Fetch_Assoc()) {
	$sql2="SELECT Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$r_child1['id'];
	$objmysql2->Query($sql2);
	$row2 = $objmysql2->Fetch_Assoc();

	$r_child1['list_child'] = $row2['childs'];
	$arr_child1[] = $r_child1;
}

// Get all childrent
$sql_childs="SELECT Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$_place_id;
$objmysql->Query($sql_childs);
$r_childs = $objmysql->Fetch_Assoc();

// Get all tour in list the place id
$sql2="SELECT * FROM tbl_tour WHERE isactive = 1 AND place_id IN(".$r_childs['childs'].",".$_place_id.") ORDER BY `order` ASC, `cdate` DESC LIMIT 0,7";
$objmysql->Query($sql2);
while ($row2 = $objmysql->Fetch_Assoc()) {
	$object_data[] = $row2;
}

// Get contents by per category id
foreach ($arr_child1 as $key => $value) {
	// Get limit 7 contents of 3 categories
	if($key < 3){
		$sql3="SELECT * FROM tbl_tour WHERE isactive = 1 AND place_id IN (".$value['list_child'].") LIMIT 0,7";
		$objmysql->Query($sql3);
		while ($row3 = $objmysql->Fetch_Assoc()) {
			$arr_contents_of_category[] = $row3;
		}
		$arr_tour_by_place[$value['id']] = $arr_contents_of_category;
		$arr_contents_of_category = [];
	}
}
?>
<section class="sec-type-of-land">
	<div class="container">
		<div class="heading-flex">
			<h3 class="sec-title"><?php echo $row['name'] ?></h3>
			<ul class="nav nav-tour justify-content-md-end pt-4 pt-md-0" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" role="tab" data-toggle="tab" href="#tofl_all<?php echo $row['id'];?>">Tất cả</a>
				</li>
				<?php
				if(count($arr_child1) > 0){
					foreach ($arr_child1 as $key => $value) {
						if($key < 3){
							?>
							<li class="nav-item">
								<a class="nav-link" role="tab" data-toggle="tab" href="#tofl_<?php echo $value['id'];?>"><?php echo $value['name'];?></a>
							</li>
							<?php
						}
					}
				}
				?>
			</ul>
		</div>
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active show" id="tofl_all<?php echo $row['id'];?>">
				<?php
				$c_contents = count($object_data);
				?>
				<div class="row">
					<?php
					if($c_contents >= 1){
						$val1 = $object_data[0];
						$item1_title = stripcslashes($val1['name']);
						$item1_link = ROOTHOST.'tour/'.$val1['un_name'];
						$item1_images = json_decode($val1['images']);
						$item1_thumb = getThumb($item1_images[0]->url, 'rounded w-100', $item1_images[0]->alt);
						$item1_price1 = (int)$val1['price1'];
						$item1_price2 = (int)$val1['price2'];
						?>
						<div class="col-lg-6">
							<div class="item-wrap">
								<a class="item-link effect-more" href="<?php echo $item1_link; ?>" title="<?php echo $item1_title; ?>">
									<?php echo $item1_thumb; ?>
									<div class="bg-overlay rounded-bottom">
										<h3 class="item-title text-ellipsis"><?php echo $item1_title; ?></h3>
										<div class="item-price">
											<?php
											if($item1_price1 !== 0 && $item1_price2 !== 0){
												echo '<span class="new-price">'.number_format($item1_price2).' đ</span>';
												echo '<span class="old-price">'.number_format($item1_price1).' đ</span>';
											}else if($item1_price1 === 0 && $item1_price2 === 0){
												echo '<span style="color: #fff;">Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
											}else if($item1_price1 !== 0 && $item1_price2 === 0){
												echo '<span class="new-price">'.number_format($item1_price1).' đ</span>';
											}
											?>
										</div>
									</div>
									<span class="badge-timer position-rt">
										<?php
										if((int)$val1['price1'] > 0 && $val1['price2'] > 0){
											echo '<span class="discount">'.round((($val1['price2'] - $val1['price1'])/$val1['price1'])*100).'<small>%</small></span>';
										}else{
											echo '<span class="discount"></span>';
										}
										?>
										<span class="timer"><?php echo $t_days[$val1['days']]; ?></span>
									</span>
									<span class="btn btn-info" href="<?php echo $item1_link; ?>">chi tiết</span>
								</a>
							</div>
						</div>
						<?php
					}
					?>
					<div class="col-lg-6">
						<div class="row">
							<?php
							if($c_contents >= 3){
								$val1 = $object_data;
								for ($i=1; $i < 3; $i++) { 
									$item2_title = stripcslashes($val1[$i]['name']);
									$item2_link = ROOTHOST.'tour/'.$val1[$i]['un_name'];
									$item2_images = json_decode($val1[$i]['images']);
									$item2_thumb = getThumb($item2_images[0]->url, 'rounded w-100', $item1_images[0]->alt);
									$item2_price1 = (int)$val1[$i]['price1'];
									$item2_price2 = (int)$val1[$i]['price2'];
									$num_of_holes = (int)$val1[$i]['number_of_holes'];
									?>
									<div class="col-md-6 col-lg-6">
										<div class="card card-1 rounded-bottom mb-3">
											<a class="card-link effect-more" href="<?php echo $item2_link; ?>" title="<?php echo $item2_title; ?>">
												<?php echo $item2_thumb; ?>
												<div class="extra rounded-bottom">
													<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
													<span class="timer"><?php echo $t_days[$val1[$i]['days']]; ?></span>
												</div>
												<span class="btn btn-info" href="<?php echo $item2_link; ?>">chi tiết</span>
											</a>
											<div class="card-body">
												<h5 class="cart-title">
													<a title="<?php echo $item2_title; ?>" href="<?php echo $item2_link; ?>"><?php echo $item2_title; ?></a>
												</h5>
												<div class="card-text">
													<?php
													if($val1[$i]['departure'] > 0){
														echo 'Khởi hành: <strong>'.date('d-m-Y', $val1[$i]['departure']).'</strong>';
													}else{
														echo 'Khởi hành: <strong>Hàng ngày</strong>';
													}?>
												</div>
												<div class="item-price">
													<?php
													if($item2_price1 !== 0 && $item2_price2 !== 0){
														echo '<span class="new-price">'.number_format($item2_price2).' đ</span>';
														echo '<span class="old-price">'.number_format($item2_price1).' đ</span>';
													}else if($item2_price1 === 0 && $item2_price2 === 0){
														echo '<span>Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
													}else if($item2_price1 !== 0 && $item2_price2 === 0){
														echo '<span class="new-price">'.number_format($item2_price1).' đ</span>';
													}
													?>
												</div>
											</div>
										</div>
									</div>
									<?php
								}
								?>
								<?php
							}
							?>
						</div>
					</div>
				</div>
				<?php
				if($c_contents >= 4){
					$val1 = $object_data;
					?>
					<div class="row">
						<?php
						for ($i=3; $i < 7; $i++) { 
							$item3_title = stripcslashes($val1[$i]['name']);
							$item3_link = ROOTHOST.'tour/'.$val1[$i]['un_name'];
							$item3_images = json_decode($val1[$i]['images']);
							$item3_thumb = getThumb($item3_images[0]->url, 'rounded w-100', $item3_images[0]->alt);

							$item3_price1 = (int)$val1[$i]['price1'];
							$item3_price2 = (int)$val1[$i]['price2'];
							$num_of_holes = (int)$val1[$i]['number_of_holes'];
							?>
							<div class="col-md-6 col-lg-3">
								<div class="card card-1 rounded-bottom mb-3">
									<a class="card-link effect-more" href="<?php echo $item3_link; ?>">
										<?php echo $item3_thumb; ?>
										<div class="extra rounded-bottom">
											<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
											<span class="timer"><?php echo $t_days[$val1[$i]['days']]; ?></span>
										</div>
										<span class="btn btn-info" href="<?php echo $item3_link; ?>">chi tiết</span>
									</a>
									<div class="card-body">
										<h5 class="cart-title">
											<a title="<?php echo $item3_title; ?>" href="<?php echo $item3_link; ?>"><?php echo $item3_title; ?></a>
										</h5>
										<div class="card-text">
											<?php
											if($val1[$i]['departure'] > 0){
												echo 'Khởi hành: <strong>'.date('d-m-Y', $val1[$i]['departure']).'</strong>';
											}else{
												echo 'Khởi hành: <strong>Hàng ngày</strong>';
											}?>
										</div>
										<div class="item-price">
											<?php
											if($item3_price1 !== 0 && $item3_price2 !== 0){
												echo '<span class="new-price">'.number_format($item3_price2).' đ</span>';
												echo '<span class="old-price">'.number_format($item3_price1).' đ</span>';
											}else if($item3_price1 === 0 && $item3_price2 === 0){
												echo '<span>Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
											}else if($item3_price1 !== 0 && $item3_price2 === 0){
												echo '<span class="new-price">'.number_format($item3_price1).' đ</span>';
											}
											?>
										</div>
									</div>
								</div>
							</div>
							<?php
						}
						?>
					</div>
					<?php
				}
				?>
				<div class="text-center mt-2">
					<a class="btn btn-outline-dark text-uppercase btn-lg" href="<?php echo $place_link; ?>">Xem thêm</a>
				</div>
			</div>

			<!-- Print tab-pane's tour -->
			<?php
			if(count($arr_tour_by_place) > 0){
				foreach ($arr_tour_by_place as $key => $value) {
					?>
					<div role="tabpanel" class="tab-pane fade" id="tofl_<?php echo $key; ?>">
						<?php
						$c_tour = count($value);
						?>
						<div class="row">
							<?php
							if($c_tour >= 1){
								$item1_title = stripcslashes($value[0]['name']);
								$item1_link = ROOTHOST.'tour/'.$value[0]['code'];
								$item1_images = json_decode($value[0]['images']);
								$item1_thumb = getThumb($item1_images[0]->url, 'rounded w-100', $item1_images[0]->alt);
								$item1_price1 = (int)$value[0]['price1'];
								$item1_price2 = (int)$value[0]['price2'];
								?>
								<div class="col-lg-6">
									<div class="item-wrap">
										<a class="item-link effect-more" href="<?php echo $item1_link; ?>" title="<?php echo $item1_title; ?>">
											<?php echo $item1_thumb; ?>
											<div class="bg-overlay rounded-bottom">
												<h3 class="item-title text-ellipsis"><?php echo $item1_title; ?></h3>
												<div class="item-price">
													<?php
													if($item1_price1 !== 0 && $item1_price2 !== 0){
														echo '<span class="new-price">'.number_format($item1_price2).' đ</span>';
														echo '<span class="old-price">'.number_format($item1_price1).' đ</span>';
													}else if($item1_price1 === 0 && $item1_price2 === 0){
														echo '<span style="color: #fff;">Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
													}else if($item1_price1 !== 0 && $item1_price2 === 0){
														echo '<span class="new-price">'.number_format($item1_price1).' đ</span>';
													}
													?>
												</div>
											</div>
											<span class="badge-timer position-rt">
												<?php
												if($item1_price1 > 0 && $item1_price2 > 0){
													echo '<span class="discount">'.round((($item1_price2 - $item1_price1)/$item1_price1)*100).'<small>%</small></span>';
												}else{
													echo '<span class="discount"></span>';
												}
												?>
												<span class="timer"><?php echo $t_days[$val1[$i]['days']]; ?></span>
											</span>
											<span class="btn btn-info" href="<?php echo $item1_link; ?>">chi tiết</span>
										</a>
									</div>
								</div>
								<?php
							}
							?>
							<div class="col-lg-6">
								<div class="row">
									<?php
									if($c_tour >= 3){
										for ($i=1; $i < 3; $i++) { 
											$item_title = stripcslashes($value[$i]['name']);
											$item_link = ROOTHOST.'tour/'.$value[$i]['code'];
											$item_images = json_decode($value[0]['images']);
											$item_thumb = getThumb($item_images[0]->url, 'rounded w-100', $item_images[0]->alt);
											$item_price1 = (int)$value[$i]['price1'];
											$item_price2 = (int)$value[$i]['price2'];
											$num_of_holes = (int)$value[$i]['number_of_holes'];
											?>
											<div class="col-md-6 col-lg-6">
												<div class="card card-1 rounded-bottom mb-3">
													<a class="card-link effect-more" href="<?php echo $item_link; ?>" title="<?php echo $item_title; ?>">
														<?php echo $item_thumb; ?>
														<div class="extra rounded-bottom">
															<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
															<span class="timer"><?php echo $t_days[$value[$i]['days']]; ?></span>
														</div>
														<span class="btn btn-info" href="<?php echo $item_link; ?>">chi tiết</span>
													</a>
													<div class="card-body">
														<h5 class="cart-title">
															<a title="<?php echo $item_title; ?>" href="<?php echo $item_link; ?>"><?php echo $item_title; ?></a>
														</h5>
														<div class="card-text">
															<?php
															if($value[$i]['departure'] > 0){
																echo 'Khởi hành: <strong>'.date('d-m-Y', $value[$i]['departure']).'</strong>';
															}else{
																echo 'Khởi hành: <strong>Hàng ngày</strong>';
															}?>
														</div>
														<div class="item-price">
															<?php
															if($item_price1 !== 0 && $item_price2 !== 0){
																echo '<span class="new-price">'.number_format($item_price2).' đ</span>';
																echo '<span class="old-price">'.number_format($item_price1).' đ</span>';
															}else if($item_price1 === 0 && $item_price2 === 0){
																echo '<span>Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
															}else if($item_price1 !== 0 && $item_price2 === 0){
																echo '<span class="new-price">'.number_format($item_price1).' đ</span>';
															}
															?>
														</div>
													</div>
												</div>
											</div>
											<?php
										}
										?>
										<?php
									}
									?>
								</div>
							</div>
						</div>
						<?php
						if($c_tour >= 4){
							?>
							<div class="row">
								<?php
								for ($i=3; $i < 7; $i++) { 
									$item_title = stripcslashes($value[$i]['name']);
									$item_link = ROOTHOST.'tour/'.$value[$i]['code'];
									$item_images = json_decode($value[$i]['images']);
									$item_thumb = getThumb($item_images[0]->url, 'rounded w-100', $item_images[0]->alt);
									$item_price1 = number_format($value[$i]['price1']);
									$item_price2 = number_format($value[$i]['price2']);
									$num_of_holes = (int)$value[$i]['number_of_holes'];
									?>
									<div class="col-md-6 col-lg-3">
										<div class="card card-1 rounded-bottom mb-3">
											<a class="card-link effect-more" href="<?php echo $item_link; ?>">
												<?php echo $item_thumb; ?>
												<div class="extra rounded-bottom">
													<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
													<span class="timer"><?php echo $t_days[$value[$i]['days']]; ?></span>
												</div>
												<span class="btn btn-info" href="<?php echo $item_link; ?>">chi tiết</span>
											</a>
											<div class="card-body">
												<h5 class="cart-title">
													<a title="<?php echo $item_title; ?>" href="<?php echo $item_link; ?>"><?php echo $item_title; ?></a>
												</h5>
												<div class="card-text">
													<?php
													if($value[$i]['departure'] > 0){
														echo 'Khởi hành: <strong>'.date('d-m-Y', $value[$i]['departure']).'</strong>';
													}else{
														echo 'Khởi hành: <strong>Hàng ngày</strong>';
													}?>
												</div>
												<div class="item-price">
													<?php
													if($item_price1 !== 0 && $item_price2 !== 0){
														echo '<span class="new-price">'.number_format($item_price2).' đ</span>';
														echo '<span class="old-price">'.number_format($item_price1).' đ</span>';
													}else if($item_price1 === 0 && $item_price2 === 0){
														echo '<span>Liên hệ: <span href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</span></span>';
													}else if($item_price1 !== 0 && $item_price2 === 0){
														echo '<span class="new-price">'.number_format($item_price1).' đ</span>';
													}?>
												</div>
											</div>
										</div>
									</div>
									<?php
								}
								?>
							</div>
							<?php
						}
						?>
						<div class="text-center mt-2">
							<a class="btn btn-outline-dark text-uppercase btn-lg" href="<?php echo $place_link; ?>">Xem thêm</a>
						</div>
					</div>
					<?php
				}
			}
			?>
		</div>
	</div>
</section>