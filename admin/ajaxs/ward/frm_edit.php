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
$id = isset($_POST['id'])?addslashes(htmlentities(strip_tags($_POST['id']))):'0';
$sql="SELECT * FROM tbl_ward WHERE id='$id'";
$obj=new CLS_MYSQL;
$obj->Query($sql);
$city=$district='';
if($obj->Num_rows()!=1) die('Bản ghi không tồn tại');
else{
	$r=$obj->Fetch_Assoc();
	$city = $r['city_id']; $district = $r['city_id'];
?>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Tỉnh/thành:</div>
	<div class="col-md-6 col-xs-8">
		<select name="cbo_city" id="cbo_city" value="" class="form-control">
			<option value="">-- Chọn tỉnh/thành--</option>
			<?php $objcity = new CLS_CITY;
			$objcity->getListCbo($city);?>
		</select>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Quận/huyện:</div>
	<div class="col-md-6 col-xs-8">
		<select name="cbo_city" id="cbo_city" value="" class="form-control">
			<option value="">-- Chọn Quận/huyện--</option>
			<?php $objdist = new CLS_DISTRICT;
			$objdist->getListCbo($district,$city);?>
		</select>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Tên quận/huyện:</div>
	<div class="col-md-6 col-xs-8">
		<input type="hidden" name="txtid" id="txtid" class="form-control" value="<?php echo $r['id'];?>" readonly>
		<input type="text" name="txtname" id="txtname" class="form-control" value="<?php echo $r['name'];?>" required>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-4 col-xs-4 text">Sắp xếp:</div>
	<div class="col-md-6 col-xs-8">
		<input type="number" name="txtorder" id="txtorder" class="form-control" min="0" value="<?php echo $r['order'];?>" required>
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
		var id = $("#txtid").val();
		var city = $("#cbo_city").val();
		var name = $("#txtname").val();
		var order = $("#txtorder").val();
		var url = "ajaxs/district/process_edit.php";
		if(id!='' && name!=''){
			$.post(url,{'id':id,'name':name,'city':city,'order':order},function(req){
				if(req=="E01") showMess("Vui lòng đăng nhập hệ thống","error");
				else if(req=="success"){
					showMess("Cập nhật tỉnh/thành thành công");
					setTimeout(function(){window.location.reload();},1000);
				}
			});
		}
	})
})
</script>
<?php }?>