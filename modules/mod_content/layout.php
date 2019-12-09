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
		echo'<div class="info">
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
		echo'<div class="info">
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