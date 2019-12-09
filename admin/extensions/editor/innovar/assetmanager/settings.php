<?php
session_start(); 
ini_set("display_errors",1);

require_once('../../../../../global/libs/gfconfig.php');
require_once('../../../../../global/libs/gfinit.php');
require_once('../../../../../global/libs/gffunc.php');
require_once('../../../../libs/cls.mysql.php');
require_once("../../../../libs/cls.user.php");

$UserLogin = new CLS_USER();
if(!$UserLogin->isLogin()) die('Vui lòng đăng nhập hệ thống');

$bReturnAbsolute=false;
$sBaseVirtual0="http://".$_SERVER['HTTP_HOST']."/images"; 
$sBase0=$_SERVER['DOCUMENT_ROOT']."/images";
$sName0="Images";

$sBaseVirtual1="";
$sBase1="";
$sName1="";

$sBaseVirtual2="";
$sBase2="";
$sName2="";

$sBaseVirtual3="";
$sBase3="";
$sName3="";
?>