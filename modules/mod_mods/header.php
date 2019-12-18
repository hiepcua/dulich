<?php
$objmysql1 = new CLS_MYSQL();
?>
<header id="header">
	<nav id="navbar" class="wrap-menu navbar navbar-expand-lg" role="navigation">
		<div class="container">
			<button class="navbar-toggler collapsed" type="button"><span></span></button>
			<a class="navbar-brand" href="<?php echo ROOTHOST;?>" title="Trang chủ">
				<img src="<?php echo ROOTHOST;?>images/logo/logo.jpg" class="img-responsive">
			</a>
			<div class="justify-content-center navbar-collapse collapse">
				<nav id="main-menu">
					<?php
					$arr_menuitem = array();
					$arr_childs = array();
					$arr_childs2 = array();

					$sql="SELECT * FROM tbl_mnuitems WHERE isactive=1 AND `menu_id`=1 AND par_id=0 ORDER BY `order` ASC";
					$objmysql->Query($sql);
					while ($row = $objmysql->Fetch_Assoc()) {
						// Get childs 1 if true
						$sql1="SELECT * FROM tbl_mnuitems WHERE isactive=1 AND `menu_id`=1 AND par_id=".$row['id']." ORDER BY `order` ASC";
						$objmysql1->Query($sql1);
						if($objmysql1->Num_rows() > 0){
							while ($row1 = $objmysql1->Fetch_Assoc()) {
								$arr_childs[] = $row1;
							}
							$row['childs'] = $arr_childs;
							$arr_childs = [];
						}else{
							$row['childs'] = [];
						}
						$arr_menuitem[] = $row;
					}

					// Get childs 2 if true
					foreach ($arr_menuitem as $key => $value) {
						if(count($value['childs']) > 0){
							foreach ($value['childs'] as $k => $v) {
								$sql="SELECT * FROM tbl_mnuitems WHERE isactive=1 AND `menu_id`=1 AND par_id=".$v['id']." ORDER BY `order` ASC";
								$objmysql->Query($sql);
								while ($row = $objmysql->Fetch_Assoc()) {
									$arr_childs2[] = $row;
								}
								$arr_menuitem[$key]['childs'][$k]['childs2'] = $arr_childs2;
								$arr_childs2 = [];	
							}
						}
					}
					?>
					<div class="collapse navbar-collapse justify-content-center" id="navbarToggle">
						<ul class="navbar-nav navbar-main">
							<?php
							// Print menu
							foreach ($arr_menuitem as $key => $value) {
								switch ($value['viewtype']) {
									case 'link':
									$link = $value['link'];
									break;
									case 'block':
									$sql="SELECT `code` FROM tbl_categories WHERE id=".$value['category_id'];
									$objmysql->Query($sql);
									$row = $objmysql->Fetch_Assoc();
									$link = ROOTHOST.'chuyen-muc/'.$row['code'];
									break;
									case 'article':
									$sql="SELECT `code` FROM tbl_contents WHERE id=".$value['content_id'];
									$objmysql->Query($sql);
									$row = $objmysql->Fetch_Assoc();
									$link = ROOTHOST.'bai-viet/'.$row['code'];
									break;
									case 'place':
									$sql="SELECT `code` FROM tbl_place WHERE id=".$value['place_id'];
									$objmysql->Query($sql);
									$row = $objmysql->Fetch_Assoc();
									$link = ROOTHOST.'diem-den/'.$row['code'];
									break;
									
									default:
									$link = ROOTHOST;
									break;
								}

								$cChild = count($value['childs']); // Count child lever 1
								$class = "";
								$aToggle = "nav-link";
								$class.= $value['class'];
								if($cChild > 0) {
									$class.=" dropdown";
									$aToggle.= " dropdown-toggle";
								}
								?>
								<li class="nav-item <?php echo $class; ?>">
									<a id="megamneu_<?php echo $value['id']; ?>" href="<?php echo $link; ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="<?php echo $aToggle; ?>"><?php echo $value['name']; ?></a>
									<?php if($cChild > 0 && $value['viewtype'] == 'place') { ?>
										<div aria-labelledby="megamneu_<?php echo $value['id']; ?>" class="dropdown-menu">
											<div class="container-fluid">
												<div class="row">
													<?php foreach ($value['childs'] as $kc1 => $vc1) { ?>
														<div class="col-sm-6 col-md-2">
															<div class="megamenu-submenu">
																<h5 class="dropdown-heading">
																	<a href="<?php echo ROOTHOST.'diem-den/'.$vc1['code']; ?>"><?php echo $vc1['name']; ?></a>
																</h5>
																<?php
																$cChild2 = count($vc1['childs2']);
																if($cChild2 > 0){
																	echo '<ul class="list-unstyled">';
																	foreach ($vc1['childs2'] as $kc2 => $vc2) {?>
																		<li><a href="<?php echo ROOTHOST.'diem-den/'.$vc2['code']; ?>"><?php echo $vc2['name']; ?></a></li>
																	<?php }
																	echo '</ul>';
																}
																?>
															</div>
														</div>
													<?php } ?>
												</div>
											</div>
										</div>
									<?php }else if($cChild > 0 && $value['viewtype'] !== 'place'){ ?>
										<div aria-labelledby="megamneu_<?php echo $value['id']; ?>" class="dropdown-menu">
											<div class="megamenu-submenu">
												<ul class="list-unstyled">
													<?php foreach ($value['childs'] as $kc1 => $vc1) { ?>
														<li><a href="<?php echo ROOTHOST.'chuyen-muc/'.$vc1['code']; ?>"><?php echo $vc1['name']; ?></a></li>
													<?php } ?>
												</ul>
											</div>
										</div>
									<?php } ?>
								</li>
								<?php
							}
							?>
						</ul>
					</div>
				</nav>
			</div>
			<div class="hotline-header d-none d-lg-block">
				<span class="txt-hotline">Hotline</span>
				<i class="fa fa-phone"></i><?php $tmp->loadModule('header'); ?>
				<div class="header-show"></div>
			</div>
			<div class="header-search">
				<div class="header-icon-search">
					<i class="fa fa-search"></i>
				</div>
				<div id="check" class="dropdown-menu-right">
					<form action="<?php echo ROOTHOST; ?>tim-kiem" method="post" id="header-search" class="form-inline">
						<input name="keyword" type="text" class="form-control" placeholder="Tìm Kiếm">
						<button type="submit" class="btn btn-default">
							<span class="fa fa-search"></span>
						</button>
					</form>
				</div>
			</div>
		</div>
	</nav>
	<div class="social-top">
		<ul>
			<li class="menu-support-children"><a title="Facebook" target="_blank" href="<?php echo $conf->Facebook;?>"><i class="fa fa-facebook"></i></a></li>
			<li class="menu-support-children"><a title="Messenger" target="_blank" href="<?php echo $conf->Facebook;?>"><i class="fa fa-commenting"></i></a></li>
			<li class="menu-support-children"><a title="Twitter" target="_blank" href="<?php echo $conf->Twitter;?>"><i class="fa fa-twitter"></i></a></li>
			<li class="menu-support-children"><a title="Youtube" target="_blank" href="<?php echo $conf->Youtube;?>"><i class="fa fa-youtube-play"></i></a></li>
			<li class="menu-support-children"><a title="Tài liệu" href="<?php echo ROOTHOST;?>"><i class="fa fa-book"></i></a></li>
		</ul>
		<i class="fa fa-caret-right"></i>
	</div>
</header>
