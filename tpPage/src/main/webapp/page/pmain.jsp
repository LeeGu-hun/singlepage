<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="width:100%">

	<div id="pageleftbox" style="border:1px">
		<%@ include file="/page/left.jsp" %>
	</div>
	
	<div id="pagecenterbox">
		<div style="border:1px solid black;">
			<%@ include file="/page/top.jsp" %>
		</div>
		<div style="border:1px solid black">
			<%@ include file="/page/board.jsp" %>
		</div>
	</div>
	
	<div id="pagerightbox" style="border:1px">
		<%@ include file="/page/right.jsp" %>
	</div>

</div>
