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
			<c:if test="${page.pid == authInfo.pid }">
			<td><a class="pbidrm">삭제</a><input type="hidden" value="${pboard.pbid }" /></td>
			</c:if>
		</tr>
	</thead>
	<input type="hidden" id="pbPage" name="pbPage" value="<%= nowPbPage %>" />
	<tbody id="pbListTT" name="pbListTT">
		<c:forEach var="pboard" items="${pboardList }">
		<tr>
			<td><a data-toggle="modal" onclick="loadpboard(${pboard.pbid });">${pboard.pbid }</a></td>
			<td>${pboard.pbsubject }</td>
			<td>${pboard.pbcontent }</td>
			<td>${pboard.pbfile }</td>
			<td>
			<c:if test="${!empty pboard.pbnewfile }">
			<img src="/tpPage/buploads/pbuploads/${pboard.pbnewfile }" width="100px" />
			</c:if>
			<td>${pboard.pbreadcount }</td>
			<td><fmt:formatDate value="${pboard.pbdate }" pattern="yyyy-mm-dd HH:mm:ss" /></td>
			<td>${pboard.pbhostid }</td>
			<td>${pboard.pbwriterid }</td>
			<td>${pboard.pname }</td>
			<td>${pboard.mname }</td>
			<td><a class="pbidrm">삭제</a><input type="hidden" value="${pboard.pbid }" /></td>
		</tr>
		</c:forEach>
<% if(nowPbPage == 0) { %>		
		<tr>
			<td colspan="12">
				마지막 항목입니다.
			</td>
		</tr>
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