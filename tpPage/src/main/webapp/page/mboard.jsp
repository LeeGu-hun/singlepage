<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

member board
<form id="mboardform" name="mboardform" method="Post" enctype="multipart/form-data">
	<input type="text" id="mbsubject" name="mbsubject" />
	<br>
	<textarea id="mbcontent" name="mbcontent"></textarea>
	<br>
	<img id="mbuploadImg" name="mbuploadImg" />
	<br>
	<input type="file" id="mbfile" name="mbfile" onchange="readURL(this);" />
	<input type="hidden" id="mbupdir" name="mbupdir"
		value="<%=request.getRealPath("/buploads/mbuploads/")%>" />
	<input type="button" value="등록" onclick="mbwrite();" />
</form>