<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/page_style.css?ver=1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=33" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/autosize.js?ver=1"></script>

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
			<div style="border:1px solid black;">
				<%@ include file="/page/top.jsp" %>
			</div>
			<div style="border:1px solid black">
				<%@ include file="/page/board.jsp" %>
			</div>
		</div>
		<div id="pagerightbox">
			<%@ include file="/page/right.jsp" %>
		</div>
	</div>
</div>

<%@ include file="./include/footer.jsp" %>
</body>
</html>