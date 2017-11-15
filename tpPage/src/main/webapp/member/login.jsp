<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=99"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<div class="container" style="text-align: center;">
<a href="/tpPage/home"><img src="/tpPage/logo.png" style="margin-top:100px;"></a>

	<c:if test="${empty authInfo }">
		<form:form commandName="logincmd" action="login" style="margin-top:100px;" class="form-inline">
			<p>
				<form:input path="memail" class="form-control" placeholder="이메일" />
			</p>
			<p>
				<form:password path="mpw" class="form-control" placeholder="비밀번호" />
			</p>
			<form:hidden path="nowpid" value="${nowpid }" />
			<p><input type="submit" value="로그인" class="btn btn-custom"></p>
			<p><input type="button" value="비밀번호 찾기" onclick="mpwfinder(); " class="btn btn-custom" /></p>
			<p><a href="./join" class="btn btn-custom" >회원가입</a><br></p>
		</form:form>
	</c:if>
	
	<div id="mpwfinderR" name="mpwfinderR"></div>
	
	<!-- <div id="mpwfmodalR" name="mpwfmodalR"></div> -->
	
	<div class="modal" id="mpwfmodal" aria-hidden="true" style="display: none; z-index: 500;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">비번 재설정</h4>
				</div>
				<div class="container"></div>
					<form:form commandName="mpwresetcmd" action="mpwreset">
				<div class="modal-body">
						<p>
							<label> <form:password path="newmpw" placeholder="새 비밀번호 입력" />
							</label>
						</p>
						<p>
							<label> <form:password path="newmpwconf" placeholder="새 비밀번호 다시 입력" />
							</label>
						</p>
						<form:hidden path="mpwrmemail" />
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="비번 재설정">
					<a href="" data-dismiss="modal" class="btn">닫기</a>
				</div>
					</form:form>
			</div>
		</div>
	</div>

</div>	
</body>
</html>