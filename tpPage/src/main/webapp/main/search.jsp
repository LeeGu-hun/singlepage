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
					<div style = "overflow:auto; height: 200px" >
						<div class="radio">
							<c:forEach var="loc" items="${sidoList }">
								<div class="cateList">
								<label><input type="radio" name="sido" value="${loc.sido }">${loc.sido }</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<c:forEach var="sido" items="${sidoList }">
					<div id="${sido.sido }" class="itemList">
						<label><input type="checkbox" name="${sido.sido }" value="${sido.sido }" id="${sido.sido }" data-all data-cate="loc">전체</label>
						<c:forEach var="loc" items="${gunguList }">
							<c:if test="${sido.sido == loc.sido && loc.gungu != null }">
							<label><input type="checkbox" name="${sido.sido }" value="${sido.sido } ${loc.gungu }" id="${sido.sido }-${loc.gungu }" data-cate="loc">${loc.gungu }</label>
							</c:if>
						</c:forEach>
					</div>
					</c:forEach>
				</div>
            </div>
            <div class="tab-pane" id="tab2">
				<div id="genre">
					<label><input type="checkbox" name="장르" value="장르 전체" id="장르" data-all data-cate="genre">전체</label>
					<label><input type="checkbox" name="장르" value="노래" id="장르-노래" data-cate="genre">노래</label>
					<label><input type="checkbox" name="장르" value="댄스" id="장르-댄스" data-cate="genre">댄스</label>
					<label><input type="checkbox" name="장르" value="연주" id="장르-연주" data-cate="genre">연주</label>
					<label><input type="checkbox" name="장르" value="연극" id="장르-연극" data-cate="genre">연극</label>
					<label><input type="checkbox" name="장르" value="기타" id="장르-기타" data-cate="genre">기타</label>
				</div>
            </div>
            <div class="tab-pane" id="tab3">
            	<div id="showtime">
            		<label for="amount">공연 시간 :</label>
  					<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
  					<label><input type="checkbox" id="tomorrow">익일</label>
  					<div id="slider-range"></div>
  					<a class="btn btn-info btn-xs" id="timeBtn">추가</a>
				</div>
            </div>
            <div class="tab-pane" id="tab4">
            	<div id="period">
					<label><input type="checkbox" name="활동기간" value="활동기간 전체" id="활동기간" data-all data-cate="period">전체</label>
					<label><input type="checkbox" name="활동기간" value="1년" id="활동기간-1년" data-cate="since">1년</label>
					<label><input type="checkbox" name="활동기간" value="2년" id="활동기간-2년" data-cate="since">2년</label>
					<label><input type="checkbox" name="활동기간" value="3년" id="활동기간-3년" data-cate="since">3년</label>
					<label><input type="checkbox" name="활동기간" value="4년" id="활동기간-4년" data-cate="since">4년</label>
					<label><input type="checkbox" name="활동기간" value="5년~" id="활동기간-5년" data-cate="since">5년~</label>
				</div>
            </div>
        </div>
    </div>
    <form id="srchFrm">
	<div class="selected form-inline" style="padding: 20px">
	<a class="btn btn-primary" id="srchSubmit">검색</a>
    </div>
    
    </form>
</div>

