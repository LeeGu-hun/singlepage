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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page maker</title>
</head>
<body>

page maker
<form:form commandName="pagecmd" action="makepage" enctype="multipart/form-data">
	<p><img id="puploadImg" name="puploadImg" />
	<p><label>사진:<input type="file" id="pfile" name="pfile" onchange="pagereadURL(this);" /></label>
	<p><input type="hidden" id="pupdir" name="pupdir" 
		value="<%=request.getRealPath("/puploads/")%>" />
	<p><label>이름:<br><form:input path="pname" style="width:300px;" /></label></p>
	<p><label>닉넴:<br><form:input path="pnick" style="width:300px;" /></label></p>
	<p><label>소개:<br><form:textarea path="pintro" style="width:300px;" /></label></p>
	<p><label>장르:<br><form:input path="pgenre" style="width:300px;" /></label></p>
	<div id="map" style="width:500px;height:400px;"></div>
	<input type="text" id="keyword" style="width:300px;" /> 
	<input type="button" value="검색" onclick="searchPlaces(); return false;" />
	<p><label>지역:<br><form:input path="ploc" style="width:300px;" /></label></p>
	<p><label>좌표:<br><form:input path="platlng" style="width:300px;" /></label></p>
	<p><label>기간:<br><form:input path="pperiod" style="width:300px;" /></label></p>
	<p><label>시간:<br><form:input path="phowtime" style="width:300px;" /></label></p>
	<p><input type="submit" value="만들기" /></p>
</form:form>
<script src="<%=request.getContextPath()%>/js/map.js?ver=3"></script>
</body>
</html>