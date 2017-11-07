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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/member.js?ver=118"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="memail" value="${authInfo.memail }"/>
<input type="hidden" id="ck" value="${ck }"/>
<input type="hidden" id="mid" value="${authInfo.mid }"/>
<input type="hidden" id="mpoint" value="${authInfo.mpoint }"/>
<input type="hidden" id="ppoint" value=${page.ppoint } />
<input type="hidden" id="pid" value=${page.pid } />

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
					<a data-toggle= "modal" class = "btn btn-info btn-sm" href="#mcheckcmd" >본인 인증</a>
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
								<div id='mchkTxt'> 
									<label>email:</label>
				            		<input type='text' id='email' name='email' /><br /> 
				            		<label>password:</label>
				            		<input type='password' id='pass' name='pass' /><br /> 
				            		<label>phone:</label>
									<input type='text' id='phone' name='phone' /><br /></div>
								</div>
								<div id="cbtnModal" class="modal-footer">
								<a href='#' class='btn' onclick='mcheckgo()'>본인 인증</a> 
								<a href='#' data-dismiss='modal' class='btn'>취소</a>
							</div>
						</div>
					</div>
				</div>
		<p>
			* 본인인증:<%=authInfo.getMcheck()%>
		</p>
	</c:if>		
	<c:if test="${ authInfo.getMcheck() == 1 }">
		<p>
			* 포인트:<%=authInfo.getMpoint() %>
		</p>
		<p>
			* 본인인증:<%=authInfo.getMcheck() %>
			<a data-toggle="modal" class="btn btn-info btn-sm" href="#pointchargecmd" onclick="chargeInit()">포인트 충전</a>
		</p>
				<div class="modal" id="pointchargecmd" aria-hidden="true" style="display: none; z-index: 1060;">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title">포인트 충전</h4>
							</div>
							<div class="container"></div>
							<div class="modal-body">
								<label>충전금액</label><br />
								<div onchange="charge()">
									<input id="coneth" type="radio" name="chmoney" value="1000" />
									<label for="coneth">1000원</label>
									<input id="cthrth" type="radio" name="chmoney" value="3000" />
									<label for="cthrth">3000원</label>
									<input id="cfivth" type="radio" name="chmoney" value="5000" />
									<label for="cfivth">5000원</label><br />
									<input id="ctenth" type="radio" name="chmoney" value="10000" />
									<label for="ctenth">10000원</label>
									<input id="cin" type="radio"name="chmoney" value="cin" />
									<label for="cin">직접입력</label>
									<input onkeydown="cin_charge(this)" id="cin_money" type="text" name="cin_money" disabled />
									<label>원</label>
								</div>

								<div style="text-align: right">
									<label for="ccurrent_money">보유 포인트</label>
									<input type="text" id="hmoney" name="hmoney" value="" readonly />원<br />
									<label for="charge_money">+ 충전 포인트</label>
									<input type="text" id="ccmoney" name="ccmoney" value="" readonly />원<br />
									<label for="cafter_money">= 예상 포인트</label>
									<input type="text" id="camoney" name="camoney" value="" readonly />원<br />
									<input type="hidden" id="mcheck" name="mcheck" value="${authInfo.mcheck }" />
								</div>
							</div>
							<div class="modal-footer">
								<a href="#" data-dismiss="modal" class="btn" onclick="chargeInit()">취소</a>
								<a data-toggle="modal" href="#finishcmd" class="btn btn-primary" onclick="chargeCheck()">충전하기</a>
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
		<a href="./memmodifier" class="btn btn-primary">회원정보수정</a>
		<a href="./mpwchange" class="btn btn-primary">비밀번호 변경</a><br><br>
		<a href="./home" class="btn btn-primary">홈으로 가기</a>
	</form:form>
</c:if>


</body>
</html>