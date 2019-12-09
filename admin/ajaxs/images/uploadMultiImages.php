<?php
session_start();
include_once('../../../includes/gfconfig.php');
include_once('../../../includes/gfinnit.php');
include_once('../../../includes/gffunction.php');
include_once('../../libs/cls.mysql.php');
include_once('../../libs/cls.users.php');

$objuser=new CLS_USERS;
if(!$objuser->isLogin()) die("E01");

function checkExistFile($file_name){
	if(file_exists($file_name))
		return true;
	else
		return false;
}

function newFile($file_name){
	$filename=date("dmYhis")."_".$file_name;
	return $filename;
}

if(!isset($_SESSION['360_UPLOADIMGS'])) $_SESSION['360_UPLOADIMGS']=array();
$error="";
//var_dump($_FILES['images']);
if (isset($_FILES['images']) AND ($_FILES['images']['name'][0] !="")){	
	// server:$cur_dir=UPLOAD_PATH.'images/catalogs/';
	$target_dir='../../../images/';

	foreach($_FILES['images']['name'] as $key=>$val){
		$image_name = $_FILES['images']['name'][$key];
		$tmp_name 	= $_FILES['images']['tmp_name'][$key];
		$size 		= $_FILES['images']['size'][$key];
		$type 		= $_FILES['images']['type'][$key];
		$error 		= $_FILES['images']['error'][$key];
		//checking image type
		$allowed =  array('gif','png','jpg','jpeg','JPEG');
		$filename = $_FILES['images']['name'][$key];
		$ext = pathinfo($filename, PATHINFO_EXTENSION);

		if(in_array($ext,$allowed)){
		//move uploaded file to uploads folder
			/* if (checkExistFile($target_dir.$filename)) {
				// echo "file trùng";die();
				$fileName=newFile($_FILES['images']['name'][$key]);
				$target_file = $target_dir.newFile($_FILES['images']['name'][$key]);
			}
			else { */
				$fileName=$_FILES['images']['name'][$key];
				$target_file = $target_dir.$_FILES['images']['name'][$key];
			//}
			if(move_uploaded_file($_FILES['images']['tmp_name'][$key],$target_file)){
				$n=count($_SESSION['360_UPLOADIMGS']);
				$_SESSION['360_UPLOADIMGS'][$n]['src'] = ROOTHOST.$_SESSION['IMAGE360VIEW'].'/'.$fileName;
				$_SESSION['360_UPLOADIMGS'][$n]['name'] = $fileName;
			}

		}
		$error="Image type not valid";

	}
	
}

// images view after upload
$strImg=""; $i=0;
if(!empty($_SESSION['360_UPLOADIMGS'])){ 
	echo '<ul class="reorder_ul reorder-photos-list">';
	foreach($_SESSION['360_UPLOADIMGS'] as $k=>$v){
		$strImg.=$v['src'].",";
	?>
	<li class="ui-sortable-handle">
		<div class="image_link">
			<img src="<?php echo $v['src'];?>" alt="ảnh sản phẩm" class="img-responsive img-multiproduct">
		</div>
		<div class="name"><?php echo $v['name'];?></div>
		<a href="#" class="btn_deleteImg" onclick="deleteImg(<?php echo $i;?>)"><i class="fa fa-times fa_user" ></i></a>
	</li>
<?php $i++;}
	echo '</ul>';
?>
	<input type="hidden" id="strImg" name="strImg" value=<?php echo substr($strImg, 0,strlen($strImg)-1);?>>
<?php } ?>