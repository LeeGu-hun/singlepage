/*function autoDiv() {
	pagemainboxHeight = $('#pagecontentbox').height();
	windowHeight  = $(window).height() - $('#footer').height();
	if(pagemainoxHeight < windowHeight){
		$('#pagemainbox').css('height', windowHeight);
	} else {
		$('#pagemainBox').css('height', pagemainboxHeight);
	}
}*/

function autolayout() {
	windowH = $(window).height() - ($('#header').height() + $('#footer').height());
	pagecontentboxH = $('#pagecontentbox').height();
	if(windowH > pagecontentboxH) {
		$('#pagemainbox').css('height', windowH);
	} else {
		$('#pagemainbox').css('height', pagecontentboxH);
	}
	
	windowW = $(window).width();
	console.log(windowW);
	if($(document).height() > $(window).height()) {
		if(windowW >= 1300) {
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW < 1300) {
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW < 1000) {
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css({'width' : 'auto'}, {'min-width' : '900'});
		}
	} else {
		if(windowW >= 1300) {
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW < 1300) {
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW < 1000) {
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css({'width' : 'auto'}, {'min-width' : '900'});
		}
	}
	/*if(windowW < 900) {
		$('#pagerightbox').remove();
		$('#pagecenterbox').css('width', 'auto');
	}*/

















}

$(document).ready(function() {
	autolayout();
});

$(document).resize(function() {
	autolayout();
});

$(window).ready(function () {
	autolayout();
});

$(window).resize(function () {
	autolayout();
});

