<?php
function paging($total_rows,$max_rows,$cur_page){
    $max_pages=ceil($total_rows/$max_rows);
    $start=$cur_page-5; if($start<1)$start=1;
    $end=$cur_page+5;   if($end>$max_pages)$end=$max_pages;
    $paging='
    <form action="" method="post" name="frmpaging" id="frmpaging">
    <input type="hidden" name="txtCurnpage" id="txtCurnpage" value="1" />
    <ul class="pagination">
    ';

    $paging.='<p align="center" class="paging">';
    $paging.="<strong>Total:</strong> $total_rows <strong>on</strong> $max_pages <strong>page</strong><br>";

    if($cur_page >1){
        $paging.='<li class="page-item"><a class="page-link" href="javascript:gotopage('.($cur_page-1).')"> << </a></li>';
    }
    if($max_pages>1){
        for($i=$start;$i<=$end;$i++)
        {
            if($i!=$cur_page)
                $paging.="<li class='page-item'><a class=\"page-link\" href=\"javascript:gotopage($i)\"> $i </a></li>";
            else
                $paging.="<li class='page-item active'><a class=\"page-link\" href=\"#\" class=\"cur_page\"> $i </a></li>";
        }
    }
    if($cur_page <$max_pages)
        $paging.='<li class="page-item"><a class="page-link" href="javascript:gotopage('.($cur_page+1).')"> » </a></li>';

    $paging.='</ul></p></form>';
    echo $paging;
}
function paging_index($total_rows,$max_rows,$cur_page){
    $max_pages=ceil($total_rows/$max_rows);
    $start=$cur_page-5; if($start<1)$start=1;
    $end=$cur_page+5;   if($end>$max_pages)$end=$max_pages;
    $paging='
    <form action="" method="post" name="frmpaging" id="frmpaging">
    <input type="hidden" name="txtCurnpage" id="txtCurnpage" value="1" />
    <ul class="pagination">
    ';

    $paging.='<p align="center" class="paging">';
    if($cur_page >1)
        $paging.='<li><a href="javascript:gotopage('.($cur_page-1).')"> << </a></li>';
    if($max_pages>1){
        for($i=$start;$i<=$end;$i++)
        {
            if($i!=$cur_page)
                $paging.="<li><a href=\"javascript:gotopage($i)\"> $i </a></li>";
            else
                $paging.="<li class='active'><a href=\"#\" class=\"cur_page\"> $i </a></li>";
        }
    }
    if($cur_page <$max_pages)
        $paging.='<li><a href="javascript:gotopage('.($cur_page+1).')"> » </a></li>';

    $paging.='</ul></p></form>';
    echo $paging;
}
function Substring($str,$start,$len){
    $str=str_replace("  "," ",$str);
    $arr=explode(" ",$str);
    if($start>count($arr))  $start=count($arr);
    $end=$start+$len;
    if($end>count($arr))    $end=count($arr);
    $newstr="";
    for($i=$start;$i<$end;$i++)
    {
        if($arr[$i]!="")
        $newstr.=$arr[$i]." ";
    }
    if($len<count($arr)) $newstr.="...";
    return $newstr;
}
function showIconFun($fun,$value){
    $filename="noimage.gif";
    $title="no image"; $icon="";
    switch($fun){
        case "menuitem":
            $title="Menu Item";
			$icon="fa-list-alt";
            $filename="menuitem.png";
            break;
        case "delete":
            $title='Xóa'; $icon="fa-times-circle cred";
            $filename="delete.png";
            break;
        case "edit":
            $title='Sửa'; $icon="fa-edit";
            $filename="icon_edit.png";
            break;
        case "publish":
            if($value==1){
                $title='active'; $icon="fa-check cgreen";
                $filename="publish.png";
            }
            else{
                $title='Un active';$icon="fa-times-circle-o cred";
                $filename="unpublish.png";
            }
            break;
        case "show":
            if($value==1){
                $title="Show"; $icon="fa-check cgreen";
                $filename="publish.png";
            }
            else{
                $title="Hidden";$icon="fa-times-circle-o cred";
                $filename="icon_nodefault.png";
            }
            break;
        case "isfronpage":
            if($value==1) {
                $title="Front page";
                $filename="icon_isfront.png";
            }else{
                $title="Admin";
                $filename="icon_nofront.png";
            }
            break;
        case "isdefault":
            if($value==1) {
                $title="Default";
                $filename="icon_default.png";
            }
            else {
                $title="Not default";
                $filename="icon_nodefault.png";
            }
            break;
    }
	if($icon!='')
		echo "<i class='fa ".$icon."' aria-hidden='true'></i>";
    else 
		echo "<img border=0 height=\"16\" src=\"".ROOTHOST_ADMIN.IMG_PATH."$filename\" title=\"$title\"/>";
}
function LoadPosition(){
    $doc = new DOMDocument();
    $doc->load(ROOTHOST_ADMIN.'template.xml');
    $options = $doc->getElementsByTagName("position");

    foreach( $options as $option )
    { 
        $opts = $option->getElementsByTagName("option");
        foreach($opts as $opt)
        {
            echo "<option value=\"".$opt->nodeValue."\">".$opt->nodeValue."</option>";
        }
    }
}
function LoadModBrow($mod_name){
    $path='../'.MOD_PATH.$mod_name."/brow";
    var_dump($path);
    if(!is_dir($path))
        return;
    $objdir=dir($path);
    while($file=$objdir->read()){
        if(is_file($path."/".$file) && $file!="." && $file!=".." ){
            $file=substr($file,0,strlen($file)-4);
            echo "<option value=\"".$file."\">".$file."</option>";
        }
    }
    return ;
}
function un_unicode($str){
    $marTViet=array(
		'à','á','ạ','ả','ã','â','ầ','ấ','ậ','ẩ','ẫ','ă','ằ','ắ','ặ','ẳ','ẵ',
		'è','é','ẹ','ẻ','ẽ','ê','ề','ế','ệ','ể','ễ',
        'ì','í','ị','ỉ','ĩ',
        'ò','ó','ọ','ỏ','õ','ô','ồ','ố','ộ','ổ','ỗ','ơ','ờ','ớ','ợ','ở','ỡ',
		'ù','ú','ụ','ủ','ũ','ư','ừ','ứ','ự','ử','ữ',
        'ỳ','ý','ỵ','ỷ','ỹ',
        'đ',
        'A','B','C','D','E','F','J','G','H','I','K','L','M',
        'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        'À','Á','Ạ','Ả','Ã','Â','Ầ','Ấ','Ậ','Ẩ','Ẫ','Ă','Ằ','Ắ','Ặ','Ẳ','Ẵ',
        'È','É','Ẹ','Ẻ','Ẽ','Ê','Ề','Ế','Ệ','Ể','Ễ',
        'Ì','Í','Ị','Ỉ','Ĩ',
        'Ò','Ó','Ọ','Ỏ','Õ','Ô','Ồ','Ố','Ộ','Ổ','Ỗ','Ơ','Ờ','Ớ','Ợ','Ở','Ỡ',
        'Ù','Ú','Ụ','Ủ','Ũ','Ư','Ừ','Ứ','Ự','Ử','Ữ',
        'Ỳ','Ý','Ỵ','Ỷ','Ỹ',
        'Đ',':',',','.','?','`','~','!','@','#','$','%','^','&','*','(',')',"'",'"',
		'&','/','|','   ','  ',' ','---','--','“','”','+','–','[',']');

    $marKoDau=array(
		'a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a',
        'e','e','e','e','e','e','e','e','e','e','e',
        'i','i','i','i','i',
        'o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o',
        'u','u','u','u','u','u','u','u','u','u','u',
        'y','y','y','y','y',
        'd',
        'a','b','c','d','e','f','j','g','h','i','k','l','m',
        'n','o','p','q','r','s','t','u','v','w','x','y','z',
        'a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a',
        'e','e','e','e','e','e','e','e','e','e','e',
        'i','i','i','i','i',
        'o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o',
        'u','u','u','u','u','u','u','u','u','u','u',
        'y','y','y','y','y',
        'd','','','','','','','','','','','','','','','','','','',
		'','','',' ',' ','-','-','-','','','','','','');

    $str = str_replace($marTViet, $marKoDau, $str);
    return $str;
}
function getThumb($urlThumb, $class='', $alt=''){
	$urlThumb = str_replace(' ', '%20', $urlThumb);
    if($urlThumb !=''){
        return "<img src=".$urlThumb." class='".$class."' alt='".$alt."'>";
    }
    else{
        return "<img src=".ROOTHOST.BANNER_DEFAULT." class='".$class."'>";
    }
}
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}


