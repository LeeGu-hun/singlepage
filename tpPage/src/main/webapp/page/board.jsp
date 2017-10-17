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

누구님의 페이지 게시판입니다.

<form:form commandName="pboardcmd" action="pbwrite" enctype="multipart/form-data">
	<form:input path="pbsubject"/>
	<br><form:textarea path="pbcontent"></form:textarea>
	<br><img id="pbuploadImg" name="pbuploadImg" />
	<br><input type="file" id="pbfile" name="pbfile" onchange="readURL(this);" />
	<input type="hidden" id="pbupdir" name="pbupdir" value="<%=request.getRealPath("/pbuploads/") %>" />
	<input type="submit" value="등록" />
</form:form>
