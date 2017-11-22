<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% pageContext.setAttribute("renewLine", "\n"); %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css?ver=1" />

<script src="https://use.fontawesome.com/61742f8eee.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/left.js?ver=112"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>

<div style="margin: 50px auto; width: 200px; text-align: center">
	<div>
		<c:choose>
			<c:when test="${page.profile=='yes'}">
				<img src="/tpPage/puploads/${page.pnewfile }" alt="프로필사진" width="200px" height="200px" />
			</c:when>
			<c:otherwise>
				<img src="/tpPage/profile.png" alt="프로필" width="150px" height="150px" />
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<br/>	
		<a style="font-size: 23px; color: black">${page.pnick }</a>
		
		<div>
			<br/>
			<input type="hidden" name="pid" id="pid" value="${page.pid }" />
			<input type="hidden" name="ppoint" id="ppoint" value="${page.ppoint }" />
			<input type="hidden" name="mid" id="mid" value="${authInfo.mid }" />
			<input type="hidden" name="memail" id="memail" value="${authInfo.memail }" />
			<input type="hidden" name="mpoint" id="mpoint" value="${authInfo.mpoint }" />
			<input type="hidden" name="ck" id="ck" value="${ck }" />
			<c:choose>
				<c:when test="${ck == 0 || ck == null}">
					<a id="btnLike" class="btn btn-custom" style="width: 96px" onclick="like()">좋아요   <i class="fa fa-heart-o fa-lg" aria-hidden="true"></i></a>&nbsp;
				</c:when>
				<c:otherwise>
					<a id="btnLike" class="btn btn-custom" style="width: 96px" onclick="like()">좋아요   <i class="fa fa-heart fa-lg" aria-hidden="true"></i></a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:if test="${authInfo.mid != null}">
				<a data-toggle="modal" class="btn btn-custom" href="#myModal" style="width: 93px" onclick="donate()">후원   <i class="fa fa-credit-card-alt fa-lg" aria-hidden="true"></i></a>
			</c:if>
		</div>
		<label id="likettl"><c:out value="${cnt }"></c:out>명이 좋아합니다.</label>
		<br>
		<div class="introText">
			<label style="font-size: 20px;">Intro</label><br>
			${fn:replace(page.pintro, newLineChar, "<br/>") }
		</div>
	</div>
	
	<div>
	<div class="form-control">
		<label>활동시간 <c:out value="${page.pshowtime }" /></label>
	</div>
	</div>
		<a class="btn btn-custom" style="width: 200px" onclick="openmapmodal(); ">위치정보</a>&nbsp;&nbsp;
		<input type="hidden" id="nowploc" value="${page.ploc }" />
		<input type="hidden" id="nowplatlng" value="${page.platlng }" />
	<div>
		<c:if test="${authInfo.pid == page.pid }">
			<a class="btn btn-custom" href="/tpPage/admin" style="width: 200px">관리</a>&nbsp;&nbsp;
		</c:if>
	</div>
</div>

