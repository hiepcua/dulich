<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('COMS','tour');
define('THIS_COM_PATH',COM_PATH.'com_'.COMS.'/');
require_once('libs/cls.place.php');
require_once('extensions/cls.upload.php');
$obj_place 	= new CLS_PLACE();
$objmysql 	= new CLS_MYSQL();
$objmedia 	= new CLS_UPLOAD();
$cur_dir 	= '../images/';


function createFolder($path){
    if(!is_dir($path)){
		mkdir($path, 0777);
	}
}

$sort = array();
if(isset($_POST["cmdsave"])){
	$obj_images = array();
	$obj_fileImages = array();
	$txt_images = isset($_POST['txt_images']) ? $_POST['txt_images'] : '';
	$file_images = isset($_FILES['file_images']) ? $_FILES['file_images'] : '';
	$Images = '';
	$firstImage = '';
	
	if(isset($_POST['txtid'])){
		if($txt_images !== ''){
			foreach ($_POST['txt_images'] as $k => $val) {
				$n = count($obj_images);
				$obj_images[$n]['url'] = addslashes($val);
				$obj_images[$n]['alt'] = $_POST['txt_alt'][$k];
				$obj_images[$n]['order'] = isset($_POST['image_order'][$k]) ? (int)$_POST['image_order'][$k] : 0;
			}
		}

		// Re-sort an array's element by one of their element
		usort(
		    $obj_images,
		    function ($a, $b) {
		        if ($a['order'] == $b['order']) {
		            return 0;
		        }
		        return ($a['order'] < $b['order']) ? -1 : 1;
		    }
		);

		$firstImage = isset($obj_images[0]['url']) ? $obj_images[0]['url'] : '';
		$Images = json_encode($obj_images, JSON_UNESCAPED_UNICODE);
	}else{
		$total = count($_FILES['file_images']['name']);
		if($total > 0){
			/* Create folder inside images folder */
			$un_name = un_unicode($_POST['txt_name']);
			$folder_image_path = $cur_dir.$un_name;
			createFolder($folder_image_path);

			for( $i=0 ; $i < $total ; $i++ ) {
				$tmpFilePath = $_FILES['file_images']['tmp_name'][$i];
				if ($tmpFilePath != ""){
					$newFilePath = $folder_image_path.'/';
					$objmedia->setPath($newFilePath);
					$image_name = $objmedia->UploadFiles("file_images", $i, $newFilePath);

					/* Add image path to object */
					$obj_fileImages[$i]['url'] = ROOTHOST.'images/'.$un_name.'/'.$image_name;
					$obj_fileImages[$i]['alt'] = '';
					$obj_fileImages[$i]['order'] = '';
				}
			}
		}

		$firstImage = isset($obj_fileImages[0]['url']) ? $obj_fileImages[0]['url'] : '';
		$Images = json_encode($obj_fileImages, JSON_UNESCAPED_UNICODE);
	}

	$CategoryID 	= isset($_POST['cbo_cata']) ? (int)$_POST['cbo_cata'] : 0;
	$Type_of_land 	= isset($_POST['cbo_type_of_land']) ? (int)$_POST['cbo_type_of_land'] : 0;
	$isActive 		= isset($_POST['opt_isactive']) ? (int)$_POST['opt_isactive'] : 0;
	$isHot 			= isset($_POST['opt_ishot']) ? (int)$_POST['opt_ishot'] : 0;
	$ispay 			= isset($_POST['opt_ispay']) ? (int)$_POST['opt_ispay'] : 0;
	$Price 			= isset($_POST['txt_price']) ? (int)$_POST['txt_price'] : 0;
	$Area 			= isset($_POST['txt_area']) ? (int)$_POST['txt_area'] : 0;
	
	$city 			= isset($_POST['cbo_city']) ? (int)$_POST['cbo_city'] : 0;
	$district		= isset($_POST['cbo_district']) ? (int)$_POST['cbo_district'] : 0;
	$ward			= isset($_POST['cbo_ward']) ? (int)$_POST['cbo_ward'] : 0;
	$latlng			= isset($_POST['latlng']) ? addslashes(strip_tags($_POST['latlng'])) :'';

	$Title 			= isset($_POST['txt_name']) ? addslashes($_POST['txt_name']) : '';
	$Code 			= un_unicode($_POST['txt_name']);
	$Author 		= $_SESSION[MD5($_SERVER['HTTP_HOST']).'_USERLOGIN']['username'];
	//$Sapo 			= isset($_POST['txt_sapo']) ? addslashes(htmlentities($_POST['txt_sapo'])) : '';
	$Intro 			= isset($_POST['txt_intro']) ? addslashes($_POST['txt_intro']) : '';
	$Fulltext 		= isset($_POST['txt_fulltext']) ? addslashes($_POST['txt_fulltext']) : '';
	$Thumb 			= isset($_POST['txtthumb']) ? addslashes($_POST['txtthumb']) : '';
	
	$cdate 			= strtotime($_POST['txt_cdate']);
	//$date 			= time();

	$Meta_title 	= isset($_POST['txt_metatitle']) ? addslashes(htmlentities($_POST['txt_metatitle'])) : '';
	$Meta_key 		= isset($_POST['txt_metakey']) ? addslashes(htmlentities($_POST['txt_metakey'])) : '';
	$Meta_desc 		= isset($_POST['txt_metadesc']) ? addslashes(htmlentities($_POST['txt_metadesc'])) : '';
	$seo_link 		= isset($_POST['txt_seo_link']) ? $_POST['txt_seo_link'] : '';

	$sql_cate 		= "SELECT * FROM tbl_categories WHERE id = ".$CategoryID;
	$objmysql->Query($sql_cate);
	$r_cate 		= $objmysql->Fetch_Assoc();
	$Link 			= ROOTHOST.$r_cate['code'].'/'.$Code.'.html';

	if(isset($_POST['txtid'])){
		$Mdate = time();
		$ID = $_POST['txtid'];

		$objmysql->Query("BEGIN");
		$sql = "UPDATE tbl_tour SET 
		`category_id` = '".$CategoryID."', 
		`code` 		= '".$Code."',
		`thumb` 	= '".$Thumb."',
		`images` 	= '".$Images."',
		`cdate` 	= '".$cdate."',
		`mdate` 	= '".$Mdate."',
		`author` 	= '".$Author."',
		`ishot` 	= '".$isHot."',
		`isactive` 	= '".$isActive."',
		`title` 	= '".$Title."',
		`intro` 	= '".$Intro."',
		`fulltext` 	= '".$Fulltext."',
		`type_of_land_id` = '".$Type_of_land."',
		`area` 		= '".$Area."',
		`city_id` 	= '".$city."',
		`district_id`= '".$district."',
		`ward_id` 	= '".$ward."',
		`latlng` 	= '".$latlng."',
		`price` 	= '".$Price."',
		`ispay` 	= '".$ispay."'
		WHERE `id` 	= '".$ID."'";
		$result = $objmysql->Exec($sql); //echo $sql;

		$sql2 = "UPDATE tbl_seo SET 
		`title` = '".$Title."', 
		`link` = '".$Link."',
		`image` = '".$Thumb."',
		`meta_title` = '".$Meta_title."',
		`meta_key` = '".$Meta_key."',
		`meta_desc` = '".$Meta_desc."'
		WHERE `link` = '".$seo_link."'";
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}
		else
			$objmysql->Exec('ROLLBACK');
	}else{
		$objmysql->Exec("BEGIN");
		$sql = "INSERT INTO tbl_tour (`category_id`,`code`,`thumb`,`images`,`cdate`,`author`,
		`ishot`,`isactive`,`ispay`,`title`,`intro`,`fulltext`,`type_of_land_id`,`area`,`price`,
		city_id,district_id,ward_id,latlng) 
		VALUES ('".$CategoryID."','".$Code."','".$Thumb."','$Images','".$cdate."','".$Author."','".$isHot."',
		'".$isActive."','".$ispay."','".$Title."', '".$Intro."', '".$Fulltext."','".$Type_of_land."'
		,'".$Area."','".$Price."','".$city."','".$district."','".$ward."', '".$latlng."')";
		$result = $objmysql->Exec($sql); //echo $sql;

		$sql2 = "INSERT INTO tbl_seo (`title`,`link`,`image`,`meta_title`,`meta_key`,`meta_desc`) 
		VALUES ('".$Title."','".$Link."','".$Thumb."','".$Meta_title."','".$Meta_key."','".$Meta_desc."')";
		$result2 = $objmysql->Exec($sql2);

		if($result && $result2){
			$objmysql->Exec('COMMIT');
		}else{
			$objmysql->Exec('ROLLBACK');
		}
	} //echo $sql;
	echo "<script language=\"javascript\">window.location='".ROOTHOST_ADMIN.COMS."'</script>";
}

