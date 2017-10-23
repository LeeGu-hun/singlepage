<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js?ver=2"></script>

<div>
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#pageboard"
			aria-controls="pageboard" role="tab" data-toggle="tab">page</a></li>
		<li role="presentation"><a href="#memberboard"
			aria-controls="memberboard" role="tab" data-toggle="tab">member</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="pageboard">
			<%@ include file="/page/pboard.jsp" %>
		</div>
		
		<div role="tabpanel" class="tab-pane" id="memberboard">
			<%@ include file="/page/mboard.jsp" %>
		</div>
	</div>
</div>	