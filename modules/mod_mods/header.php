<header id="header">
	<div class="top-header">
		<div class="container">
			<div class="col-left">
				<ul>
					<li class="hotline">Hotline:&nbsp&nbsp<a href="tel:<?php echo $conf->Phone;?>"><?php echo $conf->Phone;?></a></li>
					<li><?php echo "Hôm nay: " . date("d/m/y") . "<br>"; ?></li>
				</ul>
			</div>
			<div class="col-right">
				<ul class="social">
					<li><a href="<?php echo $conf->Facebook;?>" target="_blank" rel="nofollow" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a href="<?php echo $conf->Twitter;?>" target="_blank" rel="nofollow" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a href="<?php echo $conf->Youtube;?>" target="_blank" rel="nofollow" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
				</ul>
				<section id="search">
					<form class="form-search-header" method="GET" action="<?php echo ROOTHOST;?>tim-kiem">
						<label for="search-input"><i class="fa fa-search" aria-hidden="true"></i><span class="sr-only">Search icons</span></label>
						<input id="search-input" name="q" class="form-control" placeholder="Tìm kiếm ...">
					</form>
				</section>
			</div>
		</div>
	</div>

	<div class="wrap-logo">
		<a href="<?php echo ROOTHOST;?>" title="Trang chủ">
			<?php $tmp->loadModule('user1');?>
		</a>
	</div>

	<nav id="navbar" class="wrap-menu navbar" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<nav id="main-menu"><?php $tmp->loadModule('navitor');?></nav>
			</div>
		</div>
	</nav>
</header>
<div class="social-top">
	<ul>
		<li class="menu-support-children"><a title="Facebook" target="_blank" href="<?php echo $conf->Facebook;?>"><i class="fa fa-facebook"></i></a></li>
		<li class="menu-support-children"><a title="Messenger" target="_blank" href="<?php echo $conf->Facebook;?>"><i class="fa fa-commenting"></i></a></li>
		<li class="menu-support-children"><a title="Twitter" target="_blank" href="<?php echo $conf->Twitter;?>"><i class="fa fa-twitter"></i></a></li>
		<li class="menu-support-children"><a title="Youtube" target="_blank" href="<?php echo $conf->Youtube;?>"><i class="fa fa-youtube-play"></i></a></li>
		<li class="menu-support-children"><a title="Tài liệu" href="<?php echo ROOTHOST;?>"><i class="fa fa-book"></i></a></li>
	</ul>
	<i class="fa fa-caret-right"></i>
</div>