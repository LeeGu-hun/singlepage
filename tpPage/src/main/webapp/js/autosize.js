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
		if(windowW > 1500) {
			$('#pagecenterbox').css('min-width', '');
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1500 && windowW > 1200) {
			$('#pagecenterbox').css('min-width', '');
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width() - $('#pageleftbox').width();
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1200) {
			$('#pagecenterbox').css('min-width', '1200px');
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width();
			$('#pagecenterbox').css('width', pagecenterboxW);
		}
	} else {
		if(windowW > 1500) {
			$('#pagecenterbox').css('min-width', '');
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', '');
			pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pagerightbox').width());
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1500 && windowW > 1200) {
			$('#pagecenterbox').css('min-width', '');
			$('#pageleftbox').css('display', '');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width() - $('#pageleftbox').width();
			$('#pagecenterbox').css('width', pagecenterboxW);
		} else if(windowW <= 1200) {
			$('#pagecenterbox').css('min-width', '1200px');
			$('#pageleftbox').css('display', 'none');
			$('#pagerightbox').css('display', 'none');
			pagecenterboxW = $(window).width();
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

