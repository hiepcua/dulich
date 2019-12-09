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
$city = isset($_POST['city'])?(int)$_POST['city']:0;
$city_name = isset($_POST['city_name'])?addslashes(strip_tags($_POST['city_name'])):'';
$district = isset($_POST['district'])?(int)$_POST['district']:0;
$district_name = isset($_POST['district_name'])?addslashes(strip_tags($_POST['district_name'])):'';
?>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Tỉnh/thành:</div>
	<div class="col-md-6 col-xs-8"><?php echo $city_name;?></div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Quận/huyện:</div>
	<div class="col-md-6 col-xs-8"><?php echo $district_name;?></div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Tên phường/xã:</div>
	<div class="col-md-6 col-xs-8">
		<input type="text" name="txtname" id="txtname" class="form-control" value="" required>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Sắp xếp:</div>
	<div class="col-md-6 col-xs-8">
		<input type="number" name="txtorder" id="txtorder" class="form-control" min="0" value="" required>
	</div>
</div>
<div class="row form-group text-center">
	<button type="button" name="btnsave" id="btnsave" class="btn btn-primary">Lưu</button>
	<button type="button" name="btncancel" id="btncancel" class="btn btn-default" data-dismiss="modal">Thoát</button>
</div>
<div class="clearfix"></div>
<script>
$(document).ready(function(){
	$("#btnsave").click(function(){
		var name = $("#txtname").val();
		var order = $("#txtorder").val();
		var url = "ajaxs/ward/process_add.php";
		if(name!=''){
			$.post(url,{'city':'<?php echo $city;?>','district':'<?php echo $district;?>','name':name,'order':order},function(req){
				console.log(req);
				if(req=="E01") showMess("Vui lòng đăng nhập hệ thống","error");
				else if(req=="success"){
					showMess("Thêm phường/xã thành công");
					setTimeout(function(){window.location.reload();},1000);
				}
			});
		}
	})
})
</script>