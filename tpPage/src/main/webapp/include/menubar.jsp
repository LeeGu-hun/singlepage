<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <nav class="navbar navbar-inverse">
	<div style="padding: 0 15px 0 15px;">
		<ul class="nav navbar-nav">
			<li class="dropdown mega-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">카테고리 <span class="caret"></span></a>				
				<ul class="dropdown-menu mega-dropdown-menu">
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header"><a href="/tpPage/srch?ploc=all">지역별</a></li>
							<li><a href="/tpPage/srch?ploc=서울">서울</a></li>
                            <li><a href="/tpPage/srch?ploc=인천">인천</a></li>
							<li><a href="/tpPage/srch?ploc=대전">대전</a></li>
							<li><a href="/tpPage/srch?ploc=광주">광주</a></li>
							<li><a href="/tpPage/srch?ploc=대구">대구</a></li>
							<li><a href="/tpPage/srch?ploc=부산">부산</a></li>
							<li><a href="/tpPage/srch?ploc=울산">울산</a></li>
							<li class="divider"></li>
							<li><a href="/tpPage/srch?ploc=more">더보기</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header"><a href="/tpPage/srch?pgenre=all">장르별</a></li>
							<li><a href="/tpPage/srch?pgenre=노래">노래</a></li>
                            <li><a href="/tpPage/srch?pgenre=댄스">댄스</a></li>
                            <li><a href="/tpPage/srch?pgenre=연주">연주</a></li>
							<li><a href="/tpPage/srch?pgenre=연극">연극</a></li>
							<li><a href="/tpPage/srch?pgenre=기타">기타</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header"><a href="/tpPage/srch?pshowtime=all">공연시간별</a></li>
							<li><a href="/tpPage/srch?pshowtime=24~12">오전</a></li>
							<li><a href="/tpPage/srch?pshowtime=12~24">오후</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header"><a href="/tpPage/srch?pperiod=all">활동기간별</a></li>
                            <li><a href="/tpPage/srch?pperiod=0">신규</a></li>
                            <li><a href="/tpPage/srch?pperiod=1">1년</a></li>
                            <li><a href="/tpPage/srch?pperiod=2">2년</a></li>
                            <li><a href="/tpPage/srch?pperiod=3">3년</a></li>
                            <li><a href="/tpPage/srch?pperiod=4">4년</a></li>
                            <li><a href="/tpPage/srch?pperiod=5">5년~</a></li>                         
						</ul>
					</li>
				</ul>				
			</li>
            <c:if test="${authInfo != null }">
            <li><a href="/tpPage/favo">모아보기</a></li>
            </c:if>
		</ul>
        <!-- <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
        <li><a href="#">My cart (0) items</a></li>
      </ul> -->
	</div><!-- /.nav-collapse -->
  </nav>