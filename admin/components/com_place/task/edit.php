<?php
defined("ISHOME") or die("Can't acess this page, please come back!");
$id="";
if(isset($_GET["id"]))  $id=trim($_GET["id"]);
$sql = "SELECT * FROM `tbl_place` WHERE id=".$id;
$objmysql->Query($sql);
$row = $objmysql->Fetch_Assoc();

$seo_link   = ROOTHOST.'diem-den/'.$row['code'];
$sql_seo    = "SELECT * FROM tbl_seo WHERE link = '".$seo_link."'";
$objmysql->Query($sql_seo);
$row_seo    = $objmysql->Fetch_Assoc();

define("BASE_PATH","../../images/");
if(is_dir('../images/'.$row['code'])){
    $_SESSION["CUR_DIR"] = BASE_PATH.$row['code'].'/';
}else{
    $_SESSION["CUR_DIR"] = "../../images/";
}

?>
<script language="javascript">
    function checkinput(){
        if($("#txt_name").val()==""){
            $("#txt_name_err").fadeTo(200,0.1,function(){
                $(this).html('Trường này là bắt buộc').fadeTo(900,1);
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
        <li><a href="<?php echo ROOTHOST_ADMIN.COMS;?>">Danh sách địa điểm du lịch</a></li>
        <li class="active">Sửa danh địa điểm</li>
    </ol>
</div>

<div class="com_header color">
    <h1>Cập nhật thông tin địa điểm</h1>
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
    <ul class="nav nav-tabs" role="tablist">
        <li class="active">
            <a href="#info" role="tab" data-toggle="tab">
                Thông tin
            </a>
        </li>
        <li>
            <a href="#seo" role="tab" data-toggle="tab">
                Meta header
            </a>
        </li>
    </ul><br>
    <form id="frm_action" class="form-horizontal" name="frm_action" method="post" enctype="multipart/form-data">
        <div class="tab-content">
            <div class="tab-pane fade active in" id="info">
                <input type="hidden" name="txtid" value="<?php echo $row['id'];?>">
                <input type="hidden" name="txt_seo_link" value="<?php echo $seo_link;?>">
				<div class="form-group">
                    <div class="col-md-6 col-sm-6">
                        <label>Tênc<small class="cred"> (*)</small><span id="txt_name_err" class="mes-error"></span></label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" placeholder="Tên địa điểm" value="<?php echo $row['name'];?>" required>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <label>Cha</label>
                        <select name="cbo_par" class="form-control" id="cbo_par" style="width: 100%;">
                            <option value="0" title="Top">Root</option>
                            <?php $obj->getListCate(0,0); ?>
                        </select>
                        <script type="text/javascript">
                            $(document).ready(function() {
                                cbo_Selected('cbo_par','<?php echo $row['par_id'];?>');
                            });
                        </script>
                    </div>
                </div>
                <div class='form-group col-sm-12'>
                    <label>Chọn thêm ảnh<span id="err_images" class="mes-error"></span></label>
                    <div id="response_img">
                        <?php
                        $images = $row['images']; 
                        if($images !== '[]' || $images !== ''){
                            $images = json_decode($images, true);

                            if(count($images)>0) {
                                foreach ($images as $k => $val) {
                                    $order = isset($val['order']) ? (int)$val['order'] : 0;
                                    echo '<div class="info-item" data-number="'. $k .'">
                                    <input type="hidden" name="txt_images[]" value="'.$val['url'].'"/>
                                    <input type="hidden" name="txt_alt[]" value="'.$val['alt'].'"/>
                                    <img class="thumb" src="'.$val['url'].'" width="150px">
                                    <div class="name">'.$val['alt'].'</div>
                                    <div class="wrap-item-info">
                                    <div class="del-item" onclick="images_delete_item(this);" title="Xóa"></div>
                                    <div class="edit-item" data-number="'. $k .'" data-url="'.$val['url'].'" data-alt="'.$val['alt'].'" onclick="images_edit_item(this);" title="Đổi tên"></div>
                                    <input type="text" name="image_order[]" class="image_order" value="'.$order.'" size="4" class="order">
                                    </div>
                                    </div>';
                                } 
                            }
                        }else{
                            echo '<input type="hidden" name="txt_images[]" value=""/>';
                        }
                        ?>
                        <div class="default">
                            <img src="<?php echo ROOTHOST_ADMIN;?>images/images.png" class="thumb-default" onclick="OpenPopup('<?php echo ROOTHOST_ADMIN;?>extensions/upload_images.php');">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="form-control-label">Intro</label>
                        <textarea name="txtintro" id="txtintro" rows="5"><?php echo $row['intro'];?></textarea>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="seo">
                <div class="col-xs-12">
                    <div class='form-group'>
                        <label><strong>Meta Title</strong></label>
                        <input name="txt_metatitle" type="text" id="txt_metatitle" class='form-control' value="<?php echo $row_seo['meta_title'];?>" placeholder='' />
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Keyword</strong></label>
                        <textarea class="form-control" name="txt_metakey" id="txt_metakey" rows="3"><?php echo $row_seo['meta_key'];?></textarea>
                    </div>

                    <div class='form-group'>
                        <label><strong>Meta Description</strong></label>
                        <textarea class="form-control" name="txt_metadesc" id="txt_metadesc" rows="5"><?php echo $row_seo['meta_desc'];?></textarea>
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
        $("#cbo_par").select2();
        $('#txtintro').summernote({
            placeholder: 'Mô tả ...',
            height: 300,
            toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video', 'hr']],
            ['view', ['codeview']]
            ],
        });
    });

    function images_delete_item(attr){
        var del=confirm("Bạn có chắc muốn xóa ảnh này?");
        if (del==true){
            var parent = attr.parentElement.parentElement;
            parent.remove();
        }
    }

    function images_edit_item(attr){
        var url = attr.getAttribute('data-url');
        var alt = attr.getAttribute('data-alt');
        var number = attr.getAttribute('data-number');

        $('#myModalPopup').modal('show');
        $('#myModalLabel').html('Rename');

        var html = '<div class="form-group">';

        html+= '<div class="form-group">';
        html+= '<input type="text" id="txt_image_alt" name="txt_image_alt" value="'+ alt +'" class="form-control" placeholder="Nhập tên ảnh"/>';
        html+= '</div>';

        html+= '<div class="form-group">';
        html+= '<input type="text" id="txt_image_url" name="txt_image_url" value="'+ url +'" class="form-control" placeholder="Nhập đường dẫn ảnh"/>';
        html+= '</div>';

        html+= '<div class="text-center">';
        html+= '<input onclick="save_info_images_item('+ number +')" type="button" class="btn btn-success" value="Lưu lại"/>';
        html+= '</div>';

        html+= '<div class="clearfix"></div>';
        html+= '</div>';
        $('#data-frm').html(html);
    }

    function save_info_images_item(number){
        var alt = $('#txt_image_alt').val();
        var url = $('#txt_image_url').val();
        var items = $('.info-item');
        var length = items.length;
        for(var i = 0; i < length; i++){
            var num = $('.info-item')[i].getAttribute('data-number');
            if(num == number){
                $('.info-item')[i].querySelector('input[name="txt_images[]"]').value = url;
                $('.info-item')[i].querySelector('input[name="txt_alt[]"]').value = alt;
                $('.info-item')[i].querySelector('.name').textContent = alt;
                $('.info-item')[i].querySelector('.thumb').src = url;
                $('.info-item')[i].querySelector('.edit-item').setAttribute('data-url', url);
                $('.info-item')[i].querySelector('.edit-item').setAttribute('data-alt', alt);
            }
        }
        $('#myModalPopup').modal('hide');
    }
</script>