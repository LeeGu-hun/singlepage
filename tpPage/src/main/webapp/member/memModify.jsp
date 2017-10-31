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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<form:form commandName="modifycmd" action="memModify">
	<p>
		<label>* 이메일:
		<form:input path="memail" value="<%=authInfo.getMemail() %>"/>
		<form:errors path="memail" />
		</label>
	</p>
	<p>
		<label>* 이름:
		<form:input path="mname" value="<%=authInfo.getMname() %>"/>
		<form:errors path="mname" />
		</label>
	</p>
	<p>
		<label>  폰번호:
		<%
		if(authInfo.getMphone() == null){
		%>
			<form:input path="mphone" disabled="true"/>
		<%
		} else {
		%>
			<form:input path="mphone" value="<%=authInfo.getMphone()%>"/>
		<%
		}
		%>
		<form:errors path="mphone" />
		</label>
	</p>
<p>*은 필수항목입니다.</p>

<input type="submit" value="수정완료">
</form:form>
</body>
</html>