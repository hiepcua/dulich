<?php
$isSecure = false;
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
	$isSecure = true;
}
elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
	$isSecure = true;
}
$REQUEST_PROTOCOL = $isSecure ? 'https://' : 'http://';

// define('ROOTHOST',$REQUEST_PROTOCOL.$_SERVER['HTTP_HOST'].'/');
define('ROOTHOST','http://localhost/dulich/');
define('ROOTHOST_ADMIN',ROOTHOST.'admin/');
define('WEBSITE',$REQUEST_PROTOCOL.$_SERVER['HTTP_HOST'].'/');
define('BASEVIRTUAL0','../../images/');
define('IMG_DEFAULT','images/icons/no-image.jpg');
define('THUMB_DEFAULT','images/icons/no-image.jpg');
define('BANNER_DEFAULT','images/basic/banner-default.jpg');
define('PATH_GALLERY','images/gallery/');
define('PATH_GALLERY_REVIEW','images/gallery/');
define('UPLOAD_PATH',$_SERVER['DOCUMENT_ROOT'].'/');

define('APP_ID','1663061363962371');
define('APP_SECRET','dd0b6d3fb803ca2a51601145a74fd9a8');

define('ROOT_PATH',''); 
define('TEM_PATH',ROOT_PATH.'templates/');
define('COM_PATH',ROOT_PATH.'components/');
define('MOD_PATH',ROOT_PATH.'modules/');
define('INC_PATH',ROOT_PATH.'includes/');
define('LAG_PATH',ROOT_PATH.'languages/');
define('EXT_PATH',ROOT_PATH.'extensions/');
define('EDI_PATH',EXT_PATH.'editor/');
define('DOC_PATH',ROOT_PATH.'documents/');
define('DAT_PATH',ROOT_PATH.'databases/');
define('IMG_PATH',ROOT_PATH.'images/');
define('MED_PATH',ROOT_PATH.'media/');
define('LIB_PATH',ROOT_PATH.'libs/');
define('JSC_PATH',ROOT_PATH.'js/');
define('LOG_PATH',ROOT_PATH.'logs/');

define('MAX_ROWS','8');
define('MAX_ROWS_ADMIN','50');
define('TIMEOUT_LOGIN','60');
define('URL_REWRITE','1');
define('MAX_ROWS_INDEX',40);

define('SMTP_SERVER','smtp.gmail.com');
define('SMTP_PORT','465');
define('SMTP_USER','hoangtucoc321@gmail.com');
define('SMTP_PASS','nsn2651984');
define('SMTP_MAIL','hoangtucoc321@gmail.com');
define('IGF_LICENSE','77667050813dd94a49756d59de5cea88');

define('SHOP_CODE','TD');//hàng tiêu dùng
define('SITE_NAME','seogoogle.com');
define('SITE_TITLE','');
define('SITE_DESC','');
define('SITE_KEY','');
define('COM_NAME','Copyright &copy; by IGF');
define('COM_CONTACT','');

define('TOUR_TIME', serialize(array("1NGÀY", "2N/1Đ", "3N/2Đ", "4N/3Đ", "5N/4Đ", "6N/5Đ", "7N/6Đ", "8N/7Đ", "9N/8Đ", "10N/9Đ", "11N/10Đ", "12N/11Đ", "13N/12Đ", "14N/13Đ", "15N/14Đ", "TRÊN 15N", "4Đ/3N", "1N1Đ", "2N2Đ", "3N3Đ")));
define('TOUR_PRICE', serialize(array("Dưới 2tr", "Từ 2tr-3tr", "Từ 3tr-5tr", "Từ 5tr-10tr", "Từ 10tr-15tr", "Từ 15tr-20tr", "Từ 20tr-50tr", "Trên 50tr")));
define('TOUR_HOBBIT', serialize(array("Picnic", "Phượt", "Nghỉ dưỡng", "Khám phá", "Biển", "Tâm linh")));
define('TOUR_VEHICLE', serialize(array("Ô tô", "Xe máy", "Máy bay")));
?>