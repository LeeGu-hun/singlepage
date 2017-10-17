<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
jQuery(document).on('click', '.mega-dropdown', function(e) {
	  e.stopPropagation()
	})
</script>

<div class="container">
<%@ include file="./menubar.jsp" %>

<div align="center">
<div class="col-md-4" style="border: 1px solid #cccccc;height: 300px"></div>
<div class="col-md-4" style="border: 1px solid #cccccc;height: 300px"></div>
<div class="col-md-4" style="border: 1px solid #cccccc;height: 300px"></div>
</div>
<!-- 메인영역 끝 -->

</div>