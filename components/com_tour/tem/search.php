<?php
$strWhere = '';
$keywork = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';

// Handle post data
$p_duration = isset($_GET['duration']) ? $_GET['duration'] : '';
$date_depart = isset($_GET['date_depart']) ? date("d-m-Y", strtotime($_GET['date_depart'])) : '01-01-1970';
$p_range = isset($_GET['price_range']) ? $_GET['price_range'] : '';
$p_hobby = isset($_GET['hobby']) ? $_GET['hobby'] : '';

if($keywork !== ''){
	$strWhere.=" AND name LIKE '%".$keywork."%'";
};
if($p_duration !== ''){
	$strWhere.=" AND days=".$p_duration;
};
if($date_depart !== '01-01-1970'){
	$strWhere.=" AND departure=".time($date_depart);
};
if($p_range !== ''){
	$strWhere.=" AND price_range=".$p_range;
};
if($p_hobby !== ''){
	$strWhere.=" AND hobby=".$p_hobby;
};


// Begin pagging
define('OBJ_PAGE','SEARCH');
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_tour WHERE isactive=1 ".$strWhere;
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

$MAX_ROWS = 16;
if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/$MAX_ROWS)){
	$_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/$MAX_ROWS);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<section class="page page-contents">
	<!-- breadcrumb-light-->
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item">
					<a href="<?php echo ROOTHOST; ?>"><i class="ico-home-blue"></i></a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">Search</li>
			</ol>
		</div>
	</section>
	<!-- e: breadcrumb-light-->

	<div class="search-tour-home bg-light2">
		<div class="container">
			<form action="<?php echo ROOTHOST.'search';?>" method="get" id="target">
				<section class="search-tour">
					<div class="row">
						<div class="col-lg-2 col-sm-6">
							<div class="your-place">
								<select class="custom-select" name="city_want_id">
									<option value="">Nơi bạn muốn đến</option>
									<option value="44" selected="selected">nhật bản</option>
									<option value="5">Đà Lạt</option>
									<option value="9">Yên Bái</option>
									<option value="46">hồng kong</option>
									<option value="23">Quảng Bình</option>
									<option value="42">Lào</option>
									<option value="37">singapore</option>
									<option value="24">Phú Yên</option>
									<option value="45">hàn quốc</option>
									<option value="11">Phượng Hoàng</option>
									<option value="14">Tokyo</option>
									<option value="87">Quy Nhơn</option>
									<option value="28">Côn Đảo</option>
									<option value="27">Phan Thiết</option>
									<option value="10">Sapa</option>
									<option value="48">đài loan</option>
									<option value="4">Đà Nẵng</option>
									<option value="1">Hà Nội</option>
									<option value="41">myanmar</option>
									<option value="47">trung quốc</option>
									<option value="38">malaysia</option>
									<option value="12">Trùng Khánh</option>
									<option value="31">Cần Thơ</option>
									<option value="25">Nha Trang</option>
									<option value="66">thụy điển</option>
									<option value="6">Hà Giang</option>
									<option value="13">Lệ Giang</option>
									<option value="70">nga</option>
									<option value="19">Tây Bắc</option>
									<option value="16">Hạ Long</option>
									<option value="21">Quảng Nam</option>
									<option value="82">Quảng Ngãi</option>
									<option value="22">Huế</option>
									<option value="88">Thái Bình</option>
									<option value="84">Hải Dương</option>
									<option value="86">Buôn Mê Thuột</option>
									<option value="8">Hòa Bình</option>
									<option value="57">pháp</option>
									<option value="35">Thái lan</option>
									<option value="30">Phú Quốc</option>
									<option value="17">Ninh Bình</option>
									<option value="83">Nghệ An</option>
									<option value="2">TP HCM</option>
									<option value="7">Bắc Kạn</option>
									<option value="18">Đông Bắc</option>
									<option value="20">Hội An</option>
									<option value="26">Ninh Thuận</option>
									<option value="29">Đồng Nai</option>
									<option value="32">An Giang</option>
									<option value="33">Tiền Giang</option>
									<option value="34">Vinh Long</option>
									<option value="36">campuchia</option>
									<option value="39">philipnines</option>
									<option value="40">brunei</option>
									<option value="43">indonesia</option>
									<option value="49">triều tiên</option>
									<option value="50">mandives</option>
									<option value="51">Ấn Độ</option>
									<option value="52">nepal</option>
									<option value="53">dubai</option>
									<option value="54">ai cập</option>
									<option value="55">israel</option>
									<option value="56">thổ nhĩ kỳ</option>
									<option value="58">bỉ</option>
									<option value="59">hà lan</option>
									<option value="60">đức</option>
									<option value="61">ý</option>
									<option value="62">thụy sĩ</option>
									<option value="63">hy lạp</option>
									<option value="64">anh</option>
									<option value="65">áo</option>
									<option value="67">scotland</option>
									<option value="68">đan mạch</option>
									<option value="69">phần lan</option>
									<option value="71">czech</option>
									<option value="72">hungary</option>
									<option value="73">ba lan</option>
									<option value="74">mỹ</option>
									<option value="75">canada</option>
									<option value="76">nam phi</option>
									<option value="77">brazil</option>
									<option value="78">cu ba</option>
									<option value="79">úc</option>
									<option value="80">new zealand</option>
									<option value="81">nam phi</option>
									<option value="85">Quảng Trị</option>
									<option value="89">Bình Định</option>
								</select>
							</div>
						</div>

						<div class="col-lg-2 col-sm-6">
							<div class="time-tour">
								<select class="custom-select" name="duration">
									<option value="">Thời gian tour</option>
									<?php
									$duration = unserialize(TOUR_TIME);
									foreach ($duration as $key => $value) {
										if($key === $p_duration){
											echo '<option value="'.$key.'" selected="selected">'.$value.'</option>';
										}else{
											echo '<option value="'.$key.'">'.$value.'</option>';
										}
									}
									?>
								</select>
							</div>
						</div>

						<div class="col-lg-2 col-sm-6">
							<div class="date-tour">
								<input value="<?php if($date_depart!=='01-01-1970') echo $date_depart; ?>" name="date_depart" class="form-control" data-toggle="datepicker" placeholder="Ngày khởi hành">
							</div>
						</div>

						<div class="col-lg-2 col-sm-6">
							<div class="price-tour">
								<select class="custom-select" name="price_range">
									<option value="">Giá tour</option>
									<?php
									$price_range = unserialize(TOUR_PRICE);
									foreach ($price_range as $key => $value) {
										if($key === $p_range){
											echo '<option value="'.$key.'" selected="selected">'.$value.'</option>';
										}else{
											echo '<option value="'.$key.'">'.$value.'</option>';
										}
									}
									?>
								</select>
							</div>
						</div>

						<div class="col-lg-2 col-sm-6 last-item">
							<div class="your-favourite">
								<select class="custom-select" name="hobby">
									<option value="">Sở thích</option>
									<?php
									$hobby = unserialize(TOUR_HOBBIT);
									foreach ($hobby as $key => $value) {
										if($key === $p_hobby){
											echo '<option value="'.$key.'" selected="selected">'.$value.$p_hobby.'</option>';
										}else{
											echo '<option value="'.$key.'">'.$value.'</option>';
										}
									}
									?>
								</select>
							</div>
						</div>

						<button class="btn btn-blue btn-block" type="button" id="buttonSearch"><i class="fa fa-search"></i></button>
					</div>
				</section>
			</form>
		</div>
	</div>
	<script>
		$( "#buttonSearch" ).click(function() {
			$( "#target" ).submit();
		});
	</script>

	<!-- list-tours-->
	<section class="list-tours bg-light">
		<div class="container">
			<div class="isotope row" id="iw-isotope-main">
				<?php
				$t_days = unserialize(TOUR_TIME);
				$star = ($cur_page - 1) * $MAX_ROWS;
				$sql1="SELECT * FROM tbl_tour WHERE isactive=1 ".$strWhere." ORDER BY cdate DESC LIMIT $star,".$MAX_ROWS;
				$objmysql->Query($sql1);
				while ($row1 = $objmysql->Fetch_Assoc()) {
					$name = stripcslashes($row1['name']);
					$link = ROOTHOST.'tour/'.$row1['un_name'];
					$images = json_decode($row1['images']);
					$thumb = getThumb($images[0]->url, 'card-img-top rounded', $images[0]->alt);
					$days = (int)$row1['days'];
					$num_of_holes = (int)$row1['number_of_holes'];
					?>
					<div class="col-lg-3 col-md-4 col-sm-6  other element-item">
						<div class="card card-1 rounded-bottom">
							<a class="card-link effect-btn" href="<?php echo $link; ?>" title="<?php echo $name; ?>">
								<?php echo $thumb; ?>
								<div class="extra rounded-bottom">
									<span class="availability">Số chỗ: <?php echo $num_of_holes; ?></span>
									<span class="timer"><?php echo $t_days[$days]; ?></span>
								</div>
								<span class="btn btn-info">Đặt ngay</span>
							</a>
							<div class="card-body">
								<h5 class="cart-title">
									<a href="<?php echo $link; ?>"><?php echo $name; ?></a>
								</h5>
								<div class="card-text">
									<?php
									if($row1['departure'] > 0){
										echo 'Khởi hành: <strong>'.date('d-m-Y', $row1['departure']).'</strong>';
									}else{
										echo 'Khởi hành: <strong>Hàng ngày</strong>';
									}?>
								</div>
								<div class="item-price">
									<?php
									$price1 = (int)$row1['price1'];
									$price2 = (int)$row1['price2'];
									if($price1 !== 0 && $price2 !== 0){
										echo '<span class="new-price">'.number_format($price2).' đ</span>';
										echo '<span class="old-price">'.number_format($price1).' đ</span>';
									}else if($price1 === 0 && $price2 === 0){
										echo '<span>Liên hệ: <a href="tel:'.$GLOBALS['conf']->Phone.'" class="hotline">'.$GLOBALS['conf']->Phone.'</a></span>';
									}else if($price1 !== 0 && $price2 === 0){
										echo '<span class="new-price">'.number_format($price1).' đ</span>';
									}
									?>
								</div>
							</div>
						</div>
					</div>
				<?php } ?>
			</div>
			<div class="text-center">
				<?php paging($total_rows,$MAX_ROWS,$cur_page); ?>
			</div>
		</div>
	</section>
	<!-- e: list-tours-->
</section>