/*function autoDiv() {
	mainBoxHeight = $('#contentBox').height();
	windowHeight  = $(window).height() - $('#footer').height();
	if(mainBoxHeight < windowHeight){
		$('#mainBox').css('height', windowHeight);
	} else {
		$('#mainBox').css('height', mainBoxHeight);
	}
}
*/

function autolayout() {
	windowwidth = $(window).width();
	pagecenterwidth = $(window).width() - ($('#pageleftbox').width() + $('#pageleftbox').width());
	pagecenterheight = $('#pagecenterbox').height();
	$('#pagecenterbox').css('width', pagecenterwidth);
}

$(document).ready(function() {
	/*autoDiv();*/
	autolayout();
});

$(window).resize(function () {
	/*autoDiv();*/
	autolayout();
});

