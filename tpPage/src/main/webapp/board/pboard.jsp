<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowPbPage = Integer.parseInt(request.getAttribute("pbPage").toString());
%>

<c:out value="${page.pid }" /> page board
<c:if test="${page.pid == authInfo.pid }">
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
	<input type="hidden" id="pbhostid" name="pbhostid" value="<c:out value='${page.pid }' />" />
	<input type="submit" value="등록" />
</form:form>
</c:if>
<br>
<br>
<br>
<input type="hidden" id="pbhostid" name="pbhostid" value="<c:out value='${page.pid }' />" />
<table id="pbListT" name="pbListT" style="width:100%;">
	<thead>
		<tr>
			<th>pbid</th>
			<th>pbsubject</th>
			<th>pbcontent</th>
			<th>pbfile</th>
			<th>pbnewfile</th>
			<th>pbreadcount</th>
			<th>pbdate</th>
			<th>pbhostid</th>
			<th>pbwriterid</th>
			<th>pname</th>
			<th>mname</th>
		</tr>
	</thead>
	<input type="hidden" id="pbPage" name="pbPage" value="1" />
	<tbody>
		<c:forEach var="pboard" items="${pboardList }">
		<tr>
			<td><a data-toggle="modal" onclick="loadpboard(${pboard.pbid });">${pboard.pbid }</a></td>
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
<% if(nowPbPage == -1) { %>
		<tr>
			<td colspan="11">
				등록된 글이 없습니다.
			</td>
		<tr>
<% } else if(nowPbPage == 0) { %>		
		<tr>
			<td colspan="11">
				마지막 항목입니다.
			</td>
		</tr>
<% } else { %>
		<tr name="pbBtnRow" id="pbBtnRow">
			<td>
				<input type="button" value="더 보기" onclick="pbMoreList();" />                    
			</td>
		</tr>
<% } %>
	</tbody>
</table>
