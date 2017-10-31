<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css?ver=1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reveal.css?" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/left.js?ver=222"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.reveal.js?"></script>

<div style="margin: 50px auto; width: 200px; text-align: center">
	<div>
		<img src="profile.png" alt="프로필" width="" height="" />
	</div>
	<div>
		<br/>	
		<a href="#">${page.pnick }</a><br/><br/>
		<textarea readonly>${page.pintro }</textarea>
	</div>
	<div>
		<br/>
		<input type="hidden" name="pid" id="pid" value=${page.pid } />
		<input type="hidden" name="ppoint" id="ppoint" value=${page.ppoint } />
		<input type="hidden" name="mid" id="mid" value=${authInfo.mid } />
		<input type="hidden" name="memail" id="memail" value=${authInfo.memail } />
		<input type="hidden" name="ck" id="ck" value=${ck } />
		<c:choose>
			<c:when test="${ck == 0 || ck == null}">
			<a id="btnLike" class="btn btn-info btn-sm" href="#" onclick="like()">좋아요♡</a>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
			<a id="btnLike" class="btn btn-info btn-sm" href="#" onclick="like()">좋아요♥</a>&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
		<c:if test="${authInfo.mid != null}">
			<a data-toggle="modal" class="btn btn-info btn-sm" href="#myModal" onclick="donate()">후원</a>
		</c:if>
	</div>
	<div>
		<br/>
		<c:if test="${authInfo.pid == page.pid }">
			<a class="btn btn-info btn-sm" href="./modify">관리</a>&nbsp;&nbsp;
		</c:if>
	</div>
</div>

