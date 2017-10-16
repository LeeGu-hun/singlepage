<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/page_style.css?ver=12332231" />

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js?ver=13232321"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SinglePage</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<%@ include file="./page/pmain.jsp" %>

<%@ include file="./include/footer.jsp" %>
</body>
</html>