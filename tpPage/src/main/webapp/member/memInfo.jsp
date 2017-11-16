<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/memInfo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=118"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLAIN</title>
</head>
<body>

	<%@ include file="/include/header.jsp"%>
	<div class="container" style="padding-top: 100px;">
		<div class="alldiv">
			<h2 align="center">
				<b>My Info</b>
			</h2>
			<hr>
			<c:if test="${!empty authInfo }">

				<p>
					<label>● 이메일 : <%=authInfo.getMemail()%></label>
				</p>
				<p>
					<label>● 이름 : <%=authInfo.getMname()%></label>
				</p>
				<p>
					<label>● 폰번호 : <%=authInfo.getMphone()%></label>
				</p>
				<c:if test="${ authInfo.getMcheck() == 0 }">
					<p>
						<label>● 포인트 : <%=authInfo.getMpoint()%></label>
						<a data-toggle="modal" class="btn btn-custom btn-xs" href="#mcheckcmd">본인 인증</a>
					</p>
					<div class="modal" id="mcheckcmd" aria-hidden="true" style="display: none; z-index: 1080;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="chTitle" class="modal-title">본인인증</h4>
								</div>
								<div class="container"></div>
								<div id="ctxtModal" class="modal-body">
									<div id='mchkTxt' style="text-align: center;" class="form-inline">
										<p>
											<input type='text' id='email' name='email' class="form-control" placeholder="이메일" />
										</p>
										<p>
											<input type='password' id='pass' name='pass' class="form-control" placeholder="비밀번호" />
										</p>
										<p>
											<input type='text' id='phone' name='phone' class="form-control" placeholder="핸드폰 번호" />
										</p>
									</div>
								</div>
								<div id="cbtnModal" class="modal-footer">
									<a href='#' class='btn btn-custom' onclick='mcheckgo()'>본인 인증</a>
									<a href='#' data-dismiss='modal' class='btn'>취소</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${ authInfo.getMcheck() == 1 }">
					<p>
						<label>● 포인트 : <%=authInfo.getMpoint()%></label>
						<a data-toggle="modal" class="btn btn-custom btn-xs" href="#pointchargecmd" onclick="chargeInit()">포인트 충전</a>
					</p>

					<div class="modal" id="pointchargecmd" aria-hidden="true" style="display: none; z-index: 1060;">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title">포인트 충전</h4>
								</div>
								<div class="modal-body">
									<div onchange="charge()" style="text-align: left;" class="form-inline">
										<label>충전금액</label><br />
										<input id="coneth" type="radio" name="chmoney" value="1000" />
										<label for="coneth">1000원</label>&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="cthrth" type="radio" name="chmoney" value="3000" />
										<label for="cthrth">3000원</label>&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="cfivth" type="radio" name="chmoney" value="5000" />
										<label for="cfivth">5000원</label><br />
										<input id="ctenth" type="radio" name="chmoney" value="10000" />
										<label for="ctenth">10000원</label>&nbsp;&nbsp;
										<input id="cin" type="radio" name="chmoney" value="cin" /> 
										<label for="cin">직접입력</label>
										<input onkeydown="cin_charge(this)" class="form-control" style="width:100px" id="cin_money" type="text" name="cin_money" disabled /> <label>원</label>
									</div>

									<div style="text-align: right">
									<div class="form-inline">
										<label>보유 포인트</label>
										<input type="text" id="hmoney" class="form-control" name="hmoney" value="" readonly />원<br />
									</div>
									<div class="form-inline">
										<label>+ 충전 포인트</label>
										<input type="text" id="ccmoney" class="form-control" name="ccmoney" value="" readonly />원<br />
									</div>
									<div class="form-inline">
										 <label>= 예상 포인트</label>
										 <input type="text" id="camoney" class="form-control" name="camoney" value="" readonly />원<br /> 
									</div>
										<input type="hidden" id="mcheck" name="mcheck" class="form-control"value="${authInfo.mcheck }" />
									</div>
								</div>
								<div class="modal-footer">
									<a href="#" data-dismiss="modal" class="btn" onclick="chargeInit()">취소</a>
									<a data-toggle="modal" href="#finishcmd" class="btn btn-custom" onclick="chargeCheck()">충전하기</a>
								</div>
							</div>
						</div>
					</div>

					<div class="modal" id="finishcmd" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="chTitle" class="modal-title"></h4>
								</div>
								<div class="container"></div>
								<div id="ctxtModal" class="modal-body"></div>
								<div id="cbtnModal" class="modal-footer"></div>
							</div>
						</div>
					</div>
				</c:if>
				<a href="./memmodifier" class="btn btn-custom">회원정보수정</a>
				<a href="./mpwchange" class="btn btn-custom">비밀번호 변경</a>
				<br>
				<br>
				<a data-toggle="modal" class="btn btn-danger" onclick="memberdrop()">회원탈퇴</a>


				<div class="modal" id="memberdrop" aria-hidden="true" style="display: none; z-index: 1050;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title">회원탈퇴</h4>
							</div>
							<div class="container"></div>
							<div class="modal-body">
								<form:form commandName="memberdropcmd" action="/tpPage/memberdrop">
									<p>
										<label><form:hidden path="memail" value="${authInfo.memail }" />
										<form:password path="mpw" placeholder="비밀번호 입력하세요" class="form-control" />
										</label>
									</p>
								</form:form>
							</div>
							<div class="modal-footer">
								<a href="#" id="memdpbtn" class="btn btn-danger">회원탈퇴</a>
								<a href="#" data-dismiss="modal" class="btn">취소</a>
							</div>
						</div>
					</div>
				</div>

				<div class="modal" id="memberdropchk" aria-hidden="true" style="display: none; z-index: 1060;">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title">탈퇴하시겠습니까?</h4>
							</div>
							<div class="container"></div>
							<div class="modal-body">
								<a id="memdpgobtn">탈퇴</a> <a href="#" data-dismiss="modal" class="btn">아니오</a>
							</div>
							<div class="modal-footer">
								<a href="#" data-dismiss="modal" class="btn">Close</a>
							</div>
						</div>
					</div>
				</div>

			</c:if>
		</div>
	</div>

	<input type="hidden" id="memail" value="${authInfo.memail }" />
	<input type="hidden" id="ck" value="${ck }" />
	<input type="hidden" id="mid" value="${authInfo.mid }" />
	<input type="hidden" id="mpoint" value="${authInfo.mpoint }" />
	<input type="hidden" id="ppoint" value=${page.ppoint } />
	<input type="hidden" id="pid" value=${page.pid } />


</body>
</html>