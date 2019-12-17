<?php
defined('ISHOME') or die('Can not acess this page, please come back!');
define('OBJ_PAGE','BOOKING');
$strwhere='';

// Khai báo SESSION
$keyword = isset($_GET['q']) ? addslashes(trim($_GET['q'])) : '';
$action = isset($_GET['cbo_action']) ? addslashes(trim($_GET['cbo_action'])) : '';

// Gán strwhere
if($keyword !== ''){
    $strwhere.=" AND `fullname` like '%$keyword%' OR `name` LIKE '%$keyword%'";
}
if($action !== '' && $action !== 'all' ){
    $strwhere.=" AND `status` = '$action'";
}

// Begin pagging
if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
}
if(isset($_POST['txtCurnpage'])){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
}

$sql_count = "SELECT COUNT(*) AS count FROM tbl_booking WHERE 1=1 ".$strwhere;
$objmysql->Query($sql_count);
$row_count = $objmysql->Fetch_Assoc();
$total_rows = $row_count['count'];

if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/MAX_ROWS_ADMIN)){
    $_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/MAX_ROWS_ADMIN);
}
$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
// End pagging
?>
<style type="text/css">
    .table-bordered td .title{
        margin-bottom: 8px;
    }
    .table-bordered td .info {
        font-size: 12px;
        color: #6b6b6b;
    }
    .table-bordered td .info span{
        border: 1px solid #66666621;
        border-radius: 10px;
        padding: 0 6px;
        background-color: #cccccc38;
    }
    .ispay.green {
        background-color: #5cb85c;
        color: #FFF;
    }
    .btn1{
        color: red;
    }
    .btn3{
        color: green;
    }
</style>
<script language="javascript">
    function checkinput(){
        var strids=document.getElementById("txtids");
        if(strids.value==""){
            alert('Bạn chưa lựa chọn đối tượng nào.');
            return false;
        }
        return true;
    }
</script>

<div id="path">
    <ol class="breadcrumb">
        <li><a href="<?php echo ROOTHOST_ADMIN;?>">Admin</a></li>
        <li class="active">Danh sách đặt tour</li>
    </ol>
</div>

<div class="com_header color">
    <form id="frm_list" method="get" action="<?php echo ROOTHOST_ADMIN.COMS;?>">
        <div class="frm-search-box form-inline pull-left">
            <label class="mr-sm-2" for="">Từ khóa: </label>
            <input class="form-control" type="text" value="<?php echo $keyword?>" name="q" id="txtkeyword" placeholder="Từ khóa"/>&nbsp;
            <button type="submit" id="_btnSearch" class="btn btn-success">Tìm kiếm</button>
            <select name="cbo_action" class="form-control" id="cbo_action">
                <option value="all">Tất cả</option>
                <option value="1">Đơn mới</option>
                <option value="2">Đang xác nhận</option>
                <option value="3">Thành công</option>
                <option value="0">Đã hủy</option>
                <script language="javascript">
                    cbo_Selected('cbo_action','<?php echo $action;?>');
                </script>
            </select>
        </div>
    </form>
    <div class="pull-right">
        <div id="menus" class="toolbars">
            <form id="frm_menu" name="frm_menu" method="post" action="">
                <input type="hidden" name="txtorders" id="txtorders" />
                <input type="hidden" name="txtids" id="txtids" />
                <input type="hidden" name="txtaction" id="txtaction" />
                <ul class="list-inline">
                    <li><button class="btn btn-default" onclick="dosubmitAction('frm_menu','public');"><i class="fa fa-check-circle-o cgreen" aria-hidden="true"></i> Hiển thị</button></li>
                    <li><button class="btn btn-default" onclick="dosubmitAction('frm_menu','unpublic');"><i class="fa fa-times-circle-o cred" aria-hidden="true"></i> Ẩn</button></li>
                    <li><a class="addnew btn btn-default" href="<?php echo ROOTHOST_ADMIN.COMS;?>/add" title="Thêm mới"><i class="fa fa-plus-circle cgreen" aria-hidden="true"></i> Đặt tour</a></li>
                    <li><a class="delete btn btn-default" href="#" onclick="javascript:if(confirm('Bạn có chắc chắn muốn xóa thông tin này không?')){dosubmitAction('frm_menu','delete'); }" title="Xóa"><i class="fa fa-times-circle cred" aria-hidden="true"></i> Xóa</a></li>
                </ul>
            </form>
        </div>
    </div>
