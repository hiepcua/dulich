(function ($) {
	var $win = $(window),
	$body_m = $('body'),
	$navbar = $('.navbar');

	$(window).scroll(function(){
		if ($(this).scrollTop() > 150){
			$('body').addClass('fixed-header');
		}
		else{
			$('body').removeClass('fixed-header');
		}
	});

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

	$('.slider-banner').slick({
		fade:true,
		dots:false,
		arrows:false,
		autoplay:true,
		speed:700
	});

	if($("#myTab").length){
		setTimeout(function(){
			var _top = $("#myTab").offset().top;
			var _header_height = $("header .navbar").height();
			window.onscroll = function() {
				if (window.pageYOffset > _top - _header_height) {
					$("#myTab").addClass("sticky");
				} else {
					$("#myTab").removeClass("sticky");
				}
			};
		}, 3000);
	};

	$('.custom-select').customselect({
		search:true
	});

	$('[data-toggle="datepicker"]').datepicker({
		'dateFormat':'dd/mm/yy',
		autoHide: true,
        // Days' name of the week.
        days: ['Chủ nhật', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'],

        // Shorter days' name
        daysShort: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],

        // Shortest days' name
        daysMin: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],

        // Months' name
        months: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],

        // Shorter months' name
        monthsShort: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12']
    });

})(jQuery);



$(document).ready(function(){
	// call hotline mobile
	var _w = $(window).width();
	$('.mypage-alo-phone').css("left",(_w-110)/2+"px");

	
})