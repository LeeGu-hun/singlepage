<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int nowMbPage = Integer.parseInt(request.getAttribute("mbMpage").toString());
%>

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
<% if(nowMbPage == -1) { %>		
		<tr style="border-top: 1px solid black;">
			<td colspan="5" style="padding:5px" align="center">
				<br>
				마지막 항목입니다.
				<br>
				<br>
			</td>
		</tr>
	<input type="hidden" name="mbMpage" id="mbMpage" value="<%=nowMbPage %>" />
<% } %>