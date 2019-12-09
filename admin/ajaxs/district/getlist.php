<?php
session_start();
require_once('../../../global/libs/gfconfig.php');
require_once('../../../global/libs/gfinit.php');
require_once('../../../global/libs/gffunc.php');
require_once('../../libs/cls.mysql.php');
require_once("../../libs/cls.user.php");
require_once("../../libs/cls.city.php");
require_once("../../libs/cls.district.php");

$objuser=new CLS_USER;
if(!$objuser->isLogin()) die("E01");
if(isset($_GET['city'])){
	$city = (int)$_GET['city'];
	$sql="SELECT * FROM `tbl_district` WHERE city_id=$city";
	$obj=new CLS_MYSQL; 
	$obj->Query($sql);
	echo '<option value="">-- Chọn quận/huyện--</option>';
	while($r=$obj->Fetch_Assoc()) echo "<option value='".$r['id']."'>".$r['name']."</option>";
} ?>