// Phân trang bằng get + filter
function getParameter($full_link){
    $tem = explode('?',$full_link);
    $par=array();
    if(count($tem)==2){
        $str_par=explode("&",$tem[1]);
        for($i=0;$i<count($str_par);$i++){
            $item=explode('=',$str_par[$i]);
            $par[$item[0]]=$item[1];
        }

    }
    return $par;
}
function __link($page,$link_full){
    return str_replace('{page}', $page,$link_full);
}
function conver_to_par($par){
    $str="?";
    $key=array_keys($par);
    for($i=0;$i<count($par);$i++){
        $str=$str.$key[$i].'='.$par[$key[$i]]."&";
    }
    $str=substr($str,0,strlen($str)-1);
    return $str;
}
function paging0($total_rows,$max_rows,$cur_page,$link_full){
    $max_pages=ceil($total_rows/$max_rows);
    $start=$cur_page-5; if($start<1)$start=1;
    $end=$cur_page+5;   if($end>$max_pages)$end=$max_pages;
    $paging='<div class="paging">
    <nav>
        <ul class="pager">
            <input type="hidden" name="txtCurnpage" id="txtCurnpage" value="'.$cur_page.'" />';
            $paging.="";
            if($cur_page == 1 && $max_pages==1){
                $paging.='<li><span aria-hidden="true" style="background: #f5f5f5;">&laquo; Trang trước</span></li>';
                $paging.='<li><span aria-hidden="true" style="background: #f5f5f5;">Trang sau &raquo;</span></li>';
            }elseif($cur_page <=1){
                $paging.='<li><span aria-hidden="true" style="background: #f5f5f5;">&laquo; Trang trước</span></li>';
                $paging.='<li><a href="'.__link($cur_page+1,$link_full).'" aria-label="Next"><span aria-hidden="true">Trang sau &raquo;</span></a></li>';
            }elseif($cur_page >=$max_pages){
                $paging.='<li><a href="'.__link($cur_page-1,$link_full).'" class="cur_page" aria-label="Preview"> <span aria-hidden="true">&laquo; Trang trước</span></a></li>';
                $paging.='<li><span aria-hidden="true" style="background: #f5f5f5;">Trang sau &raquo;</span></li>';
            }else{
                $paging.='<li><a href="'.__link($cur_page-1,$link_full).'" class="cur_page" aria-label="Preview"> <span aria-hidden="true">&laquo; Trang trước</span></a></li>';
                $paging.='<li><a href="'.__link($cur_page+1,$link_full).'" aria-label="Next"><span aria-hidden="true">Trang sau &raquo;</span></a></li>';
            }
            $paging.='</ul>
        </nav>
    </div>';
    echo $paging;
}
function paging1($total_rows,$max_rows,$cur_page,$link_full){
    $max_pages=ceil($total_rows/$max_rows);
    $start=$cur_page-5; if($start<1)$start=1;
    $end=$cur_page+5;   if($end>$max_pages)$end=$max_pages;
    $paging='<div class="paging">
    <nav>
        <ul class="pagination">
            <input type="hidden" name="txtCurnpage" id="txtCurnpage" value="'.$cur_page.'" />';
            $paging.="";
            if($cur_page>1)
                $paging.='<li class="back"><a href="'.__link($cur_page-1,$link_full).'" aria-label="Next"><img src="'.ROOTHOST.'images/root/icon-back.png" alt="back"></a></li>';
            if($max_pages>1){
                for($i=$start;$i<=$end;$i++){
                    if($i!=$cur_page)
                        $paging.='<li><a href="'.__link($i,$link_full).'" aria-label="Next"><span aria-hidden="true">'.$i.'</span></a></li>';
                    else
                        $paging.='<li class="active"><a href="'.__link($cur_page,$link_full).'" aria-label="Next"><span aria-hidden="true">'.$cur_page.'</span></a></li>';
                }
            }
            if($cur_page <$max_pages)
                $paging.='<li class="next"><a href="'.__link($cur_page+1,$link_full).'" aria-label="Next"><img src="'.ROOTHOST.'images/root/icon-next.png" alt="next"></a></li>';
            $paging.='</ul>
        </nav>
    </div>';
    echo $paging;
}
function curPageURL() {
    $pageURL = 'http';
    if (array_key_exists('HTTPS', $_SERVER) && $_SERVER["HTTPS"] == "on") {$pageURL .= "s";}
    $pageURL .= "://";
    if ($_SERVER["SERVER_PORT"] != "80") {
        $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
    } else {
        $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
    }
    return $pageURL;
}
function Compression($cssFiles){
	$buffer = "";
	foreach ($cssFiles as $cssFile) {
	$buffer .= file_get_contents($cssFile);
	}
	$buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $buffer);
	$buffer = str_replace(': ', ':', $buffer);
	$buffer = str_replace(array("\r\n", "\r", "\n", "\t", '  ', '    ', '    '), '', $buffer);
	echo($buffer);
}
function html2text($Document) {
    $Rules = array ('@<script[^>]*?>.*?</script>@si',
                    '@<[\/\!]*?[^<>]*?>@si',
                    '@([\r\n])[\s]+@',
                    '@&(quot|#34);@i',
                    '@&(amp|#38);@i',
                    '@&(lt|#60);@i',
                    '@&(gt|#62);@i',
                    '@&(nbsp|#160);@i',
                    '@&(iexcl|#161);@i',
                    '@&(cent|#162);@i',
                    '@&(pound|#163);@i',
                    '@&(copy|#169);@i',
                    '@&(reg|#174);@i',
                    '@&#(d+);@e'
             );
    $Replace = array ('',
                      '',
                      '',
                      '',
                      '&',
                      '<',
                      '>',
                      ' ',
                      chr(161),
                      chr(162),
                      chr(163),
                      chr(169),
                      chr(174),
                      'chr()'
                );
  return str_replace($Rules, $Replace, $Document);
}

