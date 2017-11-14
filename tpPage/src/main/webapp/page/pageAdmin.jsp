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

<script src="<%=request.getContextPath()%>/js/admin.js?ver=2"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page maker</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<form:form commandName="pagecmd" name="apfrm" action="adminpage" enctype="multipart/form-data">
<div class="alldiv">
<h2 align="center"><b>Page Admin</b></h2><hr>
	<p><c:choose>
			<c:when test="${!empty page.pnewfile}">
				<img id="puploadImg" name="puploadImg" src="/tpPage/puploads/${page.pnewfile }"  alt="프로필사진" width="200px" height="auto"/>
			</c:when>
			<c:otherwise>
				<img id="puploadImg" name="puploadImg" src="profile.png" alt="프로필" width="" height="" />
			</c:otherwise>
		</c:choose>
	<p><label>●사진:</label><input type="file" id="pfile" name="pfile" onchange="pagereadURL(this);" /><br></p>
	<input type="hidden" id="pupdir" name="pupdir" value="<%=request.getRealPath("/puploads/")%>" />
	<p><label>●이름:</label>&nbsp; &nbsp;<input id="pname" name="pname" style="width:300px;" value="${page.pname }"/><br></p>
	<p><label>●닉넴:</label>&nbsp; &nbsp;<input id="pnick" name="pnick" style="width:300px;" value="${page.pnick }"/><br></p>
	<p><label>●소개:</label>
		<textarea id="pintro" name="pintro">${page.pintro }</textarea><br></p>
	<p>
		<label>●구분</label><br>
		<label>&nbsp; -카테고리:&nbsp; &nbsp;</label>
			<select  id="pgcate" name="pgcate" style="width:300px;" >
				<c:forEach var="g" items="${genres }">
				<option value="${g}" ${genre == g ? 'selected' : ''}>${g}</option>
				</c:forEach>	
			</select>	
	<br></p>
	<p><label>&nbsp; -세부장르:&nbsp; &nbsp;<input type="text" id="pgdetail" name="pgdetail" style="width:300px;" value="${genreDetail }" onkeyup; onkeypress; onkeydown; /></label></p>
	<input type="hidden" id="pgenre" name="pgenre" style="width:300px;"/>
	<br>
	<p>
		<label>●지역: &nbsp;<input type="text" id="keyword" style="width:300px;"/> 
		<input type="button" class="btn btn-custom" value="검색" onclick="mapsearch(); return false;"/><br/>
		<input type="hidden" id="loc" name="loc" /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input id="ploc" name="ploc" style="width:300px;" value="${page.ploc }" readonly /></label>
	 &nbsp; &nbsp;
	<div id="map" style="width:500px; height:400px;"></div>
	<input type="hidden" id="lat" name="lat" value="${lat }" />
	<input type="hidden" id="lng" name="lng" value="${lng }" />
	<input type="hidden" id="platlng" name="platlng" style="width:300px;" value="${page.platlng }"/>
	</label></p>
	<p><br/><label>●기간: &nbsp; &nbsp;<input id="pperiod" name="pperiod" value="${page.pdate }" style="width:300px;" /></label><br></p>
	<p>
		<label>●시작:&nbsp; &nbsp;
			<select id="pststart" name="pststart" style="width:300px;" onchange="">
				<option value="미정" ${"미정" == start ? 'selected' : "" }>미정</option>
				<c:forEach begin="0" end="23" var="s">
					<c:choose>
						<c:when test="${s <= 9}">
						<c:set value="0${s }:00" var="valKey1"/>
							<option value="0${s }" ${valKey1 == start ? 'selected' : ''}>0${s }:00</option>
						</c:when>
						<c:otherwise>
						<c:set value="${s }:00" var="valKey2"/>
							<option value="${s }" ${valKey2 == start ? 'selected' : ''}>${s }:00</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</label><br>
		<label>●종료:&nbsp; &nbsp;
			<select id="pstend" name="pstend" style="width:300px;" onchange>
				<option value="미정" ${'미정' == end ? 'selected' : "" }>미정</option>
				<c:forEach begin="0" end="23" var="e">
					<c:choose>
						<c:when test="${e <= 9}">
						<c:set value="0${e }:00" var="valKey1"/>
							<option value="${e }" ${valKey1 == end ? 'selected' : ''}>0${e }:00</option>
						</c:when>
						<c:otherwise>
						<c:set value="${e }:00" var="valKey2"/>
							<option value="${e }" ${valKey2 == end ? 'selected' : ''}>${e }:00</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</label>
	</p>
	<input type="hidden" id="pshowtime" name="pshowtime" value="" style="width:300px;"/>
	<div style="text-align: center">
	<br/><br/>
		<input class="btn btn-custom" type="button" value="수정" onclick="adminpage() " />
	</div>
</div>
</form:form>
<script src="<%=request.getContextPath()%>/js/adminMap.js?ver=11"></script>
</body>
</html>