function openmapmodal() {
	var ploc = $('#nowploc').val();
	var platlng = $('#nowplatlng').val();
	$.ajax({
		type : "POST",
		url : "/tpPage/mapmodal",
		data : "ploc=" + ploc + "&platlng=" + platlng,
		success : mapmodalR
	});
	function mapmodalR(msg) {
		$('#mapmodaldiv').html(msg);
		$('#mapmodal').modal('show');
		$('body').css({'overflow': 'hidden', 'padding': '0px'});
		mapmodal();
		$('#mapmodal').on('hidden.bs.modal', function() {
			$('body').css('overflow', '');
		});
	}
}

function mapmodal() {
	var container = document.getElementById('mapdiv');
	var mapmodalplatlng = $('#mapmodalplatlng').val();
	if(mapmodalplatlng == '') {
		var plat = 36.8456144382645;
		var plng = 127.6883583287049;
		var option = {
				center: new daum.maps.LatLng(plat, plng),
				level: 13
		};
	} else {
		var plat = mapmodalplatlng.split('//')[0];
		var plng = mapmodalplatlng.split('//')[1];
		var option = {
				center: new daum.maps.LatLng(plat, plng),
				level: 3
		};
	}
	var map = new daum.maps.Map(container, option);
	var mlatlng = new daum.maps.LatLng(plat, plng);
	var marker = new daum.maps.Marker({ position: mlatlng });
	if(plat == 36.8456144382645 && plng == 127.6883583287049) {	
		map.setDraggable(false);
	} else {
		marker.setMap(map);		
	}
}