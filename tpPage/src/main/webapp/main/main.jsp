<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
jQuery(document).on('click', '.mega-dropdown', function(e) {
	  e.stopPropagation()
	})
</script>

<div class="container">
  <nav class="navbar navbar-inverse">
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown mega-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">메뉴 <span class="caret"></span></a>				
				<ul class="dropdown-menu mega-dropdown-menu">
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">지역별</li>
							<li><a href="#">서울</a></li>
                            <li><a href="#">인천</a></li>
							<li><a href="#">대전</a></li>
							<li><a href="#">광주</a></li>
							<li><a href="#">대구</a></li>
							<li><a href="#">부산</a></li>
							<li><a href="#">울산</a></li>
							<li><a href="#">전국</a></li>
							<li class="divider"></li>
							<li><a href="#">더보기</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">장르별</li>
							<li><a href="#">장르1</a></li>
                            <li><a href="#">장르2</a></li>
                            <li><a href="#">장르3</a></li>
							<li><a href="#">장르4</a></li>
							<li><a href="#">장르5</a></li>
							<li><a href="#">장르6</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">공연시간별</li>
							<li><a href="#">시간1</a></li>
							<li><a href="#">시간2</a></li>
							<li><a href="#">시간3</a></li>
							<li><a href="#">시간4</a></li>
							<li><a href="#">시간5</a></li>
							<li><a href="#">시간6</a></li>
							<li><a href="#">시간7</a></li>							
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">활동기간별</li>
                            <li><a href="#">기간1</a></li>
                            <li><a href="#">기간2</a></li>
                            <li><a href="#">기간3</a></li>
                            <li><a href="#">기간4</a></li>
                            <li><a href="#">기간5</a></li>
                            <li><a href="#">기간6</a></li>                         
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
<!-- 메뉴 끝 -->

<div>
메인 랜덤 뿌리기
</div>
<!-- 메인영역 끝 -->

</div>