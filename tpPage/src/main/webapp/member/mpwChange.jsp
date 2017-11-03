<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
	String mpw = (String) request.getAttribute("mpw");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<form:form commandName="mpwcmd" action="mpwchange">
		<p>
			<label>현재 비밀번호
				<form:input path="mpw" />
			</label>
		</p>
		<p>
			<label>새 비밀번호
				<form:input path="newmpw" />
			</label>
		</p>
		<p>
			<label>새 비밀번호 확인
				<form:input path="newmpwconf" />
			</label>
		</p>
		<input type="submit" value="변경하기">
	</form:form>
</body>
</html>