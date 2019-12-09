<?php
session_start();
require_once('../../../global/libs/gfconfig.php');
require_once('../../../global/libs/gfinit.php');
require_once('../../../global/libs/gffunc.php');
require_once('../../libs/cls.mysql.php');
require_once("../../libs/cls.user.php");
require_once("../../libs/cls.city.php");

$objuser=new CLS_USER;
if(!$objuser->isLogin()) die("E01");
?>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Chọn tỉnh/thành:</div>
	<div class="col-md-6 col-xs-8">
		<select name="cbo_city" id="cbo_city" value="" class="form-control">
			<option value="">-- Chọn tỉnh/thành--</option>
			<?php $objcity = new CLS_CITY;
			$objcity->getListCbo();?>
		</select>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Tên quận/huyện:</div>
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
		var city = $("#cbo_city").val();
		var name = $("#txtname").val();
		var order = $("#txtorder").val();
		var url = "ajaxs/district/process_add.php";
		if(name!=''){
			$.post(url,{'city':city,'name':name,'order':order},function(req){
				console.log(req);
				if(req=="E01") showMess("Vui lòng đăng nhập hệ thống","error");
				else if(req=="success"){
					showMess("Thêm quận/huyện thành công");
					setTimeout(function(){window.location.reload();},1000);
				}
			});
		}
	})
})
</script>