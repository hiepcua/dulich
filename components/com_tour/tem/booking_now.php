<?php
$code = isset($_GET['code']) ? addslashes(trim($_GET['code'])) : '';
if($code == '') page404();
$p_tour_id = $_POST['txt_tour'];
// Handle post data
if(isset($_POST['txt_tour'])){
	// Get tour info by un_name
	$sql = "SELECT * FROM tbl_tour WHERE `id` ='".$p_tour_id."'";
	$objmysql->Query($sql);
	$row = $objmysql->Fetch_Assoc();

	
	$p_place_id = $row['place_id'];
	$p_name = $row['name'];
	$p_code = $row['code'];
	$p_price1 = $row['price1'];
	$p_price2 = $row['price2'];
	$p_starting_gate = $row['starting_gate'];
	$p_days = $row['days'];
	$p_vehicle = $row['vehicle'];
	$p_number_of_holes = $row['number_of_holes'];
	$p_price_range = $row['price_range'];
	$p_hobby = $row['hobby'];
	$p_cdate = time();
	$p_adult = isset($_POST['adult']) ? stripcslashes(trim($_POST['adult'])) : '';
	$p_child = isset($_POST['child']) ? stripcslashes(trim($_POST['child'])) : '';
	$p_baby = isset($_POST['baby']) ? stripcslashes(trim($_POST['baby'])) : '';
	$p_fullname = isset($_POST['name']) ? stripcslashes(trim($_POST['name'])) : '';
	$p_email = isset($_POST['email']) ? stripcslashes(trim($_POST['email'])) : '';
	$p_phone = isset($_POST['tel']) ? stripcslashes(trim($_POST['tel'])) : '';
	$p_address = isset($_POST['address']) ? stripcslashes(trim($_POST['address'])) : '';
	$p_start_date = isset($_POST['start_date']) ? time($_POST['start_date']) : $row['departure'];
	$p_status = 1;

	$sql2="INSERT INTO tbl_booking (`tour_id`, `place_id`, `name`, `code`, `price1`, `price2`, `starting_gate`, `start_date`, `days`, `vehicle`, `number_of_holes`, `price_range`, `hobby`, `cdate`, `adult`, `child`, `baby`, `fullname`, `email`, `phone`, `address`, `status`) VALUES ('".$p_tour_id."', '".$p_place_id."', '".$p_name."', '".$p_code."', '".$p_price1."', '".$p_price2."', '".$p_starting_gate."', '".$p_start_date."', '".$p_days."', '".$p_vehicle."', '".$p_number_of_holes."', '".$p_price_range."', '".$p_hobby."', '".$p_cdate."', '".$p_adult."', '".$p_child."', '".$p_baby."', '".$p_fullname."', '".$p_email."', '".$p_phone."', '".$p_address."', '".$p_status."')";

	if($objmysql->Query($sql2)){
		echo "<script language=\"javascript\">window.location='".ROOTHOST.'booking/success'."'</script>";
	}else{
		echo "<script language=\"javascript\">window.location='".ROOTHOST.'booking/error'."'</script>";
	}
}
?>