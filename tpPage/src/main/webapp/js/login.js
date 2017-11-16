
$(document).ready(function(){
	if ($('.has-error').length) {
		$('.msg').fadeIn();
		$('.msg').prev().on('keydown', function() {
			$(this).next().fadeOut();
			$(this).children().attr('class', 'form-control');
		});
	}
});
