<?php
session_start();
require_once("../../global/libs/gfinit.php");
require_once("../../global/libs/gfconfig.php");
require_once("../../libs/cls.mysql.php");
require_once("../../libs/cls.user.php");

$objuser=new CLS_USER;
$obj=new CLS_MYSQL;
if(!$objuser->isLogin()) die("E01");
if(isset($_POST['type_id'])){
	$type_id=(int)$_POST['type_id'];
	$sql = "SELECT * FROM tbl_categories WHERE type_id=$type_id AND isactive=1";
	$obj->Query($sql);
	while($r=$obj->Fetch_Assoc()) {
		echo "<option value='".$r['id']."'>".$r['name']."</option>";
	}
} ?>