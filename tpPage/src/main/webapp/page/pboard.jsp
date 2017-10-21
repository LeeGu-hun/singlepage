<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowPage = Integer.parseInt(request.getAttribute("page").toString());
%>

page board
<form:form commandName="pboardcmd" action="pbwrite" enctype="multipart/form-data">
	<form:input path="pbsubject" />
	<br>
	<form:textarea path="pbcontent"></form:textarea>
	<br>
	<img id="pbuploadImg" name="pbuploadImg" />
	<br>
	<input type="file" id="pbfile" name="pbfile" onchange="pbreadURL(this);" />
	<input type="hidden" id="pbupdir" name="pbupdir"
		value="<%=request.getRealPath("/buploads/pbuploads/")%>" />
	<input type="submit" value="등록" />
</form:form>
<br>
<br>
<br>
<table id="plistT" name="plistT" style="width:100%;">
	<input type="hidden" id="page" name="page" value="1" />
	<tbody>
		<c:forEach var="pboard" items="${pboardList }">
		<tr>
			<td>${pboard.pbid }</td>
			<td>${pboard.pbsubject }</td>
			<td>${pboard.pbcontent }</td>
			<td>${pboard.pbfile }</td>
			<td>
			<c:if test="${!empty pboard.pbnewfile }">
			<img src="./buploads/pbuploads/${pboard.pbnewfile }" width="100px" />
			</c:if>
			<td>${pboard.pbreadcount }</td>
			<td><fmt:formatDate value="${pboard.pbdate }" pattern="yyyy-mm-dd HH:mm:ss" /></td>
			<td>${pboard.pbhostid }</td>
			<td>${pboard.pbwriterid }</td>
			<td>${pboard.pname }</td>
			<td>${pboard.mname }</td>
		</tr>
		</c:forEach>
<% if(nowPage == -1) { %>
		<tr>
			<td colspan="11">
				등록된 글이 없습니다.
			</td>
		<tr>
<% } else if(nowPage == 0) { %>		
		<tr>
			<td colspan="11">
				마지막 항목입니다.
			</td>
		</tr>
<% } else { %>
		<tr name="btnRow" id="btnRow">
			<td>
				<input type="button" value="더 보기" />                    <!-- onclick="moreList(); " /> -->
			</td>
		</tr>
<% } %>
	</tbody>
</table>
