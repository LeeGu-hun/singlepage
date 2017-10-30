<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css?ver=42" />
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/masonry.pkgd.js"></script>
<script src="<%=request.getContextPath()%>/js/imagesloaded.pkgd.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js?ver=154"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SinglePage</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<%@ include file="./main/main.jsp" %>

<%@ include file="./include/footer.jsp" %>
</body>
</html>