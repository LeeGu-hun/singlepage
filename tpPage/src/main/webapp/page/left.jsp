<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/left.css?ver=1" />
<script src="<%=request.getContextPath()%>/js/left.js?ver=1"></script>

<div style="margin: 50px auto; width: 200px; text-align: center">
	<div>
		<img src="profile.png" alt="프로필" width="" height="" />
	</div>
	<div>
		<textarea>자기소개</textarea>
	</div>
	<div>
		<a class="btn btn-info btn-sm" href="<c:url value='' />">좋아요</a>&nbsp;&nbsp;
		<button type="button" class="js-open  open-button">후원</button>

	</div>
	<div>
		<a class="btn btn-info btn-sm" href="<c:url value='' />">수정</a>&nbsp;&nbsp;
	</div>
</div>

<div class="js-layer  layer  hidden">
	<label>후원금액</label><br /> 
	
	<input id="oneth" type="radio" name="money" value="one" /> 
	<label for="oneth">1000원</label> 
	
	<input id="thrth" type="radio" name="money" value="three" /> 
	<label for="thrth">3000원</label>
	
	<input id="fivth" type="radio" name="money" value="five" /> 
	<label for="fivth">5000원</label><br /> 
	
	<input id="tenth" type="radio" name="money" value="ten" /> 
	<label for="tenth">10000원</label> 
	
	<input id="in" type="radio" name="money" value="in" /> 
	<label for="in">직접입력</label>
	<input id="in_money" type="text" name="in_money" /><label>원</label>
</div>