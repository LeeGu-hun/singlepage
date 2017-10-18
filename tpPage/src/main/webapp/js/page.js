$(document).ready(function() {
	$('#media').carousel({
		pause : true,
		interval : false,
	});
});

function donate() {
	$('.donate').lightBox();
}

$('.js-open').click(function () {
    var $layer = $('.js-layer');
    $layer.removeClass('hidden');
});