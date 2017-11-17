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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/headerfooter.css?ver=1" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=99"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/autosize.js?"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLAIN</title>
</head>
<body>
<div class="container" style="text-align: center;" id=mainbox>
<a href="/tpPage/home"><img src="/tpPage/logo.png" style="margin-top:75px;"></a>

	<c:if test="${empty authInfo }">
		<form:form commandName="logincmd" action="login" style="margin-top:75px;" class="form-inline">
			<p>
				<form:input path="memail" class="form-control" placeholder="이메일" cssErrorClass="has-error" />
				<form:errors path="memail" class="msg" element="div"/>
			</p>
			<p>
				<form:password path="mpw" class="form-control" placeholder="비밀번호" cssErrorClass="has-error" />
				<form:errors path="mpw" class="msg" element="div"/>
			</p>
			<form:hidden path="nowpid" value="${nowpid }" />
			<p>
			<input type="submit" value="로그인" class="btn btn-custom" style="width:142px" />
			<c:choose>
				<c:when test="${! empty cookie.remember.value }">
					<label id="rmbhl" class="btn btn-custom sel"><form:checkbox path="rememberMemail"/>기억</label>
				</c:when>
				<c:otherwise>
					<label id="rmbhl" class="btn btn-custom unchecked"><form:checkbox path="rememberMemail"/>기억</label>
				</c:otherwise>
			</c:choose>
			</p>
			<hr style="margin: 50px 200px; border-color: black;"  />
			<p>
			<a href="./join" class="btn btn-custom" style="width:200px">회원가입</a>
			</p>
		</form:form>
	</c:if>
</div>

<%@ include file="/include/footer.jsp" %>	
</body>
</html>