<?php
session_start();
include_once('../../../includes/gfconfig.php');
include_once('../../../includes/gfinnit.php');
include_once('../../../includes/gffunction.php');
include_once('../../libs/cls.mysql.php');
include_once('../../libs/cls.users.php');
include_once('../../libs/cls.product.php');

$objuser=new CLS_USERS;
if(!$objuser->isLogin()) die("E01");
$totalImg = 36; $image360 = array(); $strImg = '';
if(isset($_POST['id'])){
	$obj = new CLS_PRODUCT;
	$pro_id=isset($_POST['id'])?(int)$_POST['id']:0;
	$obj->getList(" WHERE `id`='".$pro_id."'");
	$row=$obj->Fetch_Assoc(); 
	if($row['image360']=="" && !empty($_SESSION['360_UPLOADIMGS'])){
		$image360 = $_SESSION['360_UPLOADIMGS'];
		foreach($image360 as $img) $strImg .=$img.",";
		if($strImg!='') $strImg = substr($strImg,-1);
	}else {
		$image360 = explode(",",$row['image360']);
		$strImg = $row['image360'];
	}
	$totalImg = count($image360);
?>
<div class='img_viewer_360' id='viewer_360'>
	<div class='tools'>
		<span class='item fullscreen' onclick='fullScreen("viewer_360");'><span class="icon-fullsize"></span></span>
	</div>
	<img id='img_viewer_360' src=''>
</div>
<p align='center'>Press key ArrowLeft or ArrowRight; Space key to Stop or Start</p>	
<style>
.img_viewer_360{
	width:700px; height:500px;
	margin:auto;
	background:#666; cursor:pointer;
    overflow: hidden;
    position: relative;
}
.img_viewer_360 img{width:100%; height:100%; object-fit:cover}
.img_viewer_360 .tools{
	position:absolute;
    right: 10px;bottom: 10px;
}
.img_viewer_360 .tools .item{
	display:inline-block;
	padding:5px; margin:3px;
	background:#eee;
	cursor:pointer;
}
.img_viewer_360 .tools .item span{
	text-align:center;
	display:inline-block;
}
.icon-fullsize {
	width:23px; height:23px;
	background:url(images/full-size.png) no-repeat center center;
}
.icon-zoomout {
	width:23px; height:23px;
	background:url(images/zoom-out.png) no-repeat center center;
}
</style>
<?php if(count($image360)>0) { ?>
<script>
var totalImg = <?php echo $totalImg;?>;
var image360 = "<?php echo $strImg;?>"; 
var arr_360 = image360.split(",");
var imgs_arr=[];
var imgId=0;
var TimeOut=50;
var Timer=null;
var Auto=1;
var direc=1;
var isdown=false;
var startX=0;
var img_Viewer=document.getElementById('img_viewer_360');
var viewer_360=document.getElementById('viewer_360');
var panelFullScreen=null;

function loadImage(){
	for(i=0;i<totalImg;i++){
		var url=arr_360[i];
		imgs_arr[i] = new Image;
		imgs_arr[i].src=url;
		//console.log(url);
	}
	imgs_arr[0].onload=function(){
		img_Viewer.src = this.src;
	}
}
function imgShow(){
	img_Viewer.src=imgs_arr[imgId].src;
}
function AutoViewer(){
	if(Auto==1){
		if(direc===1){
			imgId++;
			if(imgId>=totalImg) imgId=0;
		}else{
			imgId--;
			if(imgId<0) imgId=totalImg;
		}
		imgShow();
		Timer=setTimeout(AutoViewer,TimeOut);
	}else{
		clearTimeout(Timer);
	}
}
function StartAuto(status){
	if(status===1){Auto=0;}
	else{
		Auto=1;
		AutoViewer();
	}
	console.log(Auto);
}
function changeSpeed(status){
	if(status===1){
		TimeOut-=10;
		if(TimeOut<=10) TimeOut=10;
	}else{
		TimeOut+=10;
		if(TimeOut>=100) TimeOut=100;
	}
}
function nex_img(){
	StartAuto(1);
	if(direc===1){
		imgId++;
		if(imgId>totalImg) imgId=0;
	}else{
		imgId--;
		if(imgId<0) imgId=totalImg;
	}
	imgShow();
}
function checkKey(e){
	if(e.keyCode==27){
		if(panelFullScreen!=null)
		panelFullScreen.style='width:700px;height:500px;';
	}
	if(e.keyCode==39){direc=0; nex_img();}
	if(e.keyCode==37){ direc=1; nex_img();}
	if(e.keyCode==32) StartAuto(Auto);
}
function fullScreen(id){
	panelFullScreen = document.getElementById(id);
	if ((document.fullScreenElement && document.fullScreenElement !== null) ||    // alternative standard method
	(!document.mozFullScreen && !document.webkitIsFullScreen)) {
		if (panelFullScreen.requestFullscreen) {
			panelFullScreen.requestFullscreen();
		} else if (panelFullScreen.mozRequestFullScreen) {
			panelFullScreen.mozRequestFullScreen();
		} else if (panelFullScreen.webkitRequestFullscreen) {
			panelFullScreen.webkitRequestFullscreen();
		}
		panelFullScreen.style='width:100%;height:100%;';
	}else{
		if (document.exitFullscreen) {
		  document.exitFullscreen();
		} else if (document.msExitFullscreen) {
		  document.msExitFullscreen();
		} else if (document.mozCancelFullScreen) {
		  document.mozCancelFullScreen();
		} else if (document.webkitExitFullscreen) {
		  document.webkitExitFullscreen();
		}
		panelFullScreen.style='width:700px;height:500px;';
	}
}

img_Viewer.onmousemove=function(e){
	e.preventDefault();
	if(isdown){
		cursorX = e.pageX;
		if(cursorX>startX){direc=0;}
		else{direc=1;}
		nex_img();
		startX=e.pageX;
	}
	return false;
}
img_Viewer.touchmove=function(e){
	e.preventDefault();
	if(isdown){
		cursorX = e.pageX;
		if(cursorX>startX){direc=0;}
		else{direc=1;}
		nex_img();
		startX=e.pageX;
	}
	return false;
}
img_Viewer.onmousedown=function(e){
	e.preventDefault();
	StartAuto(1);
	startX=e.pageX;
}
img_Viewer.touchstart=function(e){
	e.preventDefault();
	StartAuto(1);
	startX=e.pageX;
}
img_Viewer.onmouseup=function(e){
	e.preventDefault();
	isdown=false;
}
img_Viewer.touchend=function(e){
	e.preventDefault();
	isdown=false;
}
viewer_360.onmousedown=function(e){
	e.preventDefault();
	isdown=true;
}
viewer_360.onmouseout=function(e){
	e.preventDefault();
	isdown=false;
}
viewer_360.onclick = function(e){
	e.preventDefault();
	return false;
};
document.ondblclick = function(e){
	e.preventDefault();
	return false;
};

document.onkeydown = checkKey;
loadImage();
AutoViewer();
</script>
<?php } } ?>