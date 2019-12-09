<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
$city=isset($_GET['city'])?(int)$_GET['city']:'';
$key=isset($_GET['q'])?addslashes(strip_tags($_GET['q'])):'';
$strwhere="";
if($key!="") $strwhere=" AND name LIKE '%$key%' ";
if($city!="") $strwhere=" AND a.city_id=$city ";
?>
<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li class="active">QUẢN LÝ QUẬN/HUYỆN</li>
    </ol>
</div>
<div class="container-fluid">
	<div class="form-group">
		<form id="frm_search" name="frm_search" method="get" action="">
			<div class="col-md-4"><div class="row">
				<input type="hidden" class="form-control" name="com" id="com" value="<?php echo $COMS;?>">
				<input type="text" class="form-control" name="q" id="txt_q" placeholder="Tên quận huyện" value="<?php echo $key;?>">
			</div></div>
			<div class="col-md-4"><div class="row">
				<select name="city" id="city" value="" class="form-control">
					<option value="">-- Chọn tỉnh/thành--</option>
					<?php $objcity = new CLS_CITY;
					$objcity->getListCbo();?>
				</select>
			</div></div>
			<div class="col-md-1">
				<button type="submit" class="btn btn-primary" name="cmdsearch" id="cmdsearch"><i class="fa fa-search"></i> Tìm</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" name="filterDebt" id="btn_add"><i class="fa fa-dollar"></i> Thêm mới</button>
			</div>
		</form>
	</div>
	<div class="clearfix"></div>
	<?php $obj=new CLS_MYSQL;
	$sql="SELECT a.*,b.name as city_name FROM tbl_district AS a
		INNER JOIN tbl_city AS b ON b.id=a.city_id 
		WHERE 1=1 $strwhere ORDER BY b.`order` DESC,a.city_id ASC, a.`order` DESC,a.id ASC"; 
	$obj->Query($sql);
	$total_rows = $obj->Num_rows(); $arr_list=array();
	while($r=$obj->Fetch_Assoc()) $arr_list[]=$r;?>
	<div class="col-md-6 col-xs-12" style="width:49%">
		<div class="row">
			<table class="table table-bordered">
				<thead><tr>
					<th width='30'>STT</th>
					<th width='30'></th>
					<th class='text-left'>Tỉnh/Thành</th>
					<th class='text-left'>Quận/huyện</th>
					<th class='text-center'>Sắp xếp</th>
					<th class='text-center'></th>
				</tr></thead>
				<tbody>
				<?php 
				$stt=0;
				for($i=0;$i<round($total_rows/2);$i++){
					$r=$arr_list[$i];
					$id=$r['id']; $stt++;
				?>
				<tr><td class='text-center'><?php echo $stt;?></td>
					<td><i class="fa fa-trash btn_xoa" aria-hidden="true" title='Xóa' dataid='<?php echo $id;?>'></i></td>
					<td><?php echo stripslashes($r['city_name']);?></td>
					<td><?php echo stripslashes($r['name']);?></td>
					<td class='text-center'><?php echo  $r['order'];?></div>
					<td class='text-center'>
					<i class="fa fa-pencil-square-o btn_edit" aria-hidden="true" title='Sửa' dataid='<?php echo $id;?>'></i>
					</td>
				</tr>
				<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-6 col-xs-12 pull-right" style="width:49%">
		<div class="row">
			<table class="table table-bordered">
				<thead><tr>
					<th width='30'>STT</th>
					<th width='30'></th>
					<th class='text-left'>Tỉnh/Thành</th>
					<th class='text-left'>Quận/Huyện</th>
					<th class='text-center'>Sắp xếp</th>
					<th class='text-center'></th>
				</tr></thead>
				<tbody>
				<?php 
				for($i=round($total_rows/2);$i<$total_rows;$i++){
					$stt++;
					$r=$arr_list[$i];
					$id=$r['id']; 
				?>
				<tr><td class='text-center'><?php echo $stt;?></td>
					<td><i class="fa fa-trash btn_xoa" aria-hidden="true" title='Xóa' dataid='<?php echo $id;?>'></i></td>
					<td><?php echo stripslashes($r['city_name']);?></td>
					<td><?php echo stripslashes($r['name']);?></td>
					<td class='text-center'><?php echo  $r['order'];?></div>
					<td class='text-center'>
					<i class="fa fa-pencil-square-o btn_edit" aria-hidden="true" title='Sửa' dataid='<?php echo $id;?>'></i>
					</td>
				</tr>
				<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
$('.btn_xoa').click(function(){
	if(confirm('Bạn có chắc chắn muốn xóa quận/huyện này?')){
		var _id=$(this).attr('dataid');
		var _url='ajaxs/district/process_del.php';
		$.post(_url,{'id':_id},function(req){
			if(req=='success'){
				window.location.reload();
			}else{
				console.log(req);
				alert('Error:'+req);
			}
		});
	}
});
$('.btn_edit').click(function(){
	var _id=$(this).attr('dataid');
	var _url='ajaxs/district/frm_edit.php';
	$('#myModalPopup .modal-body').html('Loading...');
	$('#myModalPopup .modal-title').html('Cập nhật quận/huyện');
	$.post(_url,{'id':_id},function(req){
		$('#myModalPopup .modal-body').html(req);
		$('#myModalPopup').modal('show');
	});
});
$('#btn_add').click(function(){
	var _url='ajaxs/district/frm_add.php';
	$('#myModalPopup .modal-body').html('Loading...');
	$('#myModalPopup .modal-title').html('Thêm mới quận/huyện');
	$.post(_url,function(req){
		$('#myModalPopup .modal-body').html(req);
		$('#myModalPopup').modal('show');
	});
});
</script>