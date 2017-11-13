<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
	if(authInfo != null) {
%>

<script type="text/javascript">
	location.href="/tpPage/home";
</script>

<%
	}
%>