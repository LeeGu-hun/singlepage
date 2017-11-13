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
	pagecenterboxW = $(window).width() - ($('#pageleftbox').width() + $('#pageleftbox').width());
	$('#pagecenterbox').css('width', pagecenterboxW);
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

