<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page maker</title>
</head>
<body>

<script>
function pagereadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#puploadImg').attr('src', e.target.result);
			$('#puploadImg').attr('width', 300);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

page maker
<form:form commandName="pagecmd" action="makepage" enctype="multipart/form-data">
	<p><img id="puploadImg" name="puploadImg" />
	<p><label>사진:<input type="file" id="pfile" name="pfile" onchange="pagereadURL(this);" /></label>
	<p><input type="hidden" id="pupdir" name="pupdir" 
		value="<%=request.getRealPath("/puploads/")%>" />
	<p><label>이름:<br><form:input path="pname" /></label></p>
	<p><label>닉넴:<br><form:input path="pnick" /></label></p>
	<p><label>소개:<br><form:textarea path="pintro" /></label></p>
	<p><label>장르:<br><form:input path="pgenre" /></label></p>
	

	<p>map api div start</p>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752"></script> -->
	
	<div id="map" style="width:500px;height:400px;"></div>
	<div id="clickLatlng"></div>
	<div id="juso"></div>
	
	<script>
		var mapContainer = document.getElementById('map'),
    		mapOption = { 
        	center: new daum.maps.LatLng(33.450701, 126.570667),
        	level: 3
    	};
		var map = new daum.maps.Map(mapContainer, mapOption);

		var marker = new daum.maps.Marker({ 
  			position: map.getCenter(),
			map : map
		});
		
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
		
		var geocoder = new daum.maps.services.Geocoder();
		
		

		
		
		
		
		
	</script>
	
	
	
	
	
	
	
	
	
	<p>map api div end</p>
	
	
	<p><label>지역:<br><form:input path="ploc" /></label></p>
	<p><label>기간:<br><form:input path="pperiod" /></label></p>
	<p><label>시간:<br><form:input path="phowtime" /></label></p>
	<p><input type="submit" value="만들기" /></p>
</form:form>
</body>
</html>