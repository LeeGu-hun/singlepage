<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowMbPage = Integer.parseInt(request.getAttribute("mbPage").toString());
%>

<c:choose>
	<c:when test="${reMbTab eq null }">
		<input type="hidden" id="rMbTab" name="rMbTab" value="noactive" />
	</c:when>
	<c:otherwise>
		<input type="hidden" id="rMbTab" name="rMbTab" value="active" />		
	</c:otherwise>
</c:choose>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	var mbTab = $('#rMbTab').val();
	if(mbTab == 'active') {
		$("#bTab a[href='#memberboard']").tab("show");
	}
});
</script>

<c:out value="${page.pid }" /> member board
<c:if test="${!empty authInfo }">
<form:form commandName="mboardcmd" action="mbwrite" enctype="multipart/form-data">
	<form:input path="mbsubject" />
	<br>
	<form:textarea path="mbcontent"></form:textarea>
	<br>
	<img id="mbuploadImg" name="mbuploadImg" />
	<br>
	<input type="file" id="mbfile" name="mbfile" onchange="mbreadURL(this);" />
	<input type="hidden" id="mbupdir" name="mbupdir"
		value="<%=request.getRealPath("/buploads/mbuploads/") %>" />
	<input type="hidden" id="mbhostid" name="mbhostid" value="<c:out value='${page.pid }' />" />
	<input type="hidden" id="mbTab" name="mbTab" value="active" />
	<input type="submit" value="등록" />
</form:form>
</c:if>

<br>
<br>
<br>
<table id="mbListT" name="mbListT" style="width:100%;">
	<thead>
		<tr>
			<th>mbid</th>
			<th>mbsubject</th>
			<th>mbcontent</th>
			<th>mbfile</th>
			<th>mbnewfile</th>
			<th>mbreadcount</th>
			<th>mbdate</th>
			<th>mbhostid</th>
			<th>mbwriterid</th>
			<th>pname</th>
			<th>mname</th>
		</tr>
	</thead>
	<input type="hidden" id="mbPage" name="mbPage" value="1" />
	<tbody>
		<c:forEach var="mboard" items="${mboardList }">
		<tr>
			<td><a data-toggle="modal" onclick="loadmboard(${mboard.mbid });">${mboard.mbid }</a></td>
			<td>${mboard.mbsubject }</td>
			<td>${mboard.mbcontent }</td>
			<td>${mboard.mbfile }</td>
			<td>
			<c:if test="${!empty mboard.mbnewfile }">
			<img src="./buploads/mbuploads/${mboard.mbnewfile }" width="100px" />
			</c:if>
			<td>${mboard.mbreadcount }</td>
			<td><fmt:formatDate value="${mboard.mbdate }" pattern="yyyy-mm-dd HH:mm:ss" /></td>
			<td>${mboard.mbhostid }</td>
			<td>${mboard.mbwriterid }</td>
			<td>${mboard.pname }</td>
			<td>${mboard.mname }</td>
		</tr>
		</c:forEach>
<% if(nowMbPage == -1) { %>
		<tr>
			<td colspan="11">
				등록된 글이 없습니다.
			</td>
		<tr>
<% } else if(nowMbPage == 0) { %>		
		<tr>
			<td colspan="11">
				마지막 항목입니다.
			</td>
		</tr>
<% } else { %>
		<tr>
			<td>
				<input type="button" value="더 보기" onclick="mbMoreList();" />                    
			</td>
		</tr>
<% } %>
	</tbody>
</table>