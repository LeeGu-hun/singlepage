<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<h2 align="center">
		<b>비밀번호수정</b>
	</h2>
	<hr>
	<form:form commandName="mpwcmd" action="mpwchange">
		<p>
			<form:input path="mpw" placeholder="현재 비밀번호" class="form-control" style="width:200px"/>
		</p>
		<p>
			<form:input path="newmpw" placeholder="새 비밀번호" class="form-control" style="width:200px"/>
		</p>
		<p>
			<form:input path="newmpwconf" placeholder="새 비밀번호 확인" class="form-control" style="width:200px"/>
		</p>
		<input type="submit" value="변경하기" class="btn btn-custom">
		<a href="/tpPage/meminfo" class="btn btn-custom">뒤로</a>
	</form:form>
</div>
</div>		
</body>
</html>