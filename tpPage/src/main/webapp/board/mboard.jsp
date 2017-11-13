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

<c:if test="${!empty authInfo }">
<form:form commandName="mboardcmd" action="/tpPage/mbwrite" enctype="multipart/form-data">
	<form:input path="mbsubject" style="width:100%; margin-top:5px" placeholder="제목을 입력해주세요" />
	<br><form:textarea path="mbcontent" rows="7" cols="auto" style="width:100%; margin-top:5px; resize:none" placeholder="내용을 입력해주세요"></form:textarea>
	<br><img id="mbuploadImg" name="mbuploadImg" style="display:none" />
	<input type="file" id="mbfile" name="mbfile" style="margin-top:5px" onchange="mbreadURL(this);" />
	<input type="hidden" id="mbupdir" name="mbupdir" value="<%=request.getRealPath("/buploads/mbuploads/") %>" />
	<input type="hidden" id="mbhostid" name="mbhostid" value="<c:out value='${page.pid }' />" />
	<input type="hidden" id="mbTab" name="mbTab" value="active" />
	<div align="center" style="margin-top:5px">
	<input type="submit" class="btn btn-custom" value="등록" />
	</div>
</form:form>
</c:if>
<br>
<br>
<input type="hidden" id="mbhostid" name="mbhostid" value="<c:out value='${page.pid }' />" />
<table id="mbListT" name="mbListT" style="width:100%;">
	<thead>
		<tr>
			<th colspan="2" style="padding:5px; width:65%" class="text-center">제목</th>
			<th style="width:10%" class="text-center">작성자</th>
			<th style="width:15%" class="text-center">작성일</th>
			<th style="width:10%" class="text-center">
			<c:if test="${page.pid == authInfo.pid }">
				<a onclick="mballdrop(${authInfo.pid });" style="color:red">전체삭제</a>
			</c:if>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="width: 20%"></td>
			<td style="width: 45%"></td>
			<td style="width: 10%"></td>
			<td style="width: 15%"></td>
			<td style="width: 10%"></td>
		</tr>
	</tbody>
	<input type="hidden" id="mbPage" name="mbPage" value="1" />
	<tbody>
		<c:forEach var="mboard" items="${mboardList }">
		<tr style="border-top: 1px solid black;">
			<td style="padding:5px; width:20%" align="center">
				<c:choose>
					<c:when test="${!empty mboard.mbnewfile }">
						<img data-toggle="modal" onclick="loadmboard(${mboard.mbid });" src="/tpPage/buploads/mbuploads/${mboard.mbnewfile }" height="75px" />
					</c:when>
					<c:otherwise>
						<img data-toggle="modal" onclick="loadmboard(${mboard.mbid });" src="/tpPage/default_image.png" height="75px" />
					</c:otherwise>
				</c:choose>
			</td>
			<td style="padding:5px; width:45%"><a data-toggle="modal" onclick="loadmboard(${mboard.mbid });">${mboard.mbsubject }</a></td>
			<td style="padding:5px; width:10%">${mboard.mname }</td>
			<td style="padding:5px; width:15%" align="center">
				<fmt:formatDate value="${mboard.mbdate }" pattern="MM-dd HH:mm" />
			</td>
			<td style="padding:5px; width:10%" align="center">
			<c:if test="${mboard.mbwriterid == authInfo.mid || page.pid == authInfo.pid }">
				<a class="mbidrm" style="color:red">삭제</a><input type="hidden" value="${mboard.mbid }" />
			</c:if>
			</td>
		</tr>
		</c:forEach>
<% if(nowMbPage == -1) { %>
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				등록된 글이 없습니다.
				<br>
				<br>
			</td>
		<tr>
<% } else if(nowMbPage == 0) { %>		
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				마지막 항목입니다.
				<br>
				<br>
			</td>
		</tr>
<% } else { %>
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<input type="button" class="btn btn-custom" value="더 보기" onclick="mbMoreList();" />                    
			</td>
		</tr>
<% } %>
	</tbody>
</table>