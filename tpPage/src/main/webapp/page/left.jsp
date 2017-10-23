<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css?ver=1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reveal.css?" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/left.js?ver=3223"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.reveal.js?"></script>

<div style="margin: 50px auto; width: 200px; text-align: center">
	<div>
		<img src="profile.png" alt="프로필" width="" height="" />
	</div>
	<div>
		<br/>	
		<a href="#">페이지 이름</a><br/><br/>
		<textarea>페이지 소개</textarea>
	</div>
	<div>
		<br/>
		<a id="btnLike" class="btn btn-info btn-sm" href="<c:url value='' />" onclick="like(this)">좋아요♡</a>&nbsp;&nbsp;
		<a class="btn btn-info btn-sm" href="#" data-reveal-id="myModal" data-animation="none" onclick="donate()">후원</a>

	</div>
	<div>
		<br/>
		<a class="btn btn-info btn-sm" href="<c:url value='modify'/>">수정</a>&nbsp;&nbsp;
	</div>
</div>

