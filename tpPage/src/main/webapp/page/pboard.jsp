<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

page board
<form:form commandName="pboardcmd" action="pbwrite"
	enctype="multipart/form-data">
	<form:input path="pbsubject" />
	<br>
	<form:textarea path="pbcontent"></form:textarea>
	<br>
	<img id="pbuploadImg" name="pbuploadImg" />
	<br>
	<input type="file" id="pbfile" name="pbfile" onchange="readURL(this);" />
	<input type="hidden" id="pbupdir" name="pbupdir"
		value="<%=request.getRealPath("/buploads/pbuploads/")%>" />
	<input type="submit" value="등록" />
</form:form>