<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

member board
<form:form commandName="mboardcmd" action="mbwrite"
	enctype="multipart/form-data">
	<form:input path="mbsubject" />
	<br>
	<form:textarea path="mbcontent"></form:textarea>
	<br>
	<img id="mbuploadImg" name="mbuploadImg" />
	<br>
	<input type="file" id="mbfile" name="mbfile" onchange="readURL(this);" />
	<input type="hidden" id="mbupdir" name="mbupdir"
		value="<%=request.getRealPath("/buploads/mbuploads")%>" />
	<input type="submit" value="등록" />
</form:form>