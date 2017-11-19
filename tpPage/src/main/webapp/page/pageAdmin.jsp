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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f637d5fa5f8a019e35446dc32b94a752&libraries=services"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<form:form commandName="pagecmd" name="apfrm" action="adminpage" enctype="multipart/form-data">
<div class="alldiv">
<h2 align="center"><b>Admin PLAIN</b></h2><hr>
	
	<label>●사진:&nbsp;&nbsp;&nbsp;</label>
		<div style="display:inline-table;border:1px solid #000; border-radius:4px; padding: 6px 12px; width:300px">
		<div class="radio">
		<c:if test="${page.profile == 'no'}">
			<label><input type="radio" id="no" name="reply" value="no" checked="checked" onclick="proImg(this.value, pfile)" />기본 프로필</label> &nbsp; &nbsp;
			<label><input type="radio" id="yes" name="reply" value="yes" onclick="proImg(this.value, pfile)" />프로필 지정</label>
			<!-- <input type="file" id="pfile" name="pfile" accept="image/gif, image/jpeg, image/png"  style="display: none" onchange="pagereadURL(this);" /> -->
		</c:if>
		<c:if test="${page.profile == 'yes'}">
			<label><input type="radio" id="no" name="reply" value="no" onclick="proImg(this.value, pfile)" />기본 프로필</label> &nbsp; &nbsp;
			<label><input type="radio" id="yes" name="reply" value="yes" checked="checked" onclick="proImg(this.value, pfile)" />프로필 지정</label>
			<!-- <input type="file" id="pfile" name="pfile" accept="image/gif, image/jpeg, image/png" onchange="pagereadURL(this);" /> -->
		</c:if>
		</div>
		<div style="text-align: center; padding-bottom:5px;" class="uploadImg">
			<c:if test="${page.profile == 'yes'}">
				<img id="puploadImg" name="puploadImg" src="/tpPage/puploads/${page.pnewfile }"  alt="프로필사진" width="200px" height="auto"/>
			</c:if>
			<c:if test="${page.profile == 'no' && page.pnewfile != null}">
				<img id="puploadImg" name="puploadImg" src="/tpPage/puploads/${page.pnewfile }" style="display: none" alt="프로필사진" width="200px" height="auto"/>
			</c:if>
			<c:if test="${page.profile == 'no' && page.pnewfile == null}">
				<img id="puploadImg" name="puploadImg" style="display: none" alt="프로필사진" width="200px" height="auto"/>
			</c:if>
		</div>
		<c:if test="${page.profile == 'no'}">
		<div class="form-inline" id="profile" style="display:none;"></div>
		</c:if>
		<c:if test="${page.profile == 'yes'}">
		<div class="form-inline" id="profile"></div>
		</c:if>
		<label class="btn btn-custom btn-sm filebox">
		<input id="pfile" name="pfile" type="file" accept="image/gif, image/jpeg, image/png" onchange="pagereadURL(this);" />파일 선택</label>
		<a class="btn btn-custom btn-sm btnRmv" style="margin-left:5px">삭제</a>
		<br><input type="text" class="form-control fname" style="width:auto;" value="파일 없음" disabled="disabled"></div>
	<input type="hidden" id="pupdir" name="pupdir" value="<%=request.getRealPath("/puploads/")%>" />


	<div class="form-inline"><label>●이름:&nbsp; &nbsp;
		<input class="form-control" id="pname" name="pname" style="width:300px; margin-top:15px;" value="${page.pname }" /><span id="pnamechk" class="msg">필수 입력 항목입니다.</span>
	</label></div>
	<div class="form-inline"><label>●닉넴:&nbsp; &nbsp;
		<input class="form-control" id="pnick" name="pnick" style="width:300px;" value="${page.pnick }" />
	</label></div>
	<div class="form-inline"><label>●소개:&nbsp; &nbsp;
		<textarea class="form-control" id="pintro" name="pintro">${page.pintro }</textarea>
	</label></div>
	<br>
	<div class="form-inline">
		<label>●구분</label><br>
		<label>&nbsp; -카테고리:&nbsp; &nbsp;
			<select class="form-control" id="pgcate" name="pgcate" style="width:265px;" >
				<c:forEach var="g" items="${genres }">
				<option value="${g}" ${genre == g ? 'selected' : ''}>${g}</option>
				</c:forEach>	
			</select></label>
	</div>
	<div class="form-inline">
		<label>&nbsp; -세부장르:&nbsp; &nbsp;
		<input class="form-control" type="text" id="pgdetail" name="pgdetail" style="width:265px;" value="${genreDetail }" onkeyup; onkeypress; onkeydown; /></label></div>
	<input type="hidden" id="pgenre" name="pgenre" style="width:300px;"/>
	<br>
	<div class="form-inline">
		<label>●지역:&nbsp; &nbsp;<input class="form-control" type="text" id="keyword" style="width:300px;"/> 
		<input type="button" class="btn btn-custom" value="검색" onclick="mapsearch(); return false;"/>
		<input type="hidden" id="loc" name="loc" /><br>
		 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<input class="form-control" id="ploc" name="ploc" style="width:300px;" value="${page.ploc }" readonly /></label>
	</div>
	<div id="map" style="width:500px; height:400px;"></div>
	<input type="hidden" id="lat" name="lat" value="${lat }" />
	<input type="hidden" id="lng" name="lng" value="${lng }" />
	<input type="hidden" id="platlng" name="platlng" style="width:300px;" value="${page.platlng }"/>
	
	<div class="form-inline"><br/><label>●기간: &nbsp; &nbsp;<input  class="form-control" id="pperiod" name="pperiod" value="${page.pdate }" style="width:300px;" /></label><br><br></div>
	<label>●활동시간</label><br>
	<div class="form-inline">
	<label>&nbsp; -시작:&nbsp; &nbsp;
		<select class="form-control" id="pststart" name="pststart" style="width:295px;" onchange="">
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
	</div>
	<div class="form-inline">
	<label>&nbsp; -종료:&nbsp; &nbsp;
		<select class="form-control" id="pstend" name="pstend" style="width:295px;" onchange>
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
	</div>
	<input type="hidden" id="pshowtime" name="pshowtime" value="" style="width:300px;"/>
	<div style="text-align: center">
		<hr />
		<input class="btn btn-custom" type="button" value="수정" onclick="adminpage() " />
	</div>
</div>
</form:form>
<script src="<%=request.getContextPath()%>/js/adminMap.js?ver=11"></script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>