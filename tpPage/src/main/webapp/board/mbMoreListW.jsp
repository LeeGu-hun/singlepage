<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowMbPageW = Integer.parseInt(request.getAttribute("mbPageW").toString());
%>
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
	<input type="hidden" id="mbPageW" name="mbPageW" value="<%= nowMbPageW %>" />
	<tbody id="mbListWTT" name="mbListWTT">
		<c:forEach var="mboard" items="${mboardList }">
		<tr>
			<td>${mboard.mbid }</td>
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
<% if(nowMbPageW == 0) { %>		
		<tr>
			<td colspan="11">
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
	mbScrollW();
});
</script>
</td>
</tr>
</tbody>
<% } %>