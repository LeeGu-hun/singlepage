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
	<p><label>지역:<br><form:input path="ploc" /></label></p>
	<p><label>기간:<br><form:input path="pperiod" /></label></p>
	<p><label>시간:<br><form:input path="phowtime" /></label></p>
	<p><input type="submit" value="만들기" /></p>
</form:form>
</body>
</html>
