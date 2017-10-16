/*function autoResizeDiv() {
	mainBoxHeight = $('#contentBox').height();
	windowHeight  = $(window).height() - $('#footer').height();
	if(mainBoxHeight < windowHeight){
		$('#mainBox').css('height', windowHeight);
	} else {
		$('#mainBox').css('height', mainBoxHeight);
	}
}

$(document).ready(function() {
	autoResizeDiv();
});
*/

function autolayout() {
	windowwidth = $(window).width();
	pagecenterwidth = $(window).width() - ($('#pageleftbox').width() + $('#pageleftbox').width());
	pagecenterheight = $('#pagecenterbox').height();
	$('#pagecenterbox').css('width', pagecenterwidth);
	$('#pageleftbox').css('height', pagecenterheight);
	$('#pagerightbox').css('height', pagecenterheight)
	
}

$(document).ready(function() {
	autolayout();
});

$(window).resize(function () {
	autolayout();
});