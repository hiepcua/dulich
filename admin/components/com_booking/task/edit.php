<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id=trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_booking` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();
$place_id = $row['place_id'];

$sql1 = "SELECT * FROM `tbl_tour` WHERE id=".$id;
$objmysql->Query($sql1);
$row1 = $objmysql->Fetch_Assoc();


$place='';
if($place_id > 0){
    $sql_cate = "SELECT name FROM tbl_place WHERE id = ".$place_id;
    $objmysql2 = new CLS_MYSQL();
    $objmysql2->Query($sql_cate);
    $r_place = $objmysql2->Fetch_Assoc();
    $place  = $r_place['name'];
}
$t_days = unserialize(TOUR_TIME);
$t_price = unserialize(TOUR_PRICE);
$t_hobby = unserialize(TOUR_HOBBIT);
?>
<style type="text/css">
    .list-group label{
        width: 100px;
        margin-right: 10px;
    }
</style>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#txt_name_err").fadeTo(200,0.1,function(){
                $(this).html('Trường này là yêu cầu bắt buộc.').fadeTo(900,1);
            });
            $("#txt_name").focus();
            return false;
        }
        return true;
    }
</script>
<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách đặt tour</a></li>
        <li class="active">Chi tiết đặt tour</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Chi tiết đặt tour</h1>
    <div class="pull-right">
        <form id="frm_menu" name="frm_menu" method="post" action="">
            <input type="hidden" name="txtorders" id="txtorders" />
            <input type="hidden" name="txtids" id="txtids" />
            <input type="hidden" name="txtaction" id="txtaction" />

            <ul class="list-inline">
                <li><a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu</a></li>
                <li><a class="btn btn-default"  href="<?php echo ROOTHOST_ADMIN.COMS;?>" title="Đóng"><i class="fa fa-sign-out" aria-hidden="true"></i> Đóng</a></li>
            </ul>
        </form>
    </div>
</div>
<div class="clearfix"></div>

<div class="box-tabs">
    <form id="frm_action" class="form-horizontal" name="frm_action" method="post" enctype="multipart/form-data">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <input type="hidden" name="tour" value="<?php echo $row['tour_id'];?>">
                <input type="hidden" name="txtid" value="<?php echo $row['id'];?>">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Thông tin tour</h3>
                        <ul class="list-group">
                            <li class="list-group-item"><label>Tên:</label><?php echo $row['name']; ?></li>
                            <li class="list-group-item"><label>Mã:</label><?php echo $row['code']; ?></li>
                            <li class="list-group-item"><label>Điểm đến:</label><?php echo $place; ?></li>
                            <li class="list-group-item"><label>Nơi khởi hành:</label><?php echo $row['starting_gate']; ?></li>
                            <li class="list-group-item"><label>Thời gian tour:</label><?php echo $t_days[(int)$row['days']]; ?></li>
                            <li class="list-group-item"><label>Khoảng giá:</label><?php echo $t_price[(int)$row['price_range']]; ?></li>
                            <li class="list-group-item"><label>Sở thích:</label><?php echo $t_hobby[(int)$row['hobby']]; ?></li>
                            <li class="list-group-item"><label>Phương tiện:</label><?php echo $row['vehicle']; ?></li>
                            <li class="list-group-item"><label>Số ghế:</label><?php echo $row['number_of_holes']; ?></li>
                            <li class="list-group-item"><label>Giá gốc:</label><?php echo number_format($row['price1']); ?> đ</li>
                            <li class="list-group-item"><label>Giá KM:</label><?php echo number_format($row['price2']); ?> đ</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3>Thông tin khách hàng</h3>
                        <ul class="list-group">
                            <li class="list-group-item"><label>Tên:</label><?php echo $row['fullname']; ?></li>
                            <li class="list-group-item"><label>Email:</label><?php echo $row['email']; ?></li>
                            <li class="list-group-item"><label>SĐT:</label><?php echo $row['phone']; ?></li>
                            <li class="list-group-item"><label>Địa chỉ:</label><?php echo $row['address']; ?></li>
                            <li class="list-group-item"><label>Người lớn:</label><?php echo $row['adult']; ?></li>
                            <li class="list-group-item"><label>Trẻ em:</label><?php echo $row['child']; ?></li>
                            <li class="list-group-item"><label>Em bé:</label><?php echo $row['baby']; ?></li>
                            <li class="list-group-item"><label>Ngày đi:</label><?php echo date('d-m-Y', $row['start_date']); ?></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <ul class="list-inline">
                        <?php
                        $status = (int)$row['status'];
                        if($status === 0){
                            ?>
                            <li class="list-inline-item"><input type="radio" name="status" value="0">Đơn hủy</li>
                            <?php
                        }else if($status === 3){
                            ?>
                            <li class="list-inline-item"><input type="radio" name="status" value="3" <?php echo $status === 3 ? 'checked' : ''; ?>>Đơn thành công</li>
                            <?php
                        }else{
                            ?>
                            <li class="list-inline-item"><input type="radio" name="status" value="1" <?php echo $status === 1 ? 'checked' : ''; ?>>Đơn đặt mới</li>
                            <li class="list-inline-item"><input type="radio" name="status" value="2" <?php echo $status === 2 ? 'checked' : ''; ?>>Đơn đang xử lý</li>
                            <li class="list-inline-item"><input type="radio" name="status" value="3" <?php echo $status === 3 ? 'checked' : ''; ?>>Đơn thành công</li>
                            <li class="list-inline-item"><input type="radio" name="status" value="0">Đơn hủy</li>
                            <?php
                        }
                        ?>
                        
                    </ul>
                </div>
            </div>
        </div>

        <input type="submit" name="cmdsave" id="cmdsave" value="Submit" style="display:none;" />
        <div class="text-center toolbar">
            <div style="height: 20px;"></div>
            <a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu thông tin"><i class="fa fa-floppy-o" aria-hidden="true"></i> Cập nhật trạng thái đặt tour</a>
        </div>
    </form>
</div>