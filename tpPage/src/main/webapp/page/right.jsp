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
<c:forEach var="related" items="${related}">
	<div style="border:1px solid #cccccc; border-radius: 10px; padding: 10px;">
		<div class="title"><a href="/tpPage/page/${related.pid }"><c:if test="${!empty related.pnewfile}"><img src="./puploads/${related.pnewfile}" style="width:50px; height: auto;"></c:if><c:out value="${related.pname}" /></a><br><c:out value="${related.pshowtime}" />, <c:out value="${related.ploc}" /></div>
	</div>
</c:forEach>

</div>
</div>