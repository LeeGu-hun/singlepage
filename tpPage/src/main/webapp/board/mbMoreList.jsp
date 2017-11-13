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
			<th colspan="2" style="padding:5px; width:65%" class="text-center">제목</th>
			<th style="width:10%" class="text-center">작성자</th>
			<th style="width:15%" class="text-center">작성일</th>
			<th style="width:10%" class="text-center">
			<c:if test="${pageHostId == authInfo.pid }">
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
	<input type="hidden" id="mbPage" name="mbPage" value="<%= nowMbPage %>" />
	<tbody id="mbListTT" name="mbListTT">
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
			<c:if test="${mboard.mbwriterid == authInfo.mid || pageHostId == authInfo.pid }">
				<a class="mbidrm" style="color:red">삭제</a><input type="hidden" value="${mboard.mbid }" />
			</c:if>
			</td>
		</tr>
		</c:forEach>
<% if(nowMbPage == 0) { %>		
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				마지막 항목입니다.
				<br>
				<br>
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
	mbScroll();
});
</script>
</td>
</tr>
</tbody>	
<% } %>
