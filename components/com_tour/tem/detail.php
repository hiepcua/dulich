<?php
$thisUrl = curPageURL();
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
$par_code = isset($_GET['par_code']) ? addslashes(trim($_GET['par_code'])) : '';
if($code == '' || $par_code == '') {
	page404();
}

$sql = "SELECT * FROM tbl_categories WHERE `code` ='".$par_code."'";
$objmysql->Query($sql);
$r_cate		= $objmysql->Fetch_Assoc();
$cat_id 	= $r_cate['id'];
$par_id 	= $r_cate['par_id'];
$cat_name 	= stripslashes($r_cate['name']);

$sql = "SELECT c.*,d.name AS cat_name,t.title as type_name,
	e.name AS city_name,f.name AS district_name,g.name AS ward_name
	FROM tbl_contents AS c 
	INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
	INNER JOIN tbl_categories AS d ON c.category_id=d.id
	LEFT JOIN tbl_city AS e ON c.city_id=e.id
	LEFT JOIN tbl_district AS f ON c.district_id=f.id
	LEFT JOIN tbl_ward AS g ON c.ward_id=g.id
	WHERE c.isactive = 1 AND c.`code` ='".$code."'";
$objmysql->Query($sql); 
if ($objmysql->Num_rows()>0) {
	$result = $objmysql->Fetch_Assoc();
	$con_id = $result['id'];

	if(!isset($_SESSION['VIEW-CONTENT-'.$con_id])){
		$sql_update = "UPDATE `tbl_contents` SET `visited` = `visited` + 1 WHERE `id` = ".$con_id;
		$_SESSION['VIEW-CONTENT-'.$con_id] = 1;
		$objdata->Exec($sql_update);
	}

	$cat_id 	= $result['category_id'];
	$cat_name	= $result['cat_name'];
	$views 		= $result['visited'];
	$cdate 		= convert_date($result['cdate']);
	$thumb 		= getThumb($result['thumb'], '', 'img-responsive');
	$link  		= ROOTHOST.$r_cate['code'].'/'.$result['code'].'.html';
	$images 	= json_decode($result['images']);
	$num_image	= count($images);
	$price 		= convert_price($result['price']);
	$area  		= $result['area'];
	$type_land	= $result['type_of_land_id'];
	$type_name  = $result['type_name'];
	$ispay = $result['ispay']==0?'<label class="label label-success">Chưa bán</label>':'<label class="label label-danger">Đã bán</label>';
	$city_name = $result['city_name'];
	$district_name = $result['district_name'];
	$ward_name = $result['ward_name'];
	$latlng = $result['latlng']; 
	$arr = explode(",",$latlng);
	$lat = isset($arr[0])?$arr[0]:0;$lng = isset($arr[1])?$arr[1]:0;
} ?>
<section class="page page-contents">
	<div class="article component">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
					<div class="content">
						<h1 class="page-title"><?php echo stripslashes(html_entity_decode($result['title'])); ?></h1>
						<div class="box_area">
							<div class="item pull-left">Loại nhà đất: <span><?php echo $type_name;?></span></div>
							<div class="item pull-left">Khu vực: <span><?php echo $cat_name;?></span></div>
						</div><div class="clearfix"></div>
						<div class="box_price">
							<div class="price pull-left">Giá: <span><?php if($price==="" || $price==0) echo 'Thỏa thuận'; else echo $price;?></span></div>
							<div class="price pull-left">Diện tích: <span><?php if($area==="" || $area==0) echo 'Không xác định'; else echo number_format($area).'m²';?></span></div>
							<div class="price pull-left">Trạng thái: <?php echo $ispay;?></span></div>
						</div><div class="clearfix"></div>
						<div class="intro"><div>Thông tin nhà đất:</div>
							<?php echo $result['intro']; ?></div>
						<div class="full_text">
							<?php echo stripslashes(html_entity_decode($result['fulltext'])); ?>
						</div>
						<?php if($result['thumb']!='') { ?>
						<div id="big-image" class="box-thumb">
							<?php echo $thumb; ?>
							<a class="control-prev" href="javascript:void(0)" role="button" data-slide="prev">
							  <i class="fa fa-2x fa-chevron-left" aria-hidden="true"></i>
							</a>
							<a class="control-next" href="javascript:void(0)" role="button" data-slide="next">
							  <i class="fa fa-2x fa-chevron-right" aria-hidden="true"></i>
							</a>
						</div><?php } ?>
						<div class="list-images">
							<ul><?php if($result['thumb']!=''){ ?>
								<li class='slide0 active' dataid='0'><?php echo $thumb; ?></li>
							<?php }
							if($num_image > 0){
								for($i = 0 ; $i < $num_image; $i++){
									echo '<li class="slide'.($i+1).'" dataid="'.($i+1).'">';
									echo '<img src="'.$images[$i]->url.'" alt="'.$images[$i]->alt.'" class="small-thumb">';
									echo '</li>';
								}
							} ?></ul>
						</div>
						<?php if($latlng!='') { ?>
						<div class="clearfix"><br><h3>Bản đồ nhà đất</h3><br></div>
						<div id="map" style="width: 100%; height: 500px;">&nbsp;</div>
						<?php } ?>
						<div class="clearfix"><br></div>
						<div class="meta-info">
							<ul class="list-inline">
								<li class="date">Ngày đăng: <?php echo $cdate; ?></li>
								<?php
								if($views > 0){
									echo '<li class="views">Lượt xem: '.$views.'</li>';
								}else{
									echo '<li class="views">Lượt xem: 1</li>';
								} ?>
							</ul>

							<ul class="list-inline article-social">
								<li><div class="fb-like" data-href="<?php echo $thisUrl; ?>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>	
							</ul>
						</div>
					</div>

					<div class="clearfix"><br></div>
					<ul class="list-inline">
						<!-- <li><div class="fb-like" data-href="<?= $thisUrl; ?>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>		 -->
					</ul>	
					<div class="clearfix"></div>
					<!-- <div class="fb-comments" data-href="<?= $thisUrl; ?>" data-width="100%" data-numposts="10"></div>				 -->
					<div class="clearfix"></div>

					<!-- Related news -->
					<div class="releated_news">
						<h2><span>Xem thêm các bất động sản khác</span></h2>
						<ul>
							<?php 
							$sql = "SELECT * FROM tbl_contents WHERE isactive = 1 AND id <> $con_id AND category_id = $cat_id ORDER BY cdate DESC LIMIT 0,6";
							$objmysql->Query($sql);
							while($r = $objmysql->Fetch_Assoc()) { 
								$name = stripslashes(html_entity_decode($r['title'])); 
								$code = $r['code'];
								$link = ROOTHOST.$par_code.'/'.$code.'.html';
								echo '<li><a href="'.$link.'" title="'.$name.'"><i class="fa fa-circle" aria-hidden="true"></i>'.$name.'</a></li>';
							} ?>
						</ul>
					</div>
					<!-- End Related news -->
				</div>

				<div class="col-md-4 col-sm-4 wrap-aside">
					<aside class="aside latest-news">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Tin mới nhất</span></h3>
						<?php
						$sql="SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
								INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
								INNER JOIN tbl_categories AS d ON c.category_id=d.id
								WHERE c.isactive=1 ORDER BY c.cdate DESC LIMIT 0,5";
						$objmysql->Query($sql);
						$i=1;
						while ($row = $objmysql->Fetch_Assoc()) {
							$title 	= stripcslashes($row['title']);
							$code 	= $row['code'];
							$thumb 	= getThumb($row['thumb'], 'img-responsive', '');
							$views 	= (int)$row['visited'];
							$cdate 	= convert_date($row['cdate']);
							$cat_name	= $row['cat_name'];
							$price 		= convert_price($row['price']);
							$area  		= $row['area'];
							$type_land	= $row['type_of_land_id'];
							$type_name  = $row['type_name'];

							$sql_cate="SELECT * FROM tbl_categories WHERE isactive=1 AND id=".$row['category_id'];
							$objdata->Query($sql_cate);
							$r_cate = $objdata->Fetch_Assoc();
							$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';

							echo '<div class="item">
							<div class="number">'.$i.'.</div>
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
								echo '<span class="views">'.$views.'views</span>';
							}
							echo '</div>
							</div>
							<div class="box-thumb"><a href="'.$link.'" title="'.$title.'">'.$thumb.'</a></div>
							</div>';
							$i++;
						}
						?>
					</aside>

					<aside class="aside advertisement">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Trending</span></h3>
						<div>
							<a href="" title="Trending"><img src="<?php echo ROOTHOST; ?>images/advantisement.jpg" align=""></a>
						</div>
					</aside>

					<aside class="aside latest-news">
						<h3 class="aside-title"><i class="fa fa-circle" aria-hidden="true"></i><span>Tin mới nhất</span></h3>
						<?php
						$sql="SELECT c.*,d.name AS cat_name,t.title as type_name FROM tbl_contents AS c 
								INNER JOIN tbl_type_of_land AS t ON c.type_of_land_id=t.id
								INNER JOIN tbl_categories AS d ON c.category_id=d.id 
								WHERE c.isactive=1 ORDER BY c.cdate DESC LIMIT 0,5";
						$objmysql->Query($sql);
						$i=1;
						while ($row = $objmysql->Fetch_Assoc()) {
							$title 	= stripcslashes($row['title']);
							$code 	= $row['code'];
							$thumb 	= getThumb($row['thumb'], 'img-responsive', '');
							$views 	= (int)$row['visited'];
							$cdate 	= convert_date($row['cdate']);
							$cat_name	= $row['cat_name'];
							$price 		= convert_price($row['price']);
							$area  		= $row['area'];
							$type_land	= $row['type_of_land_id'];
							$type_name  = $row['type_name'];

							$sql_cate="SELECT * FROM tbl_categories WHERE isactive=1 AND id=".$row['category_id'];
							$objdata->Query($sql_cate);
							$r_cate = $objdata->Fetch_Assoc();
							$link 	= ROOTHOST.$r_cate['code'].'/'.$code.'.html';

							echo '<div class="item">
							<div class="number">'.$i.'.</div>
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
								echo '<span class="views">'.$views.'views</span>';
							}
							echo '</div>
							</div>
							<div class="box-thumb"><a href="'.$link.'" title="'.$title.'">'.$thumb.'</a></div>
							</div>';
							$i++;
						}
						?>
					</aside>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var slide_num = 0; var slide_count = 0;
