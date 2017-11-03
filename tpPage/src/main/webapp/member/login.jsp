<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function mpwfinder() {
		$.ajax({
			type : "POST",
			url : "./mpwfinder",
			success : mpwfinderR
		});
	}
	function mpwfinderR(msg) {
		$('#mpwfinderR').html(msg)
	}
	
	function mpwfmodal() {
		var fmemail = $('#mpwfmemail').val()
		$('#mpwrmemail').val(fmemail);
		console.log('123');
		
		$('#mpwfindcmd').ajaxForm({
			success:function() {
				$('#mpwfmodal').modal('show');
			}	
		});
	}
</script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<c:if test="${empty authInfo }">
		<form:form commandName="logincmd" action="login">
			<p>
				<label>email:<br> <form:input path="memail" />
				</label>
			</p>
			<p>
				<label>PW:<br> <form:password path="mpw" />
				</label>
			</p>
			<form:hidden path="nowpid" value="${nowpid }" />
			<input type="submit" value="로그인">
			<br>
			<br>
			<a href="./join">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="비번찾기" onclick="mpwfinder(); " /><br><br>
		</form:form>
	</c:if>
	
	<div id="mpwfinderR" name="mpwfinderR"></div>
	
	<div id="mpwfmodalR" name="mpwfmodalR"></div>
	
	<div class="modal" id="mpwfmodal" aria-hidden="true" style="display: none; z-index: 500;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">비번 재설정</h4>
				</div>
				<div class="container"></div>
					<form:form commandName="mpwresetcmd" action="mpwreset">
				<div class="modal-body">
						<p>
							<label> <form:password path="newmpw" placeholder="새 비밀번호 입력" />
							</label>
						</p>
						<p>
							<label> <form:password path="newmpwconf" placeholder="새 비밀번호 다시 입력" />
							</label>
						</p>
						<form:hidden path="mpwrmemail" />
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="비번 재설정">
					<a href="" data-dismiss="modal" class="btn">닫기</a>
				</div>
					</form:form>
			</div>
		</div>
	</div>
</body>
</html>