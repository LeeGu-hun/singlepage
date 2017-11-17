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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/autosize.js?"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLAIN</title>
</head>
<body>

<%@ include file="/include/header.jsp"%>

<div class="container" align="center" id="mainbox">
<div class="alldiv">
<form:form commandName="modifycmd" action="memModify">
	<h2 align="center">
		<b>회원정보수정</b>
	</h2>
	<hr />
	<p>
		<form:input path="memail" placeholder="이메일" class="form-control" style="width:200px"/>
		<form:errors path="memail" />
	</p>
	<p>
		<form:input path="mname" placeholder="이름" class="form-control" style="width:200px"/>
		<form:errors path="mname" />
	</p>
	<c:if test="${authInfo.mphone != null }">
	<p>
		<form:input path="mphone" placeholder="폰번호" class="form-control" style="width:200px"/>
		<form:errors path="mphone" />
	</p>
	</c:if>
<hr />
<p>
<input type="submit" value="수정완료" class="btn btn-custom">
<a href="/tpPage/meminfo" class="btn btn-custom">뒤로</a>
</p>
</form:form>
</div>
</div>

<%@ include file="/include/footer.jsp"%>
</body>
</html>