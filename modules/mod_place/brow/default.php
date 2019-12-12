<?php
$objmysql = new CLS_MYSQL();
$object_data = array();
$arr_child1 = array(); // Array directly children
$arr_childs = array(); // Array all children id
$_place_id = (int)$r['place_id'];

// Get place info by id
$sql="SELECT * FROM tbl_place WHERE id=".$_place_id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
$place_link = ROOTHOST.'tour/'.$row['un_name'];

// Take the direct directly children
$sql1="SELECT * FROM tbl_place WHERE par_id = ".$_place_id;
$objmysql->Query($sql1);
while ($r_child1 = $objmysql->Fetch_Assoc()) {
	$arr_child1[] = $r_child1;
}

// Get all childrent
$sql_childs="SELECT Place_GetFamilyTree(id) as childs FROM tbl_place WHERE id = ".$_place_id;
$objmysql->Query($sql_childs);
$r_childs = $objmysql->Fetch_Assoc();

// Get all tour in list the place id
$sql2="SELECT * FROM tbl_tour WHERE isactive = 1 AND place_id IN(".$r_childs['childs'].") ORDER BY `order` ASC, `cdate` DESC LIMIT 0,7";
$objmysql->Query($sql2);
while ($row2 = $objmysql->Fetch_Assoc()) {
	$object_data[] = $row2;
}

