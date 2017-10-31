<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>

<div id="header">
<c:if test="${empty authInfo }">

<form:form commandName="logincmd" action="memberLogin">
<p>
<a href="./home" class="btn btn-primary">home</a>
<a href="./membermanager" class="btn btn-primary">회원가입+로그인</a>
<form:input path="memail" placeholder="email"/>
<form:password path="mpw" placeholder="password"/>
<input type="submit" value="로그인" />
</p>
</form:form>

</c:if>

<c:if test="${!empty authInfo }">
<a href="./home" class="btn btn-primary">home</a>
<a href="./logout" class="btn btn-primary">로그아웃</a>
<a href="./membermanager" class="btn btn-primary">회원 정보</a>
<%
	if(authInfo.getPid() == 0) {
%>
<a href="./pagemaker" class="btn btn-primary">page 만들기</a>
<%
	} else {
%>		
<a href="./page?host=${authInfo.pid }" class="btn btn-primary">내 page 이동</a>		
<%
	}
%>

<label><%=authInfo.getMemail() %>님 환영합니다. 페이지 번호는 <%=authInfo.getPid() %>번입니다.</label>
</c:if>

</div>