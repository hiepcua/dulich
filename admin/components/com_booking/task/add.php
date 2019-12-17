<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
?>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#txt_name_err").fadeTo(200,0.1,function(){
                $(this).html('Trường này là yêu cầu bắt buộc').fadeTo(900,1);
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
        <li class="active">Đặt tour</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Đặt tour</h1>
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
                <div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Tour</label>
                        <select name="tour" class="form-control" id="tour" style="width: 100%;">
                            <option value="0" title="Top">Chọn một tour</option>
                            <?php
                            $sql="SELECT * FROM tbl_tour WHERE isactive=1";
                            $objmysql->QuerY($sql);
                            while ($row_tour = $objmysql->Fetch_Assoc()) {
                                echo '<option value="'.$row_tour['id'].'">'.$row_tour['name'].'</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <h3 class="col-md-12">Thông tin khách hàng</h3>
                    <div class="col-lg-6">
                        <div class="book-dskh">
                            <div class="heading">
                                <h3 class="h5 text-uppercase">Số hành khách</h3>
                            </div>
                            <div class="form reset-select">
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Số người lớn:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="adult">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Số trẻ em:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="child">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Số em bé:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="baby">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Chọn ngày đi</label>
                                    <div class="col-md-9">
                                        <div class="start-date">
                                            <input class="form-control" data-toggle="datepicker" name="start_date">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="book-dskh">
                            <div class="heading">
                                <h3 class="h5 text-uppercase">Thông tin liên hệ</h3>
                            </div>
                            <div class="form reset-select">
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Họ và tên:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="name" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Điện thoại:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="tel" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Email:</label>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" name="email" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label">Địa chỉ</label>
                                    <div class="col-md-9">
                                        <input class="form-control" name="address" type="text">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" name="cmdsave" id="cmdsave" value="Submit" style="display:none;" />
        <div class="text-center toolbar">
            <div style="height: 20px;"></div>
            <a class="save btn btn-success" href="#" onclick="dosubmitAction('frm_action','save');" title="Lưu thông tin"><i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu thông tin</a>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#tour").select2();
    });
</script>