var_dump($object_data);
exit();
?>
<section class="component">
	<?php
	// $objdata2 = new CLS_MYSQL();
	// $objdata3 = new CLS_MYSQL();
	// $objdata4 = new CLS_MYSQL();
	// $object_data = array();
	
	// $arr_contents = [];
	// $arr_category = [];
	// $arr_category_id = [];
	// $arr_contents_of_category = [];

	// $sql = "SELECT * FROM tbl_type_of_land WHERE isactive = 1 AND display_home = 1 ORDER BY `order` ASC";
	// $objmysql->Query($sql);
	// $num1 = 0;
	// while($row = $objmysql->Fetch_Assoc()){
	// 	array_push($object_data, $row);

	// 	// Get categories values by type of land id
	// 	$sql2 = "SELECT * FROM tbl_categories WHERE isactive = 1 AND type_id = ".$row['id'];
	// 	$objdata2->Query($sql2);
	// 	while($row2 = $objdata2->Fetch_Assoc()){
	// 		$arr_category[] = $row2;
	// 		$arr_category_id[] = $row2['id'];
	// 	}

		// Get contents by per category id
		foreach ($arr_category_id as $key => $value) {
			// Get limit 7 contents of 3 categories
			if($key < 3){
				$sql4="SELECT * FROM tbl_contents WHERE isactive = 1 AND category_id = ".$value." LIMIT 0,7";
				$objdata4->Query($sql4);
				while ($row4 = $objdata4->Fetch_Assoc()) {
					$arr_contents_of_category[] = $row4;
				}
				$object_data[$num1]['category_contents'][$value] = $arr_contents_of_category;
				$arr_contents_of_category = [];
			}
		}
		
	// 	$str_category_id = implode(',', $arr_category_id);
	// 	$object_data[$num1]['categories'] = $arr_category;
	// 	$object_data[$num1]['categories_id'] = $str_category_id;
	// 	$arr_category = [];
	// 	$arr_category_id = [];

	// 	// Get contents by list category id
	// 	$sql3="SELECT * FROM tbl_contents WHERE isactive = 1 AND category_id IN (".$str_category_id.") LIMIT 0,7";
	// 	$objdata3->Query($sql3);
	// 	while ($row3 = $objdata3->Fetch_Assoc()) {
	// 		$arr_contents[] = $row3;
	// 	}
	// 	$object_data[$num1]['contents'] = $arr_contents;
	// 	$arr_contents = [];

	// 	$num1++;
	// }

	foreach ($object_data as $k1 => $val1) {
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
					<div role="tabpanel" class="tab-pane fade in active" id="tofl_all<?php echo $row['id'];?>">
						<?php
						$c_contents = count($object_data);
						?>
						<div class="row">
							<?php
							if($c_contents >= 1){
								$item1_title = stripcslashes($val1['name']);
								$item1_link = ROOTHOST.'tour/'.$val1['un_name'];
								$item1_images = json_decode($val1['images']);
								$item1_thumb = getThumb($item1_images[0]->url, 'rounded w-100', $item1_images[0]->alt);
								$item1_price1 = number_format($val1['price1']);
								$item1_price2 = number_format($val1['price2']);
								?>
								<div class="col-lg-6">
									<div class="item-wrap">
										<a class="item-link effect-more" href="<?php echo $item1_link; ?>" title="<?php echo $item1_title; ?>">
											<?php echo $item1_thumb; ?>
											<div class="bg-overlay rounded-bottom">
												<h3 class="item-title text-ellipsis"><?php echo $item1_title; ?></h3>
												<div class="item-price">
													<span class="new-price"><?php echo $item1_price2; ?> đ</span>
													<span class="old-price"><?php echo $item1_price1; ?> đ</span>
												</div>
											</div>
											<span class="badge-timer position-rt">
												<?php
												if((int)$val1['price1'] > 0 && $val1['price2'] > 0){
													echo '<span class="discount">-'.round((($val1['price2'] - $val1['price1'])/$val1['price1'])*100).'</span>';
												}
												?>
												<span class="timer"><?php echo $val1['days']; ?></span>
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
										for ($i=1; $i < 3; $i++) { 
											$item2_title = stripcslashes($val1[$i]['name']);
											$item2_link = ROOTHOST.'tour/'.$val1[$i]['un_name'];
											$item2_images = json_decode($val1[$i]['images']);
											$item2_thumb = getThumb($item2_images[0]->url, 'rounded w-100', $item1_images[0]->alt);
											$item2_price1 = number_format($val1[$i]['price1']);
											$item2_price2 = number_format($val1[$i]['price2']);
											$num_of_holes = (int)$val1[$i]['number_of_holes'];
											?>
											<div class="col-md-6 col-lg-6">
												<div class="card card-1 rounded-bottom mb-3">
													<a class="card-link effect-more" href="<?php echo $item2_link; ?>" title="<?php echo $item2_title; ?>">
														<?php echo $item2_thumb; ?>
														<div class="extra rounded-bottom">
															<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
															<span class="timer"><?php echo $val1[$i]['days']; ?></span>
														</div>
														<span class="btn btn-info" href="<?php echo $item2_link; ?>">chi tiết</span>
													</a>
													<div class="card-body">
														<h5 class="cart-title">
															<a title="<?php echo $item2_title; ?>" href="<?php echo $item2_link; ?>"><?php echo $item2_title; ?></a>
														</h5>
														<div class="card-text">Khởi hành: Hàng ngày</div>
														<div class="item-price">
															<span class="new-price"><?php echo $item2_price2; ?> đ</span>
															<span class="old-price"><?php echo $item2_price1; ?> đ</span>
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
							?>
							<div class="row">
								<?php
								for ($i=3; $i < 7; $i++) { 
									$item3_title = stripcslashes($val1[$i]['name']);
									$item3_link = ROOTHOST.'tour/'.$val1[$i]['un_name'];
									$item3_images = json_decode($val1[$i]['images']);
									$item3_thumb = getThumb($item3_images[0]->url, 'rounded w-100', $item3_images[0]->alt);

									$item3_price1 = convert_price($val1[$i]['price1']);
									$item3_price2 = convert_price($val1[$i]['price2']);
									$num_of_holes = (int)$val1[$i]['number_of_holes'];
									?>
									<div class="col-md-6 col-lg-3">
										<div class="card card-1 rounded-bottom mb-3">
											<a class="card-link effect-more" href="<?php echo $item3_link; ?>">
												<?php echo $item3_thumb; ?>
												<div class="extra rounded-bottom">
													<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
													<span class="timer"><?php echo $val1[$i]['days']; ?></span>
												</div>
												<span class="btn btn-info" href="<?php echo $item3_link; ?>">chi tiết</span>
											</a>
											<div class="card-body">
												<h5 class="cart-title">
													<a title="<?php echo $item3_title; ?>" href="<?php echo $item3_link; ?>"><?php echo $item3_title; ?></a>
												</h5>
												<div class="card-text">Khởi hành: Hàng ngày</div>
												<div class="item-price">
													<span class="new-price"><?php echo $item3_price2; ?> đ</span>
													<span class="old-price"><?php echo $item3_price21; ?> đ</span>
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
					if(count($val1['category_contents']) > 0){
						foreach ($val1['category_contents'] as $k_categories => $val_categories) {
							?>
							<div role="tabpanel" class="tab-pane fade" id="tofl_<?php echo $k_categories ?>">
								<?php
								$c_tab_contents = count($val_categories);
								?>
								<div class="row">
									<?php
									if($c_tab_contents >= 1){
										$item1_title = stripcslashes($val_categories[0]['title']);
										$item1_link = ROOTHOST.$tofl_code.'/'.$val_categories[0]['code'].'.html';
										$item1_thumb = getThumb($val_categories[0]['thumb'], 'rounded w-100', $item1_title);
										$item1_price = convert_price($val_categories[0]['price']);
										$item1_area = number_format($val_categories[0]['area']);
										?>
										<div class="col-lg-6">
											<div class="item-wrap">
												<a class="item-link effect-more" href="<?php echo $item1_link; ?>" title="<?php echo $item1_title; ?>">
													<?php echo $item1_thumb; ?>
													<div class="bg-overlay rounded-bottom">
														<h3 class="item-title text-ellipsis"><?php echo $item1_title; ?></h3>
														<div class="item-price">
															<span class="new-price"><?php echo $item1_price; ?> đ</span>
															<span class="old-price">Diện tích: <?php echo $item1_area; ?> m²</span>
														</div>
													</div>
													<span class="badge-timer position-rt">
														<span class="discount">-8%</span>
														<span class="timer">3N/2Đ</span>
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
											if($c_tab_contents >= 3){
												for ($i=1; $i < 3; $i++) { 
													$item2_title = stripcslashes($val_categories[$i]['title']);
													$item2_link = ROOTHOST.$tofl_code.'/'.$val_categories[$i]['code'].'.html';
													$item2_thumb = getThumb($val_categories[$i]['thumb'], 'rounded w-100', $item1_title);
													$item2_price = convert_price($val_categories[$i]['price']);
													$item2_area = number_format($val_categories[$i]['area']);
													?>
													<div class="col-md-6 col-lg-6">
														<div class="card card-1 rounded-bottom mb-3">
															<a class="card-link effect-more" href="<?php echo $item2_link; ?>" title="<?php echo $item2_title; ?>">
																<?php echo $item2_thumb; ?>
																<div class="extra rounded-bottom">
																	<span class="availability">Số chỗ: 15</span>
																	<span class="timer">3N/2Đ</span>
																</div>
																<span class="btn btn-info" href="<?php echo $item2_link; ?>">chi tiết</span>
															</a>
															<div class="card-body">
																<h5 class="cart-title">
																	<a title="<?php echo $item2_title; ?>" href="<?php echo $item2_link; ?>"><?php echo $item2_title; ?></a>
																</h5>
																<div class="card-text">Khởi hành: Hàng ngày</div>
																<div class="item-price">
																	<span class="new-price"><?php echo $item2_price; ?> đ</span>
																	<span class="old-price"><?php echo $item2_area; ?> m²</span>
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
								if($c_tab_contents >= 4){
									?>
									<div class="row">
										<?php
										for ($i=3; $i < 7; $i++) { 
											$item3_title = stripcslashes($val_categories[$i]['title']);
											$item3_link = ROOTHOST.$tofl_code.'/'.$val_categories[$i]['code'].'.html';
											$item3_thumb = getThumb($val_categories[$i]['thumb'], 'rounded w-100', $item1_title);
											$item3_price = convert_price($val_categories[$i]['price']);
											$item3_area = number_format($val_categories[$i]['area']);
											?>
											<div class="col-md-6 col-lg-3">
												<div class="card card-1 rounded-bottom mb-3">
													<a class="card-link effect-more" href="<?php echo $item3_link; ?>">
														<?php echo $item3_thumb; ?>
														<div class="extra rounded-bottom">
															<span class="availability">Số chỗ: 15</span>
															<span class="timer">3N/2Đ</span>
														</div>
														<span class="btn btn-info" href="<?php echo $item3_link; ?>">chi tiết</span>
													</a>
													<div class="card-body">
														<h5 class="cart-title">
															<a title="<?php echo $item3_title; ?>" href="<?php echo $item3_link; ?>"><?php echo $item3_title; ?></a>
														</h5>
														<div class="card-text">Khởi hành: Hàng ngày</div>
														<div class="item-price">
															<span class="new-price"><?php echo $item3_price; ?> đ</span>
															<span class="old-price"><?php echo $item3_area; ?> m²</span>
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
									<a class="btn btn-outline-dark text-uppercase btn-lg" href="<?php echo $tofl_link; ?>">Xem thêm</a>
								</div>
							</div>
							<?php
						}
					}
					?>
				</div>
			</div>
		</section>
		<?php
	}
	?>
</section>