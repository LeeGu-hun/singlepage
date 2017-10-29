<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
</head>
<body>
<form:form commandName="infocmd" action="memInfo">
	<p>
		* 이메일:<%=authInfo.getMemail() %>
	</p>
	<p>
		* 이름:<%=authInfo.getMname() %>
	</p>
	<p>
		폰번호:<%=authInfo.getMphone() %>
	</p>
<a href="./modify" class="btn btn-primary">회원정보수정</a>
<a href="./changeMpw" class="btn btn-primary">비밀번호 변경</a>
</form:form>
</body>
</html>