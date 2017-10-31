<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="panel with-nav-tabs panel-info">
    <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab">지역별</a></li>
                <li><a href="#tab2" data-toggle="tab">장르별</a></li>
                <li><a href="#tab3" data-toggle="tab">공연시간별</a></li>
                <li><a href="#tab4" data-toggle="tab">활동기간별</a></li>
            </ul>
    </div>
    <div class="panel-body">
        <div class="tab-content">
            <div class="tab-pane in active" id="tab1">Info 1</div>
            <div class="tab-pane" id="tab2">Info 2</div>
            <div class="tab-pane" id="tab3">Info 3</div>
            <div class="tab-pane" id="tab4">Info 4</div>
        </div>
    </div>
</div>


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
