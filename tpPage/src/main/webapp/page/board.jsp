<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#pbuploadImg').attr('src', e.target.result);
				$('#pbuploadImg').attr('width', 300);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<div>
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#page"
			aria-controls="page" role="tab" data-toggle="tab">page</a></li>
		<li role="presentation"><a href="#member"
			aria-controls="member" role="tab" data-toggle="tab">member</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="page">
			<%@ include file="/page/pboard.jsp" %>
		</div>
		
		<div role="tabpanel" class="tab-pane" id="member">
			<%@ include file="/page/mboard.jsp" %>
		</div>
	</div>
</div>	