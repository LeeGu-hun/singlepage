<%@page import="member.AuthInfo"%>
<%@page import="member.MemberCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>
<%-- <%
	int success = (int)request.getSession().getAttribute("success");
%> --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />
<style>
a {
 cursor:pointer;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=118"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js?"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<input type="hidden" id="memail" value="${authInfo.memail }"/>
<input type="hidden" id="ck" value="${ck }"/>
<input type="hidden" id="mid" value="${authInfo.mid }"/>
<input type="hidden" id="mpoint" value="${authInfo.mpoint }"/>
<input type="hidden" id="ppoint" value=${page.ppoint } />
<input type="hidden" id="pid" value=${page.pid } />

<div class="container" style="text-align: center;">
<a href="/tpPage/home"><img src="/tpPage/logo.png" style="margin-top:100px;"></a>

<c:if test="${empty authInfo }">
	<form:form commandName="logincmd" action="login" style="margin-top:100px;" cssClass="form-inline">
		<p><form:input path="memail" cssClass="form-control"  placeholder="이메일" /></p>
		<p><form:password path="mpw" cssClass="form-control"  placeholder="비밀번호" /></p>
		<form:hidden path="nowpid" value="${nowpid }" />
		<p><input type="submit" value="로그인" class="btn btn-custom"></p>
		<c:if test="${ mmval == 0 || mmval == 1 || mmval == 2 }">
			<a href="./membermanager" >회원가입</a><br>
			<!-- <a href=#>비밀번호 찾기</a> -->
		</c:if>	
	</form:form>
	<p></p>

	<%-- <c:if test="${ mmval != 0 && mmval != 1 && mmval != 2 }"> --%>
		<form:form commandName="joincmd" action="memberJoin" cssClass="form-inline">
			<p>
				<form:input path="memail" cssClass="form-control" placeholder="이메일" cssErrorClass="has-error"/>
				<form:errors path="memail" class="msg" element="div" />
			</p>
			<p>
				<form:input path="mname" cssClass="form-control" placeholder="이름" cssErrorClass="has-error"/>
				<form:errors path="mname" class="msg" element="div" />
			</p>
			<p>
				<form:password path="mpw" cssClass="form-control" placeholder="비밀번호" cssErrorClass="has-error"/>
				<form:errors path="mpw" class="msg" element="div" />
			</p>
			<p>
				<form:password path="mpwconf" cssClass="form-control" placeholder="비밀번호 재입력" cssErrorClass="has-error"/>
				<form:errors path="mpwconf" class="msg" element="div" />
			</p>
			<p class="checkbox"><label><form:checkbox path="rememberMemail" /> 이메일 기억</label></p>
			<p>아래 가입완료 버튼을 클릭하면 약관에 동의한 것으로 취급합니다.</p>
			<input type="submit" value="가입 완료" class="btn btn-custom">
		</form:form>
	<%-- </c:if> --%>
</c:if>


<!-- 로그인 전후 -->

	
</div> 
<!-- 메인 컨테이너 끝 -->
</body>
</html>