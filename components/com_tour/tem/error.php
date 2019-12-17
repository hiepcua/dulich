<?php $conf = new CLS_CONFIG(); ?>
<section class="page page-contents">
	<section class="breadcrumb-light">
		<div class="container">
			<ol class="breadcrumb align-items-center">
				<li class="breadcrumb-item"><a href="<?php echo ROOTHOST; ?>"><i class="fa fa-home"></i></a></li>
				<li class="breadcrumb-item active" aria-current="page">Đặt tour lỗi!</li>
			</ol>
		</div>
	</section>
	<div class="container">
		<div class="text-center">
			<div class="alert">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<strong>Đặt tour lỗi.</strong> <p>Có lỗi trong quá trình đặt tour, xin vui lòng thử đặt lại hoặc liên hệ trực tiếp qua đường dây nóng <span class="hotline"><?php echo $conf->Phone; ?></span></p>
			</div>
			
			<a href="<?php echo ROOTHOST; ?>" class="btn btn-primary">Quay về trang chủ</a>
		</div>
	</div>
</section>