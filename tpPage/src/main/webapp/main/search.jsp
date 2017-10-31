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
            <div class="tab-pane in active" id="tab1">
            	<div class="col-md-3">
					<div style = "overflow:auto; height: 300px" >
						<div class="radio">
							<c:forEach var="loc" items="${sidoList }">
								<div class="sidoList">
								<label>
									<input type="radio" name="sido" value="${loc.sido }">${loc.sido }
								</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<c:forEach var="sido" items="${sidoList }">
					<div id="${sido.sido }" class="gunguList" class="checkbox">
						<c:forEach var="loc" items="${gunguList }">
							<c:if test="${sido.sido == loc.sido }">
							<label>
								<input type="checkbox" name="gungu" value="${loc.gungu }">${loc.gungu }
							</label>
							</c:if>
						</c:forEach>
					</div>
					</c:forEach>
				</div>
            </div>
            <div class="tab-pane" id="tab2">Info 2</div>
            <div class="tab-pane" id="tab3">Info 3</div>
            <div class="tab-pane" id="tab4">Info 4</div>
        </div>
    </div>
</div>

