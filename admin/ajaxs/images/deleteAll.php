<?php
session_start();
include_once('../../../includes/gfconfig.php');
include_once('../../../includes/gfinnit.php');
include_once('../../../includes/gffunction.php');
include_once('../../libs/cls.mysql.php');
include_once('../../libs/cls.users.php');

$objuser=new CLS_USERS;
if(!$objuser->isLogin()) die("E01");

// xóa file ảnh trên thư mục server
$target_dir='../../../'.$_SESSION['IMAGE360VIEW'];

//Get a list of all of the file names in the folder.
$files = glob($target_dir . '/*');
 
//Loop through the file list.
foreach($files as $file){
    //Make sure that this is a file and not a directory.
    if(is_file($file) && $file!='.htaccess'){
        //Use the unlink function to delete the file.
        unlink($file);
    }
}
unset($_SESSION['360_UPLOADIMGS']); 
?>
<input type="hidden" id="strImg" name="strImg" value="">
