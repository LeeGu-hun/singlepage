<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
<%@ include file="./menubar.jsp" %>

<%@ include file="./search.jsp" %>
</div>


<div class="container">
<div class="grid">
	<c:forEach var="list" items="${boardList }">
	<div class="grid-item">
		<div class="inner-item">
			<div class="title">제목 : <c:out value="${list.pbsubject}" /></div>
			<div class="content">내용<br><c:if test="${!empty list.pbnewfile}"><div style="text-align: center;"><img src="./buploads/pbuploads/${list.pbnewfile}"></div></c:if><c:out value="${list.pbcontent}" /></div>
		</div>
	</div>
	</c:forEach>
</div>

<button id="btn" onclick="loadMain()" class="btn btn-md btn-primary">더보기</button>

<div class="inner-content"></div>
<div class="inner-back"></div>
<!-- 아이템 영역 끝 -->

<script>
jQuery(document).on('click', '.mega-dropdown', function(e) {
	  e.stopPropagation()
	})
$(window).ready(function(){
	$('.grid').masonry({
	  // options
	  itemSelector: '.grid-item',
	  percentPosition: true,
	});
})
</script>

</div>