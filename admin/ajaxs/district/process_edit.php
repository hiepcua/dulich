<?php
session_start();
require_once('../../../global/libs/gfconfig.php');
require_once('../../../global/libs/gfinit.php');
require_once('../../../global/libs/gffunc.php');
require_once('../../libs/cls.mysql.php');
require_once("../../libs/cls.user.php");

$objuser=new CLS_USER;
if(!$objuser->isLogin()) die("E01");
if(isset($_POST['id'])) {
	$obj=new CLS_MYSQL; 
	$id=(int)$_POST['id'];
	$name=addslashes(htmlentities(strip_tags($_POST['name'])));
	$city=isset($_POST['city'])?(int)$_POST['city']:0;
	$order=isset($_POST['order'])?(int)$_POST['order']:0;
	$sql="UPDATE tbl_district SET `city_id`='$city',`name`='$name',`order`='$order' WHERE id='$id'";
	$obj->Exec($sql);
	echo 'success';
}?>