$(document).ready(function(){
	$(".list-images li").each(function(){
		slide_count++;
	})
	$(".list-images li").click(function(){
		$(".list-images li").removeClass('active');
		$(this).addClass('active');
		slide_num = parseInt($(this).attr('dataid'));
		var src = $(this).find("img").attr("src");
		//console.log(slide_num); console.log(src);
		$("#big-image img").attr("src",src);
	})
	$("#big-image .control-next").click(function(){
		if(slide_num<slide_count-1) slide_num++;
		else slide_num=0;
		//console.log(slide_num);
		$(".list-images li").removeClass('active');
		$(".list-images .slide"+slide_num).addClass('active');
		var src = $(".list-images .slide"+slide_num).find("img").attr("src");
		//console.log(src);
		$("#big-image img").attr("src",src);	
	})
	$("#big-image .control-prev").click(function(){
		if(slide_num>0) slide_num--;
		else slide_num=slide_count-1;
		//console.log(slide_num);
		$(".list-images li").removeClass('active');
		$(".list-images .slide"+slide_num).addClass('active');
		var src = $(".list-images .slide"+slide_num).find("img").attr("src");
		//console.log(src);
		$("#big-image img").attr("src",src);
		
	})
})
</script>
<?php if($lat!='' && $lng!='') { ?>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuGtMOI9lMUSeHP1fOGYXr0v4pSXMaqlY&v=3.exp&sensor=false&libraries=places&language=vi"></script>
<script>
var myLatLng = {lat:<?php echo $lat;?>, lng:<?php echo $lng;?>};
var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 12,
  center: myLatLng,
  mapTypeId: google.maps.MapTypeId.ROADMAP
});
var marker = new google.maps.Marker({
  position: myLatLng,
  map: map,
  title: '<?php echo $ward_name.', '.$district_name.', '.$city_name;?>'
});
</script>
<?php } ?>