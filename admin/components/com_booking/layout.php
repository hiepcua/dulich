<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','booking');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');

$objmysql 	= new CLS_MYSQL();

if(isset($_POST['cmdsave']) && (int)$_POST['tour'] !== 0){
	// Get tour info by un_name
	$sql0 = "SELECT * FROM tbl_tour WHERE `id` ='".$_POST['tour']."'";
	$objmysql->Query($sql0);
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
	$p_start_date = (isset($_POST['start_date']) && (int)$_POST['start_date'] !== 0) ? time($_POST['start_date']) : $row['departure'];
	$p_status = isset($_POST['status']) ? (int)$_POST['status'] : 1;

	if(isset($_POST['txtid'])){
		$ID = (int)$_POST['txtid'];
		// $sql = "UPDATE tbl_booking SET 
  //       `tour_id`='".$p_tour_id."',
  //       `place_id`='".$p_place_id."',
  //       `name`='".$p_name."',
  //       `code`='".$p_code."',
  //       `price1`='".$p_price1."',
  //       `price2`='".$p_price2."',
  //       `starting_gate`='".$p_starting_gate."',
  //       `start_date`='".$p_start_date."',
  //       `days`='".$p_days."',
  //       `vehicle`='".$p_vehicle."',
  //       `number_of_holes`='".$p_number_of_holes."',
  //       `price_range`='".$p_price_range."',
  //       `hobby`='".$p_hobby."',
  //       `cdate`='".$p_cdate."',
  //       `adult`='".$p_adult."',
  //       `child`='".$p_child."',
  //       `baby`='".$p_baby."',
  //       `fullname`='".$p_fullname."',
  //       `email`='".$p_email."',
  //       `phone`='".$p_phone."',
  //       `address`='".$p_address."',
  //       `status`='".$p_status."'
  //       WHERE id='".$ID."'";
		$sql = "UPDATE tbl_booking SET 
        `status`='".$p_status."'
        WHERE id='".$ID."'";
        $result = $objmysql->Exec($sql);

	}else{
		$sql="INSERT INTO tbl_booking (`tour_id`, `place_id`, `name`, `code`, `price1`, `price2`, `starting_gate`, `start_date`, `days`, `vehicle`, `number_of_holes`, `price_range`, `hobby`, `cdate`, `adult`, `child`, `baby`, `fullname`, `email`, `phone`, `address`, `status`) VALUES ('".$p_tour_id."', '".$p_place_id."', '".$p_name."', '".$p_code."', '".$p_price1."', '".$p_price2."', '".$p_starting_gate."', '".$p_start_date."', '".$p_days."', '".$p_vehicle."', '".$p_number_of_holes."', '".$p_price_range."', '".$p_hobby."', '".$p_cdate."', '".$p_adult."', '".$p_child."', '".$p_baby."', '".$p_fullname."', '".$p_email."', '".$p_phone."', '".$p_address."', '".$p_status."')";
		$result = $objmysql->Exec($sql);
	}
	echo "<script language=\"javascript\">window.location.href='".ROOTHOST_ADMIN.COMS."'</script>";
}

if(isset($_POST["txtaction"]) && $_POST["txtaction"]!=""){
	$ids=trim($_POST["txtids"]);
	if($ids!='')
		$ids = substr($ids,0,strlen($ids)-1);
	$ids=str_replace(",","','",$ids);
	switch ($_POST["txtaction"]){
		case "public": 
			$sql_active = "UPDATE `tbl_booking` SET `isactive`='1' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_active);
			break;
		case "unpublic":
			$sql_unactive = "UPDATE `tbl_booking` SET `isactive`='0' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_unactive);
			break;
		case "delete":
			$sql_del = "DELETE FROM `tbl_booking` WHERE `id` in ('$ids')";
	        $objmysql->Exec($sql_del);
	        break;
		case 'order':
			$sls = explode(',',$_POST['txtorders']); 
			$ids = explode(',',$_POST['txtids']);
			$n = count($ids);
			for($i=0;$i<$n;$i++){
				$sql_order = "UPDATE `tbl_booking` SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
				$objmysql->Exec($sql_order);
			}
	}
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

$task='';
if(isset($_GET['task'])) $task=$_GET['task'];
if(!is_file(THIS_COM_PATH.'task/'.$task.'.php')){
	$task='list';
}
include_once(THIS_COM_PATH.'task/'.$task.'.php');
unset($obj); unset($task);	unset($objlang); unset($ids);
?>