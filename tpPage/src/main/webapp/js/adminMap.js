var container = document.getElementById('map')
var lat = $('#lat').val();
var lng = $('#lng').val();
var option = {
	center: new daum.maps.LatLng(lat, lng),
	level: 3
	};
var map = new daum.maps.Map(container, option);
var marker = new daum.maps.Marker();
var info = new daum.maps.InfoWindow();
var geocoder = new daum.maps.services.Geocoder();
var ps = new daum.maps.services.Places();

function mapsearch() {
	var keyword = document.getElementById('keyword').value;
	if(keyword == '' || keyword == null) {
		keyword = '대한민국';
	}
	geocoder.addressSearch(keyword, function(result, status) {
		if(status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			searchDetailAddrFromCoords(coords, function(result, status) {
				if(status === daum.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
					var message = coords.getLat() + "//" + coords.getLng();
					map.setLevel(3);
					map.setCenter(coords);
					marker.setMap(null);
					marker.setMap(map);
					marker.setPosition(coords);
					document.getElementById('ploc').value = detailAddr;
					document.getElementById('platlng').value = message;
				}
			});	
		} else {
			marker.setMap(null);
			document.getElementById('ploc').value = '';
			document.getElementById('platlng').value = '';
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				keyword = '대한민국';
				return false;
			}
			ps.keywordSearch(keyword, placesSearchCB);
		}
	});
}

daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		if (status === daum.maps.services.Status.OK) {
			var detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
			var latlng = mouseEvent.latLng; 
			var message = latlng.getLat() + "//" + latlng.getLng();
			marker.setMap(null);
			marker.setMap(map);
			marker.setPosition(mouseEvent.latLng);
			document.getElementById('ploc').value = detailAddr;
			document.getElementById('platlng').value = message;
		}   
	});
});

function searchDetailAddrFromCoords(coords, callback) {
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        var bounds = new daum.maps.LatLngBounds();
		for (var i=0; i<data.length; i++) {
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       
		map.setBounds(bounds);
    } 
}
