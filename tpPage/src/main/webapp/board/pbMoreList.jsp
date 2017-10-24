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
		</tr>
	</thead>
	<input type="hidden" id="pbPage" name="pbPage" value="<%= nowPbPage %>" />
	<tbody id="pbListTT" name="pbListTT">
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
<% if(nowPbPage == 0) { %>		
		<tr>
			<td colspan="11">
				마지막 항목입니다.
			</td>
		</tr>
	</tbody>
<% } else { %>
	</tbody>		

<script>
$(document).ready(function() {
	$(window).scroll(function() {
		var pbli = $('#pbli').attr('class');
		if(pbli == 'active') {
			var pbPage = $("#pbPage").val();
			var pbMpage = $("#pbMpage").val();
			if(pbPage > 1 && pbMpage != 0) {
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentheight = $(document).height();
				if(scrollHeight == documentheight) {
					pbMoreListScroll();					
				}	
			}
		}
	});
});
</script>
    
<% } %>