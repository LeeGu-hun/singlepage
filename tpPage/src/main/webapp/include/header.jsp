<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menubar.css?ver=33" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/headerfooter.css?ver=1" />

<div id="header">
<div class="container">
<c:if test="${empty authInfo }">
<form:form commandName="logincmd" action="/tpPage/login">
<div class="col-md-4" style="background: red">
<a href="/tpPage/home" class="btn btn-custom">home</a>
</div>
<div class="col-md-4">
</div>
<div class="col-md-4">
<form:input path="memail" placeholder="email"/>
<form:password path="mpw" placeholder="password"/>
<a href="/tpPage/join" class="btn btn-custom">회원가입</a>
<input type="submit" class="btn btn-custom" value="로그인" />
<c:if test="${nowpid != null }">
<form:hidden path="nowpid" value="${nowpid }"/>
</c:if>
<<<<<<< HEAD
</div>
=======
<input type="submit" value="로그인" class="btn btn-custom" />
</p>
>>>>>>> branch 'temp' of https://github.com/LeeGu-hun/singlepage.git
</form:form>
</c:if>
</div>

<c:if test="${!empty authInfo }">
<form:form commandName="logincmd" action="/tpPage/logout">
<a href="/tpPage/home" class="btn btn-custom">home</a>
<c:if test="${nowpid != null }">
<form:hidden path="nowpid" value="${nowpid }"/>
</c:if>
<input type="submit" class="btn btn-custom" value="로그아웃">
<a href="/tpPage/meminfo" class="btn btn-custom">회원 정보</a>
<c:choose>
	<c:when test="${authInfo.pid == 0 }">
		<a href="/tpPage/pagemaker" class="btn btn-custom">page 만들기</a>
	</c:when>
	<c:otherwise>
		<a href="/tpPage/page/${authInfo.pid }" class="btn btn-custom">내 page 이동</a>
	</c:otherwise>
</c:choose>
<label><%=authInfo.getMemail() %>님 환영합니다. 페이지 번호는 <%=authInfo.getPid() %>번입니다.</label>
</form:form>
</c:if>

<div style="background-color: black; width: 100%;">
<div class="container menubar">
<%@ include file="./menubar.jsp" %>
</div>
</div>
</div>