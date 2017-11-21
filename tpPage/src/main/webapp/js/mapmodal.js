var mapmodalplatlng = $('#mapmodalplatlng').val()
var plat = mapmodalplatlng.split('//')[0];
var plng = mapmodalplatlng.split('//')[1];

var container = document.getElementById('mapdiv')
var option = {
	center: new daum.maps.LatLng(36.8456144382645, 127.6883583287049),
	level: 13
	};

var map = new daum.maps.Map(container, option);

function openmapmodal() {
	$('#mapmodal').modal('show');
	$('body').css({'overflow': 'hidden', 'padding': '0px'});
}

$(document).ready(function() {
	$('#mapmodal').on('hidden.bs.modal', function() {
		$('body').css('overflow', '');
	});
});