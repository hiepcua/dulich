<?php
session_start();
include_once('../../../includes/gfconfig.php');
include_once('../../../includes/gfinnit.php');
include_once('../../../includes/gffunction.php');
include_once('../../libs/cls.mysql.php');
include_once('../../libs/cls.users.php');

$objuser=new CLS_USERS;
if(!$objuser->isLogin()) die("E01");

if(isset($_POST['id'])) {
	$id=(int)$_POST['id'];
	$name_img = $_SESSION['360_UPLOADIMGS'][$id];
	// xóa file ảnh trên thư mục server
	$target_dir='../../../'.$_SESSION['IMAGE360VIEW'];
	unlink($target_dir.basename($name_img));
	unset($_SESSION['360_UPLOADIMGS'][$id]);
	$strImg=""; $images_arr = array(); $i=0;
	
	echo '<ul class="reorder_ul reorder-photos-list">';
	foreach($_SESSION['360_UPLOADIMGS'] as $k=>$v){
		$n=count($images_arr);
		$images_arr[$n]['src'] = $v['src'];
		$images_arr[$n]['name'] = $v['name'];
		$strImg.=$v['src'].","; ?>
		<li class="ui-sortable-handle">
			<div class="image_link">
				<img src="<?php echo $v['src'];?>" alt="ảnh sản phẩm" class="img-responsive img-multiproduct">
			</div>
			<div class="name"><?php echo $v['name'];?></div>
			<a href="#" class="btn_deleteImg" onclick="deleteImg(<?php echo $i;?>)"><i class="fa fa-times fa_user" ></i></a>
		</li>
	<?php $i++;} // end foreach ?>
	</ul>
	<input type="hidden" id="strImg" name="strImg" value=<?php echo substr($strImg, 0,strlen($strImg)-1);?>>
<?php $_SESSION['360_UPLOADIMGS']=$images_arr; 
} // end if ?>
