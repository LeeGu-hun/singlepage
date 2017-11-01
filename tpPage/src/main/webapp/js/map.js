var mapContainer = document.getElementById('map'),
		mapOption = { 
    	center: new daum.maps.LatLng(36.8456144382645, 127.6883583287049),
		level: 13
	};
	var map = new daum.maps.Map(mapContainer, mapOption);

	var marker = new daum.maps.Marker({ 
		/* position: map.getCenter(),
		map : map */
	});
	
	var geocoder = new daum.maps.services.Geocoder();
	var ps = new daum.maps.services.Places();
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	            
	        	var detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
	         	
	            var latlng = mouseEvent.latLng; 
	            var message = latlng.getLat() + "//" + latlng.getLng();
	            
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	            
	            document.getElementById('ploc').value = detailAddr;
	            document.getElementById('platlng').value = message;
	        }   
	    });
	});
	function searchAddrFromCoords(coords, callback) {
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	function searchDetailAddrFromCoords(coords, callback) {
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	var ps = new daum.maps.services.Places(); 
	function searchPlaces() {
		var keyword = document.getElementById('keyword').value;
	
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
    		keyword = '대한민국';
		}
		ps.keywordSearch(keyword, placesSearchCB); 
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
