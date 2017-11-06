<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <nav class="navbar navbar-inverse">
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown mega-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">카테고리 <span class="caret"></span></a>				
				<ul class="dropdown-menu mega-dropdown-menu">
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header"><a href="./srch?ploc=all">지역별</a></li>
							<li><a href="./srch?ploc=서울">서울</a></li>
                            <li><a href="./srch?ploc=인천">인천</a></li>
							<li><a href="./srch?ploc=대전">대전</a></li>
							<li><a href="./srch?ploc=광주">광주</a></li>
							<li><a href="./srch?ploc=대구">대구</a></li>
							<li><a href="./srch?ploc=부산">부산</a></li>
							<li><a href="./srch?ploc=울산">울산</a></li>
							<li class="divider"></li>
							<li><a href="./srch?ploc=more">더보기</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">장르별</li>
							<li><a href="./srch?pgenre=노래">노래</a></li>
                            <li><a href="./srch?pgenre=댄스">댄스</a></li>
                            <li><a href="./srch?pgenre=연주">연주</a></li>
							<li><a href="./srch?pgenre=연극">연극</a></li>
							<li><a href="./srch?pgenre=기타">기타</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">공연시간별</li>
							<li><a href="./srch?pshowtime=24~12">오전</a></li>
							<li><a href="./srch?pshowtime=12~24">오후</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">활동기간별</li>
                            <li><a href="./srch?pperiod=0">신규</a></li>
                            <li><a href="./srch?pperiod=1">1년</a></li>
                            <li><a href="./srch?pperiod=2">2년</a></li>
                            <li><a href="./srch?pperiod=3">3년</a></li>
                            <li><a href="./srch?pperiod=4">4년</a></li>
                            <li><a href="./srch?pperiod=5">5년~</a></li>                         
						</ul>
					</li>
				</ul>				
			</li>
            
            <li><a href="#">모아보기</a></li>
		</ul>
        <ul class="nav navbar-nav navbar-right">
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
      </ul>
	</div><!-- /.nav-collapse -->
  </nav>