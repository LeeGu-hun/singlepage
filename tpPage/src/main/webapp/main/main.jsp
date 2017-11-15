<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style="height: 20px"></div>

<div class="container">

<c:if test="${searched != null }">
<form id="frm">
<input type="hidden" id="srch" value="0" />
<input type="hidden" value="1" id="page" />
</form>
<%@ include file="./search.jsp" %>
<br />
</c:if>
<c:if test="${favo != null }">
<input type="hidden" id="favo" value="0" />
<input type="hidden" value="1" id="page" />
</c:if>
</div>


<div class="container">
<div class="grid">
	<c:forEach var="list" items="${boardList }">
	<div class="grid-item">
		<div class="inner-item">
			<div class="content"><c:if test="${!empty list.pbnewfile}"><div style="text-align: center;"><img src="/tpPage/buploads/pbuploads/${list.pbnewfile}"></div><br></c:if><a href="/tpPage/page/${list.pbhostid }?pbid=${list.pbid}"><b><c:out value="${list.pname }"/></b>(<c:out value="${list.mname }" />)</a><br><br><b><c:out value="${list.pbsubject}" /></b><br><% pageContext.setAttribute("rn", "\r\n"); %>${fn:replace(list.pbcontent, rn, "<br>")}<br><br><fmt:formatDate value="${list.pbdate}" pattern="yy.MM.dd HH:mm:ss"/></div>
		</div>
	</div>
	</c:forEach>
	<c:if test="${fn:length(boardList) < 1}">
		<div class="grid-item" style="width:100%; text-align: center; font-weight:bold;" >
			아직 좋아요 한 페이지가 없습니다.
			<input type="hidden" id="end" name="end">
		</div>
	</c:if>
</div>

<c:if test="${searched == null && favo == null}">
<button id="btn" onclick="loadMain()" class="btn btn-md btn-custom">더보기</button>
</c:if>
<c:if test="${searched != null }">
<button id="btn" onclick="loadSrch()" class="btn btn-md btn-custom">더보기</button>
</c:if>
<c:if test="${favo != null }">
<button id="btn" onclick="loadFavo()" class="btn btn-md btn-custom">더보기</button>
</c:if>

<a id="btnTop" class="btn btn-info btn-lg">맨 위로</a>

<div class="outer-content">
<div class="inner-content"></div>
<div class="inner-back">
<img class="btn-close" src="close-button.png"></div>
</div>
<div class="outer-back">
</div>
<!-- 아이템 영역 끝 -->

<script>
$(document).ready(function(){
	jQuery(document).on('click', '.mega-dropdown', function(e) {
		  e.stopPropagation()
		})
	
});
$('.grid').imagesLoaded(function (){
	$('.grid').masonry({
		  // options
		  columnWidth: 1,
		  itemSelector: '.grid-item',
		  percentPosition: true
	});
});
</script>

</div>