function page404(){
    echo "<script language=\"javascript\">window.location='".ROOTHOST.'404.html'."'</script>";
}

function convert_date($int_date){
    $str_tmp    = '';
    $cur_time   = time();
    $tmp        = $cur_time - $int_date;

    if($tmp >= 604800){
        $str_tmp = date("d/m/Y", $int_date);
    }else if( 86400 < $tmp && $tmp < 604800){
        $tmp = ROUND($tmp / 86400);
        $str_tmp = $tmp .'<span class="_date"> ngày trước</span>';
    }else if( 3600 < $tmp && $tmp < 86400){
        $tmp = round($tmp / 3600);
        $str_tmp = $tmp .'<span class="_date"> giờ trước</span>';
    }else if( 60 < $tmp && $tmp <= 3600){
        $tmp = round($tmp / 60);
        $str_tmp = $tmp .'<span class="_date"> phút trước</span>';
    }else if( $tmp <= 60){
        $str_tmp = $tmp .'<span class="_date"> giây trước</span>';
    }
    return $str_tmp;
}
function convert_price($price) {
	$num = strlen($price);
	if($num<6) return number_format($price);
	elseif($num>=6 && $num<=9){
		$price = round($price/1000000,2,PHP_ROUND_HALF_UP);
		return $price.' triệu';
	}
	elseif($num>=10){
		$price = round($price/1000000000,2,PHP_ROUND_HALF_UP);
		return $price.' tỷ';
	}
}
?>