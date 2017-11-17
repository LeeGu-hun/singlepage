<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/memInfo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLAIN</title>
</head>
<body>

<%@ include file="/include/header.jsp"%>

<div class="container" style="padding-top: 100px">
<div class="alldiv">
<form:form commandName="modifycmd" action="memModify">
	<h2 align="center">
		<b>회원정보수정</b>
	</h2>
	<hr />
	<p>
		<label>이메일
		<form:input path="memail" placeholder="${authInfo.memail }" class="form-control"/>
		<form:errors path="memail" />
		</label>
	</p>
	<p>
		<label>이름
		<form:input path="mname" placeholder="${authInfo.mname }" class="form-control"/>
		<form:errors path="mname" />
		</label>
	</p>
	<c:if test="${authInfo.mphone != null }">
	<p>
		<label>폰번호
			<form:input path="mphone" placeholder="${authInfo.mphone }" class="form-control"/>
		<form:errors path="mphone" />
		</label>
	</p>
	</c:if>

<input type="submit" value="수정완료" class="btn btn-custom">
<a href="/tpPage/meminfo" class="btn btn-custom">뒤로</a>
</form:form>
</div>
</div>
</body>
</html>