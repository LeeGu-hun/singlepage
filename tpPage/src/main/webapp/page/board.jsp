<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

누구님의 페이지 게시판입니다.

<%-- <form:form commandName="pboardcmd" action="pboard/write" enctype="multpart/form-data">
	<form:input path="pbsubject"/>
	<br><form:textarea path="pbcontent"></form:textarea>
	<br><img id="pbuploadImg" name="pbuploadImg" />
	<br><input type="file" id="file" name="file" onchange="readURL(this);" />
	<input type="hidden" id="updir" name="updir" value="<%=request.getRealPath("/pbuploads/") %>" />
	<input type="submit" value="등록" />
</form:form> --%>
