<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<div class="related-page" style="padding: 20px;">
<div style="text-align: center; margin-bottom: 15px">
<h3><b>관련 PLAIN</b></h3>
</div>
<c:forEach var="related" items="${related}">
	<div style="border:2px solid #000; border-radius: 10px; padding: 10px;">
		<div class="related"><a href="/tpPage/page/${related.pid }"><c:if test="${!empty related.pnewfile}"><img src="/tpPage/puploads/${related.pnewfile}"></c:if><c:out value="${related.pname}" /></a><br><c:out value="${related.pshowtime}" />, <c:out value="${related.ploc}" /></div>
	</div>
	<br>
</c:forEach>
</div>

