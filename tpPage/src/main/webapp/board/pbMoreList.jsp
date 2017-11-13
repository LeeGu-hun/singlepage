<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowPbPage = Integer.parseInt(request.getAttribute("pbPage").toString());
%>
 
	<thead>
		<tr>
			<th colspan="2" style="padding:5px; width:65%" class="text-center">제목</th>
			<th style="width:10%" class="text-center">작성자</th>
			<th style="width:15%" class="text-center">작성일</th>
			<c:if test="${pageHostId == authInfo.pid }">
			<th style="width:10%" class="text-center">
				<a onclick="pballdrop(${authInfo.pid });" style="color:red">전체삭제</a>
			</th>
			</c:if>
		</tr>
	</thead>
	<input type="hidden" id="pbPage" name="pbPage" value="<%= nowPbPage %>" />
	<tbody id="pbListTT" name="pbListTT">
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
			<c:if test="${pageHostId == authInfo.pid }">
			<td style="padding:5px; width:10%" align="center">
				<a class="pbidrm" style="color:red">삭제</a><input type="hidden" value="${pboard.pbid }" />
			</td>
			</c:if>
		</tr>
		</c:forEach>
<% if(nowPbPage == 0) { %>		
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				등록된 글이 없습니다.
				<br>
				<br>
			</td>
		<tr>
	</tbody>
<% } else { %>
	</tbody>		
<tbody class="scroll">
<tr>
<td>
<script>
$(window).scroll(function() {
	pbScroll();
});
</script>
</td>
</tr>
</tbody>
<% } %>