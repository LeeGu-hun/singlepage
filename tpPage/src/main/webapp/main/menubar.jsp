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
							<li><a href="#">노래</a></li>
                            <li><a href="#">댄스</a></li>
                            <li><a href="#">연주</a></li>
							<li><a href="#">연극</a></li>
							<li><a href="#">기타</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">공연시간별</li>
							<li><a href="#">오전</a></li>
							<li><a href="#">오후</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">활동기간별</li>
                            <li><a href="#">신규</a></li>
                            <li><a href="#">1년</a></li>
                            <li><a href="#">2년</a></li>
                            <li><a href="#">3년</a></li>
                            <li><a href="#">4년</a></li>
                            <li><a href="#">5년~</a></li>                         
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