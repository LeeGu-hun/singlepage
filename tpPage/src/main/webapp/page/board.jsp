<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
a {
 cursor:pointer;
}
</style>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<script src="<%=request.getContextPath()%>/js/board.js?ver=12"></script>

<div>
	<ul id="bTab" class="nav nav-tabs" role="tablist">
		<li id="pbli" role="presentation" class="active"><a href="#pageboard"
			aria-controls="pageboard" role="tab" data-toggle="tab">page</a></li>
		<li id="mbli" role="presentation"><a href="#memberboard"
			aria-controls="memberboard" role="tab" data-toggle="tab">member</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="pageboard">
			<%@ include file="/board/pboard.jsp" %>
		</div>
		
		<div role="tabpanel" class="tab-pane" id="memberboard">
			<%@ include file="/board/mboard.jsp" %>
		</div>
	</div>
</div>	
