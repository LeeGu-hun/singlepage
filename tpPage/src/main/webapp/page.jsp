<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/page_style.css?ver=3" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=33" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/autosize.js?ver=3"></script>
<<<<<<< HEAD
<script src="<%=request.getContextPath()%>/js/mbajax.js?ver=3422222325"></script>
=======
<script type="text/javascript" src="<%=request.getContextPath()%>/js/left.js?ver=5544"></script>
>>>>>>> branch 'temp' of https://github.com/LeeGu-hun/singlepage.git

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SinglePage</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<div id="pagemainbox">
	<div id ="pagecontentbox">
		<div id="pageleftbox">
			<%@ include file="/page/left.jsp" %>
		</div>
		<div id="pagecenterbox">
			<div style="border-bottom:1px solid black;">
				<%@ include file="/page/top.jsp" %>
			</div>
			<div>
				<%@ include file="/page/board.jsp" %>
			</div >
		</div>
		<div id="pagerightbox">
			<%@ include file="/page/right.jsp" %>
		</div>
	</div>
</div>


<div class="reveal-modal" id="myModal">
	<label>후원금액</label><br /> 
	
	<div onchange="donate()">
		<input id="oneth" type="radio" name="money" value="1000" /> 1000원
		
		<input id="thrth" type="radio" name="money" value="3000" /> 3000원
		
		<input id="fivth" type="radio" name="money" value="5000" /> 5000원<br /> 
		
		<input id="tenth" type="radio" name="money" value="10000" /> 10000원
		
		<input id="in" type="radio" name="money" value="in" /> 직접입력
		<input id="in_money" type="text" name="in_money" disabled /><label>원</label>
	</div>
	
	<div style="text-align:right">
		<label for="current_money">보유 포인트</label>
		<input type="text" id="cmoney" name="cmoney" value="" readonly/>원<br/>
		<label for="donate_money">- 후원 포인트</label>
		<input type="text" id="dmoney" name="dmoney" value="" readonly/>원<br/>
		<label for="after_money">= 예상 포인트</label>
		<input type="text" id="amoney" name="amoney" value="" readonly/>원
	</div>
	<a class="close-reveal-modal">&#215;</a>
</div>


<%@ include file="./include/footer.jsp" %>
</body>
</html>