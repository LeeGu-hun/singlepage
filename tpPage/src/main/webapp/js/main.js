
$(document).ready(function(){

	if($(document).height() > $(window).height())
		$("#btn").css("display", "none");
	$(window).scroll(function(){
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();
		if($(document).height() > $(window).height())
			$("#btn").css("display", "none");
		if(scrollHeight >= documentHeight-10){
			loadMain();
		}
	});
	
	$(window).resize(function(){
		var totalw = $(window).width();
		var totalh = $(window).height();
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2);
		$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
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
		console.log(ow);
		$('.inner-content').css('width', ow*2);
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2-20);
		console.log($(window).scrollTop());
		$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
	});
	$('.inner-back').on('click', function(){
		$('.inner-content').removeClass('on');
		$('.inner-back').removeClass('on');
	});

});

function loadMain() {
	$.ajax({
		type : "POST",
		url : "./loadMain",
		success : appendList
	});
}

function appendList(list) {
	if($("#end").length) {
		return;
	} else {
		var $list = $(list);
		$list.imagesLoaded(function (){
			$(".grid").append($list).masonry('appended',$list);
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
			var totalh = $(document).height();
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			var h = documentHeight - scrollHeight;
			var ow = $('.inner-item').width();
			$('.inner-content').css('width', ow*2);
			$('.inner-back').css('width', totalw);
			$('.inner-back').css('height', totalh);
			var w = $('.inner-content').width();
			var h = $('.inner-content').height();
			$('.inner-content').css('left', totalw/2-w/2-20);
			$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
		});
	}
}
