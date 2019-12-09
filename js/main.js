var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
	var currentScrollPos = window.pageYOffset;
	if(currentScrollPos > 300){
		if (prevScrollpos > currentScrollPos) {
			document.getElementById("navbar").style.position = "fixed";
			document.getElementById("navbar").style.top = "";
		} else {
			document.getElementById("navbar").style.position = "relative";
			document.getElementById("navbar").style.top = "-50px";
		}
		prevScrollpos = currentScrollPos;
	}else{
		document.getElementById("navbar").style.position = "relative";
	}
}

$(document).ready(function(){
	$('footer .address > div').html("<i class='fa fa-map-marker'></i> "+$('footer .address > div').html())
	$('footer .tel > div').html("<i class='fa fa-phone'></i> "+$('footer .tel > div').html())
	$('footer .calendar > div').html("<i class='fa fa-calendar'></i> "+$('footer .calendar > div').html())
	$('footer .ship > div').html("<i class='fa fa-truck'></i> "+$('footer .ship > div').html())

	// call hotline mobile
	var _w=$(window).width();
	$('.mypage-alo-phone').css("left",(_w-110)/2+"px");

	

	$('#slide-follow').owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		responsive:{
			0:{
				items:1,
				nav:true
			},
			600:{
				items:2,
				nav:false
			},
			1000:{
				items:4,
				nav:true,
				loop:false
			}
		}
	});

	$('#slide-hot-news').owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		responsive:{
			0:{
				items:1,
				nav:true
			},
			600:{
				items:1,
				nav:false
			},
			1000:{
				items:1,
				nav:true,
				loop:false
			}
		}
	});

	$("#feedback").owlCarousel({
		loop:true,
		margin:10,
		responsiveClass:true,
		responsive:{
			0:{
				items:1,
				nav:true
			},
			600:{
				items:2,
				nav:false
			},
			1000:{
				items:2,
				nav:true,
				loop:false
			}
		}
	});

	// Search form
	$('#frmsearch .fa.fa-search').click(function(){
		$('#frmsearch').submit();
	});
})