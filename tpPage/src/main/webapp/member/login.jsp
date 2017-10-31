<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<form:form commandName="logincmd" action="memberLogin">
	<p>
		<label>email:<br>
			<form:input path="memail" />
		</label>
	</p>
	<p>
		<label>PW:<br>
			<form:password path="mpw" />
		</label>
	</p>
	<form:hidden path="nowpid" value="${nowpid }" />
	<input type="submit" value="로그인">
	</form:form>
</body>
</html>