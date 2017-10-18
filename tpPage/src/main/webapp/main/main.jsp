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



<div class="grid">
<c:forEach var="list" items="${boardList }">
<div class="gird-item">
<c:out value="${list.pbid }" />
</div>
</c:forEach>
</div>
<!-- 랜덤 영역 끝 -->



</div>