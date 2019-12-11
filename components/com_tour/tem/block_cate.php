<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') page404();

$sql="SELECT * FROM tbl_categories WHERE code ='".$code."'";
$objmysql->Query($sql);
$r_cate = $objmysql->Fetch_Assoc();

// Begin pagging
define('OBJ_PAGE','BLOCK_CONTENTS');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_contents WHERE category_id = ".$r_cate['id'];
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

$MAX_ROWS = 9;
if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/$MAX_ROWS)){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/$MAX_ROWS);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging

?>
<section class="page page-contents">
	<div class="container">
		<div class="page-content">
			<div class="row">
				<div class="col-md-8 col-sm-8">
					<h1 class="page-title"><?php echo $r_cate['name']; ?></h1>
					<section class="sec-category">
						<div class="row list-items">
							<?php
							$star = ($cur_page - 1) * $MAX_ROWS;
							$sql = "SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
							INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
							INNER JOIN tbl_categories AS d ON c.category_id=d.id 
							WHERE c.category_id = ".$r_cate['id']." ORDER BY c.`cdate` DESC LIMIT $star,".$MAX_ROWS;
							$objmysql->Query($sql);
							$i=0;
							while ($r_con = $objmysql->Fetch_Assoc()) {
								$i++;
								$title 	= stripcslashes($r_con['title']);
								$code 	= $r_con['code'];
								$thumb 	= getThumb($r_con['thumb'], 'img-responsive', '');
								$views 	= (int)$r_con['visited'];
								$cdate 	= convert_date($r_con['cdate']);
								$intro 	= Substring(html_entity_decode(stripslashes($r_con['intro'])), 0, 60);
								$link 	= ROOTHOST.$r_cate['code'].'/'.$r_con['code'].'.html';
								$cat_name	= $r_con['cat_name'];
								$price 		= convert_price($r_con['price']);
								$area  		= $r_con['area'];
								$type_land	= $r_con['type_of_land_id'];
								$type_name  = $r_con['type_name'];
								if($i == 1){
									echo '<div class="item big">
									<div class="box-thumb">
									<a href="'.$link.'" title="'.$title.'">'.$thumb.'</a>
									</div>
									<div class="content">
									<div class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></div>';
									echo '<div class="info">
										<span class="date">Giá: <b>';
									if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;
									echo '</b></span>
										<span class="date">Diện tích: ';
									if($area==="" || $area==0) echo 'Không xác định'; 
									else echo number_format($area).'m²';
									echo '</span>
									</div>
									<div class="info">
									<span class="date">'.$cdate.'</span>';
									if($views > 0){
										echo '<span class="views">'.$views.' views</span>';
									}
									echo '<div class="intro">'.$intro.'</div>
									<div class="text-right"><a href="'.$link.'" title="Xem chi tiết" class="read-more">Chi tiết <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></div>
									</div>
									</div>
									</div>';
								}else{
									echo '<div class="col-md-6 col-sm-12 col-xs-12 item">
									<div class="box-thumb">
									<a href="'.$link.'" title="'.$title.'">'.$thumb.'</a>
									</div>
									<div class="content">
									<div class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></div>';
									echo '<div class="info">
										<span class="date">Giá: <b>';
									if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;
									echo '</b></span>
										<span class="date">Diện tích: ';
									if($area==="" || $area==0) echo 'Không xác định'; 
									else echo number_format($area).'m²';
									echo '</span>
									</div>
									<div class="info">
									<span class="date">'.$cdate.'</span>';
									if($views > 0){
										echo '<span class="views">'.$views.' views</span>';
									}
									echo '<div class="intro">'.$intro.'</div>
									</div>
									</div>
									</div>';
								}
							}
							?>
						</div>
					</section>
					<div class="text-center">
						<?php paging($total_rows,$MAX_ROWS,$cur_page); ?>
					</div>

					<!-- Get child with child's content -->
					<?php
					$sql="SELECT * FROM tbl_categories WHERE par_id = ".$r_cate['id'];
					$objmysql->Query($sql);
					if($objmysql->Num_rows() > 0){
						while ($r_cate_child = $objmysql->Fetch_Assoc()) {							
							$cate_link = ROOTHOST.$r_cate_child['code'];
							echo '<section class="sec-category">
							<h2 class="sec-title"><i class="fa fa-circle" aria-hidden="true"></i><span><a href="'.$cate_link.'" title="'.$r_cate_child['name'].'">'.$r_cate_child['name'].'</a></span></h2>';

							echo '<div class="row list-items">';
							$sql_con="SELECT * FROM tbl_contents WHERE isactive=1 AND category_id = ".$r_cate_child['id']." ORDER BY cdate DESC LIMIT 0,4";
							$objdata->Query($sql_con);
							while ($r_con = $objdata->Fetch_Assoc()) {
								$title 	= stripcslashes($r_con['title']);
								$code 	= $r_con['code'];
								$thumb 	= getThumb($r_con['thumb'], 'img-responsive', '');
								$views 	= (int)$r_con['visited'];
								$cdate 	= convert_date($r_con['cdate']);
								$intro 	= Substring(html_entity_decode(stripslashes($r_con['intro'])), 0, 60);
								$link 	= ROOTHOST.$r_cate_child['code'].'/'.$r_con['code'].'.html';

								echo '<div class="col-md-6 col-sm-6 col-xs-6 item">
								<div class="box-thumb">
								<a href="'.$link.'" title="'.$title.'">'.$thumb.'</a>
								</div>
								<div class="content">
								<div class="title"><a href="'.$link.'" title="'.$title.'">'.$title.'</a></div>
								<div class="info">
								<span class="date">'.$cdate.'</span>';
								if($views > 0){
									echo '<span class="views">'.$views.' views</span>';
								}
								echo '<div class="intro">'.$intro.'</div>
								</div>
								</div>
								</div>';
							}
							echo '</div>';
							echo '</section>';
						}
					} ?>
				</div>

				<div class="col-md-4 col-sm-4 wrap-aside">
					<?php include_once("modules/mod_content/layout.php");?>
				</div>
			</div>
		</div>
	</div>
</section>