<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<div class="col-md-3">
		<div class="cate-title">지역별</div>
	</div>
	<div class="col-md-3">
		<div class="cate-title">장르별</div>
	</div>
	<div class="col-md-3">
		<div class="cate-title">공연시간별</div>
	</div>
	<div class="col-md-3">
		<div class="cate-title">활동기간별</div>
	</div>
</div>
<div>
	<div class="col-md-3">
		<div>군.구</div>
	</div>
	<div class="col-md-9">
		<div>
			<label class="checkbox-inline">
				<c:forEach var="loc" items="${locList }">
					<input type="checkbox" name="loc" id="${loc }" value="${loc }"> 중구
				</c:forEach>
				
			</label>
		</div>
	</div>
</div>
