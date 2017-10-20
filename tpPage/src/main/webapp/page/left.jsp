<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css?ver=1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reveal.css?" />
<%-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.reveal.js?"></script> --%>

<div style="margin: 50px auto; width: 200px; text-align: center">
	<div>
		<img src="profile.png" alt="프로필" width="" height="" />
	</div>
	<div>
		<textarea>자기소개</textarea>
	</div>
	<div>
		<a class="btn btn-info btn-sm" href="<c:url value='' />">좋아요</a>&nbsp;&nbsp;
		<a class="btn btn-info btn-sm" href="#" data-reveal-id="myModal" data-animation="none" onclick="donate()">후원</a>

	</div>
	<div>
		<a class="btn btn-info btn-sm" href="<c:url value='' />">수정</a>&nbsp;&nbsp;
	</div>
</div>

