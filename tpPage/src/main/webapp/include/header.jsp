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

<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=118"></script>

<div id="header">
<div class="container" style="padding: 5px; height:130px; min-width:1200px">
<c:if test="${empty authInfo }">
<div class="col-xs-4">
<a href="/tpPage/home"><img src="/tpPage/logo.png"></a>
</div>
<div class="col-xs-4">
</div>
<div class="col-xs-4" align="right">
<form:form commandName="logincmd" action="/tpPage/login" style="margin:0px">
<form:input path="memail" placeholder="email" class="form-control" style="width:300px"/>
<form:password path="mpw" placeholder="password" class="form-control" style="width:300px"/>
<a href="/tpPage/join" class="btn btn-custom" style="width:119px">회원가입</a>
<input type="submit" class="btn btn-custom" style="width:119px" value="로그인" />
<c:choose>
	<c:when test="${! empty cookie.remember.value }">
		<label id="rmbhl" class="btn btn-custom sel"><form:checkbox path="rememberMemail"/>기억</label>
	</c:when>
	<c:otherwise>
		<label id="rmbhl" class="btn btn-custom unchecked"><form:checkbox path="rememberMemail"/>기억</label>
	</c:otherwise>
</c:choose>
<c:if test="${nowpid != null }">
<form:hidden path="nowpid" value="${nowpid }"/>
</c:if>
</form:form>
</div>
</c:if>

<c:if test="${!empty authInfo }">
<div class="col-xs-4">
<a href="/tpPage/home"><img src="/tpPage/logo.png"></a>
</div>
<div class="col-xs-4">
</div>
<div class="col-xs-4" align="right">
<div align="center" class="form-control" style="width:300px"><label><c:out value="${authInfo.mname }" />님, 환영합니다.</label></div>
<form:form commandName="logincmd" action="/tpPage/logout" style="margin:0px">
<c:if test="${nowpid != null }">
<form:hidden path="nowpid" value="${nowpid }"/>
</c:if>
<a href="/tpPage/meminfo" class="btn btn-custom" style="width:148px">회원 정보</a>
<input type="submit" class="btn btn-custom" style="width:148px" value="로그아웃">
</form:form>
<c:choose>
	<c:when test="${authInfo.pid == 0 }">
		<a href="/tpPage/pagemaker" class="btn btn-custom" style="margin:5px 0px 5px 0px; width:300px">page 만들기</a>
	</c:when>
	<c:otherwise>
		<a href="/tpPage/page/${authInfo.pid }" class="btn btn-custom" style="margin:5px 0px 5px 0px; width:300px">내 page 이동</a>
	</c:otherwise>
</c:choose>
</div>
</c:if>
</div>

<div style="background-color: black; width: 100%;">
<div class="container menubar">
<%@ include file="./menubar.jsp" %>
</div>
</div>
</div>