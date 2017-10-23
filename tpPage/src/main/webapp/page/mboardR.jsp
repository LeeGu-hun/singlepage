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
	location.href="./login";
</script>

<% 
	} else {
%>

member board
<form id="mboardform" name="mboardform" action="mbwrite" method="Post" enctype="multipart/form-data">
	<input type="text" id="mbsubject" name="mbsubject" />
	<br><textarea id="mbcontent" name="mbcontent"></textarea>
	<br><img id="mbuploadImg" name="mbuploadImg" />
	<br><input type="file" id="mbfile" name="mbfile" onchange="mbreadURL(this);" />
	<input type="hidden" id="mbupdir" name="mbupdir" value="<%=request.getRealPath("/buploads/mbuploads/")%>" />
	<input type="submit" value="등록" onclick="mbwrite();" />
</form>

<%
	}
%>