if(isset($_POST["txtaction"]) && $_POST["txtaction"]!=""){
	$ids=trim($_POST["txtids"]);
	if($ids!='')
		$ids = substr($ids,0,strlen($ids)-1);
	$ids=str_replace(",","','",$ids);
	switch ($_POST["txtaction"]){
		case "public": 
			$sql_active = "UPDATE `tbl_tour` SET `isactive`='1' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_active);
			break;
		case "unpublic":
			$sql_unactive = "UPDATE `tbl_tour` SET `isactive`='0' WHERE `id` in ('$ids')";
			$objmysql->Exec($sql_unactive);
			break;
		case "delete":
			$sql = "SELECT * FROM tbl_tour WHERE id in ('$ids')";
			$objmysql->Query($sql);
			$seo_links = array();

			while ( $row = $objmysql->Fetch_Assoc() ) {
				$seo_link = ROOTHOST.'tour/'.$row['code'];
				array_push($seo_links, $seo_link);

				$sql_del = "DELETE FROM `tbl_tour` WHERE `id` in ('$ids')";
				$objdata->Exec($sql_del);
			}

			foreach ($seo_links as $key => $value) {
				$sql_del1 = "DELETE FROM `tbl_seo` WHERE `link` = '".$value."'";
				$objmysql->Exec($sql_del1);
			}
	        break;
		case 'order':
			$sls = explode(',',$_POST['txtorders']); 
			$ids = explode(',',$_POST['txtids']);
			$n = count($ids);
			for($i=0;$i<$n;$i++){
				$sql_order = "UPDATE `tbl_tour` SET `order`='".$sls[$i]."' WHERE `id` = '".$ids[$i]."' ";
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
