<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입 성공</title>
</head>
<body>
	<p><strong>${registerRequest.name}님</strong>회원가입완료</p>
	<p><a href="<c:url value='./home'/>">[메인]</a></p>
</body>
</html>