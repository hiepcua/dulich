<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
$id='';
if(isset($_GET['id'])){
	$id=(int)$_GET['id'];
}
$sql = "UPDATE `tbl_type_of_land` SET `display_home`=if(`display_home`=1,0,1) WHERE `id` in ('$id')";
$objmysql->Exec($sql);
echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
?>