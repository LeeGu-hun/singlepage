$(document).ready(function(){
	$(window).resize(function(){
		var totalw = $(window).width();
		var totalh = $(window).height();
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2);
		$('.inner-content').css('top', totalh/3-h/2);
	});

	$('.inner-item').on('click', function(){
		var content = $(this).children().clone();
		$('.inner-content').html(content);
		$('.inner-content').append('<div class="close-btn">&#215;</div>');
		$('.close-btn').on('click', function(){
			$('.inner-content').removeClass('on');
			$('.inner-back').removeClass('on');
		});
		$('.inner-content').addClass('on');
		$('.inner-back').addClass('on');
		var totalw = $(window).width();
		var totalh = $(window).height();
		var ow = $('.inner-item').width();
		$('.inner-content').css('width', ow*2);
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2-20);
		$('.inner-content').css('top', totalh/3-h/2);
	});
	$('.inner-back').on('click', function(){
		$('.inner-content').removeClass('on');
		$('.inner-back').removeClass('on');
	});

});