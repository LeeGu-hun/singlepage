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

<c:choose>
	<c:when test="${gopbid != null }">
		<script>
			$(document).ready(function() {
				loadpboard(${gopbid });
			});
		</script>
		<input type="hidden" id="gopbid" value="${gopbid }" />
	</c:when>
	<c:otherwise>
		<input type="hidden" id="gopbid" value="0" />
	</c:otherwise>
</c:choose>

<c:if test="${page.pid == authInfo.pid }">
<form:form commandName="pboardcmd" action="/tpPage/pbwrite" enctype="multipart/form-data">
	<form:input path="pbsubject" required="required" class="form-control" style="width:100%; margin-top:5px" placeholder="제목을 입력해주세요"/>
	<form:textarea path="pbcontent" required="required" class="form-control" rows="7" cols="auto" style="width:100%; margin-top:5px; resize:none" placeholder="내용을 입력해주세요"></form:textarea>
		<div style="border:1px solid #000; border-radius:4px; padding: 6px 12px;">
		<img id="pbuploadImg" name="pbuploadImg" class="uploadImg" style="display:none;" />
		<div class="form-inline">
		<label class="btn btn-custom btn-sm filebox">
		<input id="pbfile" name="pbfile" type="file" onchange="pbreadURL(this);">파일 선택</label>
		<a class="btn btn-custom btn-sm btnRmv" style="margin-left:10px">삭제</a>
		<input type="text" id="pbfname" class="form-control fname" style="width:auto; margin-left:10px" value="파일 없음" disabled="disabled"></div>
		</div>
	<input type="hidden" id="pbupdir" name="pbupdir" value="<%=request.getRealPath("/buploads/pbuploads/")%>" />
	<input type="hidden" id="pbhostid" name="pbhostid" value="<c:out value='${page.pid }' />" />
	<div align="center" style="margin-top:5px">
	<input type="submit" class="btn btn-custom" value="등록" />
	</div>
</form:form>
</c:if>
<br>
<br>
<input type="hidden" id="pbhostid" name="pbhostid" value="<c:out value='${page.pid }' />" />
<table id="pbListT" name="pbListT" style="width:100%;">
	<thead>
		<tr>
			<th colspan="2" style="padding:5px; width:65%" class="text-center">제목</th>
			<th style="width:10%" class="text-center">작성자</th>
			<th style="width:15%" class="text-center">작성일</th>
			<th style="width:10%" class="text-center">
			<c:if test="${page.pid == authInfo.pid }">
				<a onclick="pballdrop(${authInfo.pid });" style="color:red">전체삭제</a>
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
	<input type="hidden" id="pbPage" name="pbPage" value="1" />
	<tbody>
		<c:forEach var="pboard" items="${pboardList }">
		<tr style="border-top: 1px solid black;">
			<td style="padding:5px; width:20%" align="center">
				<c:choose>
					<c:when test="${!empty pboard.pbnewfile }">
						<img data-toggle="modal" onclick="loadpboard(${pboard.pbid });" src="/tpPage/buploads/pbuploads/${pboard.pbnewfile }" height="75px" />
					</c:when>
					<c:otherwise>
						<img data-toggle="modal" onclick="loadpboard(${pboard.pbid });" src="/tpPage/default_image.png" height="75px" />
					</c:otherwise>
				</c:choose>
			</td>
			<td style="padding:5px; width:45%"><a data-toggle="modal" onclick="loadpboard(${pboard.pbid });">${pboard.pbsubject }</a></td>
			<td style="padding:5px; width:10%">${pboard.mname }</td>
			<td style="padding:5px; width:15%" align="center">
				<fmt:formatDate value="${pboard.pbdate }" pattern="MM-dd HH:mm" />
			</td>
			<td style="padding:5px; width:10%" align="center">
			<c:if test="${page.pid == authInfo.pid }">
				<a class="pbidrm" style="color:red">삭제</a><input type="hidden" value="${pboard.pbid }" />
			</c:if>
			</td>
		</tr>
		</c:forEach>
<% if(nowPbPage == -1) { %>
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				등록된 글이 없습니다.
				<br>
				<br>
			</td>
		<tr>
<% } else if(nowPbPage == 0) { %>		
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
				<br>
				<input type="button" class="btn btn-custom" value="더 보기" onclick="pbMoreList();" />
				<br>
				<br>                    
			</td>
		</tr>
<% } %>
	</tbody>
</table>