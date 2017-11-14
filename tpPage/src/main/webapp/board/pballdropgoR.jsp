<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<thead>
	<tr>
		<th colspan="2" style="padding:5px; width:65%" class="text-center">제목</th>
		<th style="width:10%" class="text-center">작성자</th>
		<th style="width:15%" class="text-center">작성일</th>
		<th style="width:10%" class="text-center">
		<c:if test="${pbhostid == authInfo.pid }">
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
<tbody>
	<tr style="border-top: 1px solid black;">
		<td colspan="5" style="padding:5px" align="center">
			<br>
			등록된 글이 없습니다.
			<br>
			<br>
		</td>
	<tr>
</tbody>