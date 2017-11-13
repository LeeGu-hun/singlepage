<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<%
	AuthInfo authinfo = (AuthInfo) request.getSession().getAttribute("authInfo"); 
	if(authinfo == null) {
%>

<script type="text/javascript">
	location.href="/tpPage/login";
</script>

<%
	}
%>