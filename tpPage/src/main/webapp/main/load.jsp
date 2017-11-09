<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
<c:when test="${fn:length(appendList) < 1}">
<div class="grid-item" style="width:100%; text-align: center; font-weight:bold;" >
	더 이상 표시할 내용이 없습니다.
	<input type="hidden" id="end" name="end">
</div>
</c:when>
<c:otherwise>
<c:forEach var="list" items="${appendList}">
	<div class="grid-item">
		<div class="inner-item">
			<div class="title"><a href="/tpPage/page/${list.pbhostid }">제목 : <c:out value="${list.pbsubject}" /></a></div>
			<div class="content">내용<br><c:if test="${!empty list.pbnewfile}"><div style="text-align: center;"><img src="/tpPage/buploads/pbuploads/${list.pbnewfile}"></div></c:if><% pageContext.setAttribute("rn", "\r\n"); %>${fn:replace(list.pbcontent, rn, "<br>")}<br><br><fmt:formatDate value="${list.pbdate}" pattern="yy.MM.dd HH:mm:ss"/></div>
		</div>
	</div>
</c:forEach>
</c:otherwise>
</c:choose>