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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/pagemaker.js?ver=122532"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page maker</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<form:form commandName="pagecmd" name="mpfrm" action="makepage" enctype="multipart/form-data">
<div class="alldiv">
<h2 align="center"><b>Page Make</b></h2><hr>
	<p><img id="puploadImg" name="puploadImg" />
	<div class="form-inline"><label>●사진:<input type="file" id="pfile" name="pfile" onchange="pagereadURL(this);" /></label>
	<input type="hidden" id="pupdir" name="pupdir" value="<%=request.getRealPath("/puploads/")%>" /></div><br><br>
	<div class="form-inline"><label>●이름:&nbsp; &nbsp;<form:input class="form-control" path="pname" style="width:300px;" /></label></div><br><br>
	<div class="form-inline"><label>●닉넴:&nbsp; &nbsp;<form:input class="form-control" path="pnick" style="width:300px;" /></label></div><br><br>
	<div class="form-inline"><label>●소개:&nbsp; &nbsp;<form:textarea class="form-control" path="pintro" style="width:300px;" /></label></div><br><br>
	
	<div class="form-inline">
		<label>●구분</label><br>
		<label>&nbsp; -카테고리:&nbsp; &nbsp;
			<select class="form-control" id="pgcate" name="pgcate" style="width:265px;" onchange>
				<option value="0">임의</option>
				<option value="1">공연</option>
				<option value="2">미술</option>
				<option value="3">패션</option>
				<option value="4">도서</option>
				<option value="5">요리</option>
				<option value="6">기타</option>
			</select>
		</label>
	</div><br>
	<div class="form-inline"><label>&nbsp; -세부장르:&nbsp; &nbsp;<input class="form-control" type="text" id="pgdetail" name="pgdetail" style="width:265px;" onkeyup; onkeypress; onkeydown; /></label></div><br><br>
	<!-- <label>장르:<br> --><form:input class="form-control" type="hidden" path="pgenre" style="width:300px;" /><!-- </label> -->
	<div class="form-inline">
		<label>●지역:&nbsp; &nbsp;
		<input class="form-control" type="text" id="keyword" style="width:300px;" /> 
		<input class="btn btn-custom" type="button" value="검색" onclick="mapsearch(); return false;" /><br><br>
		 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
		<form:input class="form-control" path="ploc" style="width: 300px" readonly="true"/></label>	
	</div>
	 &nbsp; &nbsp;
	<div id="map" style="width:500px;height:400px;"></div><br><br>
	
	<!-- <label>좌표:<br> --><form:input type="hidden" path="platlng" style="width:300px;" /><!-- </label> -->
	<div class="form-inline">
		<label>●기간:&nbsp; &nbsp;
		<form:input class="form-control" path="pperiod" value="" style="width:300px;" /></label></div><br><br>
	<div class="form-inline">
		<label>●공연시간</label><br>
		<label>&nbsp; -시작:&nbsp; &nbsp;
			<select class="form-control" id="pststart" name="pststart" style="width:295px;" onchange>
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
		</label>
	</div>
	<div class="form-inline">
		<label>&nbsp; -종료:&nbsp; &nbsp;
			<select class="form-control" id="pstend" name="pstend" style="width:295px;" onchange>
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
	</div>
	<!-- <label>시간:<br> --><form:input class="form-control" type="hidden" path="pshowtime" value="" style="width:300px;"/><!-- </label> -->
	<div style="text-align: center">
		<br/><br/>
		<input class="btn btn-custom" type="button" value="만들기" onclick="makepage(); " />
	</div>
</div>
</form:form>
<script src="<%=request.getContextPath()%>/js/map.js?ver=1"></script>
</body>
</html>