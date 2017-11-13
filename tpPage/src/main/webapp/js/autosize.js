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
	windowW = $(window).width();
	if($(document).height() > $(window).height()) {
		if(windowW > 1300) {
			$('#pagecenterbox').css('min-width', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1300 && windowW > 1000) {
			$('#pagecenterbox').css('min-width', '');
			pagecenterboxW = $(window).width() - $('#pageleftbox').width();
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1000) {
			$('#pagecenterbox').css('min-width', '600px');
			pagecenterboxW = $(window).width();
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css('width', pagecenterboxW);
		}
	} else {
		if(windowW > 1300) {
			$('#pagecenterbox').css('min-width', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1300 && windowW > 1000) {
			$('#pagecenterbox').css('min-width', '');
			pagecenterboxW = $(window).width() - $('#pageleftbox').width();
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1000) {
			$('#pagecenterbox').css('min-width', '600px');
			pagecenterboxW = $(window).width();
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			$('#pagecenterbox').css('width', pagecenterboxW);
		}
	}	
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

