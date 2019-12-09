<?php
session_start();
require_once('../../../global/libs/gfconfig.php');
require_once('../../../global/libs/gfinit.php');
require_once('../../../global/libs/gffunc.php');
require_once('../../libs/cls.mysql.php');
require_once("../../libs/cls.user.php");

$objuser=new CLS_USER;
if(!$objuser->isLogin()) die("E01");
if(isset($_POST['name'])) {
	$obj=new CLS_MYSQL; 
	$name=addslashes(htmlentities(strip_tags($_POST['name'])));
	$city=isset($_POST['city'])?(int)$_POST['city']:0;
	$district=isset($_POST['district'])?(int)$_POST['district']:0;
	$order=isset($_POST['order'])?(int)$_POST['order']:0;
	$sql="INSERT INTO tbl_ward(`city_id`,`district_id`,`name`,`order`) 
	VALUES ('$city','$district','$name','$order')";
	$obj->Exec($sql); //echo $sql;
	die('success');
}?>