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
<a href="./memManager" class="btn btn-primary">회원정보수정</a>
<a href="./mpwchanger" class="btn btn-primary">비밀번호 변경</a><br><br>
<a href="./home" class="btn btn-primary">홈으로 가기</a>
</form:form>
</body>
</html>