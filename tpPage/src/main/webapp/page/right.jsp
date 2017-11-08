<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="related-page" style="padding: 20px;">
<div style="text-align: center;">
관련 페이지
</div>
<div class="rPages">
<c:forEach var="list" items="${related}">
	<div style="border:1px solid #cccccc; border-radius: 10px;">
		<div class="title"><a href="./page?host=${list.pid }">
		<c:if test="${!empty list.pnewfile}"><img src="./puploads/${list.pnewfile}"></c:if>
		<c:out value="${list.pname}" /></a>
		<c:out value="${list.showtime}" />, <c:out value="${list.ploc}" />
		</div>
	</div>
</c:forEach>

</div>
</div>