<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>


<div id="header">

<c:if test="${empty authInfo }">
<a href="./home" class="btn btn-primary">home</a>
<a href="./page" class="btn btn-primary">page</a>
<a href="./join" class="btn btn-primary">회원가입</a>
<a href="./login" class="btn btn-primary">로그인</a>
</c:if>
<c:if test="${!empty authInfo }">
<a href="./home" class="btn btn-primary">home</a>
<a href="./page" class="btn btn-primary">page</a>
<a href="./join" class="btn btn-primary">회원가입</a>
<a href="./logout" class="btn btn-primary">로그아웃</a>
<%
	if(authInfo.getPid() == 0) {
%>
<a href="#" class="btn btn-primary">page 만들기</a>
<%
	} else {
%>		
<a href="#" class="btn btn-primary">내 page 이동</a>		
<%
	}
%>

<label><%=authInfo.getMemail() %> 로그인 - 페이지아이디 : <%=authInfo.getPid() %></label>
</c:if>

</div>