</div><br>
<div class="clearfix"></div>

<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <th width="30" align="center">#</th>
            <!-- <th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th> -->
            <!-- <th width="50" align="center">Xóa</th> -->
            <th>Tên khách hàng</th> 
            <th>Tour</th>
            <th>SĐT</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Ngày tạo</th>
            <th width="50" align="center">Trạng thái</th>
            <th width="50" align="center">Chi tiết</th>
        </thead>
        <tbody>
            <?php
            $star = ($cur_page - 1) * MAX_ROWS_ADMIN;
            $sql = "SELECT * FROM tbl_booking WHERE 1=1 $strwhere ORDER BY cdate DESC LIMIT $star,".MAX_ROWS_ADMIN;
            $objmysql->Query($sql);
            $i = 0;
            while($rows = $objmysql->Fetch_Assoc()){
                $i++;
                $ids        = $rows['id'];
                $place_id   = (int)$rows['place_id'];
                $fullname   = $rows['fullname'];
                $tour       = $rows['name'];
                $phone      = $rows['phone'];
                $email      = $rows['email'];
                $address    = Substring(stripslashes($rows['address']),0,10);
                $cdate      = date('d-m-Y', $rows['cdate']);
                $price1     = number_format($rows['price1']);
                $price2     = number_format($rows['price2']);

                switch ($rows['status']) {
                    case '1':
                        $icon_active    = "<a href='javascript:void(0)' class='btn btn-danger'>Đơn mới</a>";
                        break;
                    case '2':
                        $icon_active    = "<a href='javascript:void(0)' class='btn btn-warning'>Đang xác nhận</a>";
                        break;
                    case '3':
                        $icon_active    = "<a href='javascript:void(0)' class='btn btn-success'>Đã xác nhận</a>";
                        break;
                    case '0':
                        $icon_active    = "<a href='javascript:void(0)' class='btn btn-default'>Đã hủy</a>";
                        break;
                    default:
                        $icon_active    = "<a href='javascript:void(0)' class='btn btn-danger'>Đơn mới</a>";
                        break;
                }

                // Get place name
                if($place_id > 0){
                    $sql_cate = "SELECT name FROM tbl_place WHERE id = ".$place_id;
                    $objmysql2 = new CLS_MYSQL();
                    $objmysql2->Query($sql_cate);
                    $r_place = $objmysql2->Fetch_Assoc();
                    $place  = $r_place['name'];
                }
                // End Get place name

                echo "<tr name='trow'>";
                echo "<td width='30' align='center'>$i</td>";
                // echo "<td width='30' align='center'><label>";
                // echo "<input type='checkbox' name='chk' id='chk' onclick=\"docheckonce('chk');\" value='$ids'/>";
                // echo "</label></td>";

                // echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/delete/$ids' onclick=\" return confirm('Bạn có chắc muốn xóa ?')\"><i class='fa fa-times-circle cred' aria-hidden='true'></i></a></td>";

                echo "<td>".$fullname."</td>";

                echo "<td>
                <div class='title'>$tour</div>
                <div class='info'>
                <span>".$place."</span>
                </div>
                </td>";

                echo "<td>".$phone."</td>";
                echo "<td>".$email."</td>";
                echo "<td>".$address."</td>";
                echo "<td>".$cdate."</td>";

                echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/active/$ids'>".$icon_active."</a></td>";

                echo "<td align='center' width='10'><a href='".ROOTHOST_ADMIN.COMS."/edit/$ids'><i class='fa fa-edit' aria-hidden='true'></i></a></td>";

                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Footer_list">
        <tr>
            <td align="center">
                <?php 
                paging($total_rows,MAX_ROWS_ADMIN,$cur_page);
                ?>
            </td>
        </tr>
    </table>
</div>
<?php //----------------------------------------------?>
