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

<script src="<%=request.getContextPath()%>/js/pagemaker.js?ver=122532"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page maker</title>
</head>
<body>
page maker
<form:form commandName="pagecmd" name="mpfrm" action="makepage" enctype="multipart/form-data">
	<p><img id="puploadImg" name="puploadImg" />
	<p><label>사진:<input type="file" id="pfile" name="pfile" onchange="pagereadURL(this);" /></label>
	<p><input type="hidden" id="pupdir" name="pupdir" 
		value="<%=request.getRealPath("/puploads/")%>" />
	<p><label>이름:<br><form:input path="pname" style="width:300px;" /></label></p>
	<p><label>닉넴:<br><form:input path="pnick" style="width:300px;" /></label></p>
	<p><label>소개:<br><form:textarea path="pintro" style="width:300px;" /></label></p>
	<p>
		<label>장르카테:<br>
			<select id="pgcate" name="pgcate" style="width:300px;" onchange>
				<option value="0">임의</option>
				<option value="1">노래</option>
				<option value="2">댄스</option>
				<option value="3">연주</option>
				<option value="4">연극</option>
				<option value="5">기타</option>
			</select>
		</label>
	</p>
	<p><label>장르세부:<br><input type="text" id="pgdetail" name="pgdetail" style="width:300px;" onkeyup; onkeypress; onkeydown; /></label></p>
	<p><label>장르:<br><form:input path="pgenre" style="width:300px;" /></label></p>
	<div id="map" style="width:500px;height:400px;"></div>
	<input type="text" id="keyword" style="width:300px;" /> 
	<input type="button" value="검색" onclick="mapsearch(); return false;" />
	<p><label>지역:<br><form:input path="ploc" style="width:300px;" /></label></p>
	<p><label>좌표:<br><form:input path="platlng" style="width:300px;" /></label></p>
	<p><label>기간:<br><form:input path="pperiod" value="" style="width:300px;" /></label></p>
	<p>
		<label>시작:<br>
			<select id="pststart" name="pststart" style="width:300px;" onchange>
				<option value="">미정</option>
				<%
					String start;
					for(int i=0; i<=23; i++) {
						if(i <= 9) {
							start = "0" + i;
						} else {
							start = i + "";
						}
				%>
					<option value="<%=start %>"><%=start %>:00</option>
				<%		
					}
				%>
			</select>
		</label><br>
		<label>종료:<br>
			<select id="pstend" name="pstend" style="width:300px;" onchange>
				<option value="">미정</option>
				<%
					String end;
					for(int i=1; i<=24; i++) {
						if(i <= 9) {
							end = "0" + i;
						} else {
							end = i + "";
						}
				%>
					<option value="<%=end %>"><%=end %>:00</option>
				<%		
					}
				%>
			</select>
		</label>
	</p>
	<p><label>시간:<br><form:input path="pshowtime" value="" style="width:300px;"/></label></p>
	<p><input type="button" value="만들기" onclick="makepage(); " /></p>
</form:form>
<script src="<%=request.getContextPath()%>/js/adminMap.js?ver=1"></script>
</body>
</html>