<%@page import="member.AuthInfo"%>
<%@page import="member.MemberCommand"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty authInfo }">
	<form:form commandName="logincmd" action="login">
		<p>
			<label>email:<br>
				<form:input path="memail" />
			</label>
		</p>
		<p>
			<label>PW:<br>
				<form:password path="mpw" />
			</label>
		</p>
		<form:hidden path="nowpid" value="${nowpid }" />
		<input type="submit" value="로그인">
		<c:if test="${ mmval == 0 || mmval == 1 || mmval == 2 }">
			<a href="./membermanager" >회원가입</a><br>
			<!-- <a href=#>비밀번호 찾기</a> -->
		</c:if>	
	</form:form>
	<p></p>

	<%-- <c:if test="${ mmval != 0 && mmval != 1 && mmval != 2 }"> --%>
		<form:form commandName="joincmd" action="memberJoin">
			<p>
				<label>이멜:<br>
				<form:input path="memail" />
				<form:errors path="memail" />
				</label>
			</p>
			<p>
				<label>이름:<br>
				<form:input path="mname" />
				<form:errors path="mname" />
				</label>
			</p>
			<p>
				<label>비밀번호:<br>
				<form:password path="mpw" />
				<form:errors path="mpw" />
				</label>
			</p>
			<p>
				<label>비밀번호 확인:<br>
				<form:password path="mpwconf" />
				<form:errors path="mpwconf" />
				</label>
			</p>
			<p><label><form:checkbox path="rememberMemail"/>e메일기억</label></p>
			<p>가입하면 약관은 자동동의</p>
			<input type="submit" value="가입 완료">
		</form:form>
	<%-- </c:if> --%>
</c:if>

<!-- 로그인 전후 -->

<c:if test="${! empty authInfo }">	
	<form:form commandName="infocmd" action="memInfo">
		<p>
			* 이메일:<%=authInfo.getMemail() %>
		</p>
		<p>
			* 이름:<%=authInfo.getMname() %>
		</p>
		<p>
			* 폰번호:<%=authInfo.getMphone() %>
		</p>
	<c:if test="${ authInfo.getMcheck() == 0 }">
		<p>
			* 포인트:<%=authInfo.getMpoint() %>
			<a href="#" class="btn btn-primary">본인인증하기</a>
		</p>
		<p>
			* 본인인증:<%=authInfo.getMcheck() %>
		</p>
	</c:if>		
	<c:if test="${ authInfo.getMcheck() == 1 }">
		<p>
			* 포인트:<%=authInfo.getMpoint() %>
		</p>
		<p>
			* 본인인증:<%=authInfo.getMcheck() %>
			<a href="#" class="btn btn-primary">포인트 충전</a>
		</p>
	</c:if>		
		<a href="./memmodifier" class="btn btn-primary">회원정보수정</a>
		<a href="./mpwchange" class="btn btn-primary">비밀번호 변경</a><br><br>
		<a href="./home" class="btn btn-primary">홈으로 가기</a>
	</form:form>
</c:if>
</body>
</html>