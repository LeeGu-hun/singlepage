<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<label>로그인 되었다.</label>
</c:if>

</div>