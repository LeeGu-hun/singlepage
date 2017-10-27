<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowMbPage = Integer.parseInt(request.getAttribute("mbPage").toString());
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
	<input type="hidden" id="mbPage" name="mbPage" value="<%= nowMbPage %>" />
	<tbody id="mbListTT" name="mbListTT">
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
<% if(nowMbPage == 0) { %>		
		<tr>
			<td colspan="11">
				마지막 항목입니다.
			</td>
		</tr>
	</tbody>
<% } else { %>
		<tr class="scroll">
			<td>
<script>

$(document).ready(function() {
	$(window).scroll(function() {				
			
		
		
		var mbli = $('#mbli').attr('class');
		if (mbli == 'active') {
			var mbPage = $("#mbPage").val();
			var mbMpage = $("#mbMpage").val();
			if (mbPage > 1 && mbMpage != -1) {
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentheight = $(document).height();
					/* $(window).scroll(function() { */	
				if (scrollHeight + 100 >= documentheight) {
						mbMoreListScroll();
						$('.scroll').remove();
				}
					/* }) */;
			} else if (mbMpage == -1) {
				$('.scroll').remove();
			}
			
		}
	
		
	});
});
</script>			
		
			</td>
		</tr>
	</tbody>		
	
<% } %>




