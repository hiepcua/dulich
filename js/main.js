(function ($) {
	var $win = $(window),
	$body_m = $('body'),
	$navbar = $('.navbar');

	var prevScrollpos = window.pageYOffset;
	window.onscroll = function() {
		var currentScrollPos = window.pageYOffset;
		if(currentScrollPos > 300){
			if (prevScrollpos > currentScrollPos) {
				document.getElementById("navbar").classList.add('position-fixed');
			} else {
				document.getElementById("navbar").classList.remove('position-fixed');
			}
			prevScrollpos = currentScrollPos;
		}else{
			document.getElementById("navbar").classList.remove('position-fixed');
		}
	}

	$(".fa-caret-right").click(function () {
		$(".social-top>ul").toggleClass("show-social-top");
		return false;
	});
	$(".fa-caret-right").click(function () {
		$(this).toggleClass("show-icon-social");
		return false;
	});

	$('.navbar-toggler').click(function(){
		$('body').addClass('open-menu');
	});

	$('.close-menu').click(function(){
		$('body').removeClass('open-menu');
	});

	// Search form
	$('#frmsearch .fa.fa-search').click(function(){
		$('#frmsearch').submit();
	});
	$(".header-icon-search").click(function () {
        $("#check").toggleClass("show-header-icon-search");
        return false;
    });
})(jQuery);



$(document).ready(function(){
	// call hotline mobile
	var _w = $(window).width();
	$('.mypage-alo-phone').css("left",(_w-110)/2+"px");

	
})