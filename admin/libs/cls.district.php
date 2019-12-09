<?php
class CLS_DISTRICT{
	private $pro=array( 'ID'=>'-1',
						'Name'=>'',
						'Code'=>'',
						'Order'=>'',
						'isActive'=>1);
	private $objmysql=NULL;
	public function CLS_DISTRICT(){
		$this->objmysql=new CLS_MYSQL;
	}
	// property set value
	public function __set($proname,$value){
		if(!isset($this->pro[$proname])){
			echo ('Can not found $proname member');
			return;
		}
		$this->pro[$proname]=$value;
	}
	public function __get($proname){
		if(!isset($this->pro[$proname])){
			echo ("Can not found $proname member");
			return;
		}
		return $this->pro[$proname];
	}
	public function getList($where='',$limit=''){
		$sql="SELECT * FROM `tbl_district` ".$where.' ORDER BY `name` '.$limit;
		return $this->objmysql->Query($sql);
	}
	public function getListCbo($id=0,$city_id=0){
		$sql="SELECT * FROM `tbl_district` ";
		if($city_id!=0) $sql.=" WHERE city_id=$city_id";
		$sql.=" ORDER BY `order` DESC,id ASC "; 
		$objdata=new CLS_MYSQL;  $objdata->Query($sql);
		while($row=$objdata->Fetch_Assoc()) {
			if($id==$row['id']) echo "<option value='".$row['id']."' selected>".$row['name']."</option>";
			else echo "<option value='".$row['id']."'>".$row['name']."</option>";
		}
	}
	public function Num_rows(){
		return $this->objmysql->Num_rows();
	}
	public function Fetch_Assoc(){
		return $this->objmysql->Fetch_Assoc();
	}
	public function getNameById($id){
		$objdata=new CLS_MYSQL;
		$sql="SELECT `name` FROM `tbl_district`  WHERE isactive=1 AND `id` = '$id'"; 
		$objdata->Query($sql);
		$row=$objdata->Fetch_Assoc();
		return $row['name'];
	}
	public function Add_new(){
		$sql=" INSERT INTO `tbl_district`(`name`,`code`,`isactive`) VALUES";
		$sql.="('".$this->Name."','".$this->Code."','".$this->isActive."')";
		return $this->objmysql->Exec($sql);
	}
	public function Update(){
		$sql = "UPDATE tbl_district SET `name`='".$this->Name."',`code`='".$this->Code."',
		`isactive`='".$this->pro["isActive"]."' WHERE id='".$this->ID."'";
		return $this->objmysql->Exec($sql);
	}
	public function Delete($id){
		$sql="DELETE FROM `tbl_district` WHERE `id` in ('$id')";
		return $this->objmysql->Exec($sql);
	}
	public function setActive($ids,$status=''){
		$sql="UPDATE `tbl_district` SET `isactive`='$status' WHERE `id` in ('$ids')";
		if($status=='')
			$sql="UPDATE `tbl_district` SET `isactive`=if(`isactive`=1,0,1) WHERE `id` in ('$ids')";
		return $this->objmysql->Exec($sql);
	}
	public function Order($arr_id,$arr_quan){
		$n=count($arr_id);
		for($i=0;$i<$n;$i++){
			$sql="UPDATE `tbl_district` SET `order`='".$arr_quan[$i]."' WHERE `id` = '".$arr_id[$i]."' ";
			$this->objmysql->Exec($sql);
		}
	}
}
?>