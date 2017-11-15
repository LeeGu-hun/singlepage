<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/page_style.css?ver=4" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=33" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/btnColor.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/formColor.css" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script src="<%=request.getContextPath()%>/js/autosize.js?ver=3"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SinglePage</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<div id="pagemainbox">
	<div id ="pagecontentbox">
		<div id="pageleftbox">
			<%@ include file="/page/left.jsp" %>
		</div>
		<div id="pagecenterbox">
			<div style="border-bottom:1px solid black;">
				<%@ include file="/page/top.jsp" %>
			</div>
			<div>
				<%@ include file="/page/board.jsp" %>
			</div >
		</div>
		<div id="pagerightbox">
			<%@ include file="/page/right.jsp" %>
		</div>
	</div>
</div>

<!-- 후원 modal -->
<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
	     <div class="modal-content" style="width: 700px">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        	<h4 class="modal-title">페이지 후원</h4>
	       	</div><div class="container"></div>
	      	<div class="modal-body">
	      		<label>후원금액</label><br /> 
	
				<div class="form-inline" onchange="donate()">
					<input id="oneth" type="radio" name="money" value="1000" /> 
					<label for="oneth">1000원</label> &nbsp; &nbsp; &nbsp; &nbsp;
					<input id="thrth" type="radio" name="money" value="3000" /> 
					<label for="thrth">3000원</label> &nbsp; &nbsp; &nbsp; &nbsp;
					<input id="fivth" type="radio" name="money" value="5000" /> 
					<label for="fivth">5000원</label><br /> 
					<input id="tenth" type="radio" name="money" value="10000" /> 
					<label for="tenth">10000원</label> &nbsp; &nbsp; &nbsp;
					<input id="in" type="radio" name="money" value="in" /> 
					<label for="in">직접입력</label>
					<input class="form-control" onkeydown="in_donate(this)" id="in_money" type="text" name="in_money" style="width: 100px" disabled/><label>원</label>
				</div>
	
				<div class="form-inline" style="text-align:right">
					<label for="current_money">보유 포인트</label>
					<input class="form-control" type="text" id="cmoney" name="cmoney" value="" style="width: 100px" readonly/>원<br/>
					<label for="donate_money">- 후원 포인트</label>
					<input class="form-control" type="text" id="dmoney" name="dmoney" value="" style="width: 100px" readonly/>원<br/>
					<label for="after_money">= 예상 포인트</label>
					<input class="form-control" type="text" id="amoney" name="amoney" value="" style="width: 100px" readonly/>원<br/>
				</div>
				<a data-toggle="modal" href="#myModal2" class="btn btn-custom" onclick="chargeInit()">포인트 충전</a>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn" onclick="donateInit()">취소</a>
              <a data-toggle="modal" href="#myModal3" class="btn btn-custom" onclick="donateCheck()">후원하기</a>
            </div>
		</div>
	</div>
</div>
	
	<div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog modal-lg">
          <div class="modal-content" style="width: 700px">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">포인트 충전</h4>
            </div><div class="container"></div>
            <div class="modal-body">
            	<label>충전금액</label><br /> 
	
				<div class="form-inline" onchange="charge()">
					<input id="coneth" type="radio" name="chmoney" value="1000" /> 
					<label for="coneth">1000원</label> &nbsp; &nbsp; &nbsp; &nbsp;
					<input id="cthrth" type="radio" name="chmoney" value="3000" /> 
					<label for="cthrth">3000원</label> &nbsp; &nbsp; &nbsp; &nbsp;
					<input id="cfivth" type="radio" name="chmoney" value="5000" /> 
					<label for="cfivth">5000원</label><br /> 
					<input id="ctenth" type="radio" name="chmoney" value="10000" /> 
					<label for="ctenth">10000원</label> &nbsp; &nbsp; &nbsp;
					<input id="cin" type="radio" name="chmoney" value="cin" /> 
					<label for="cin">직접입력</label>
					<input class="form-control" onkeydown="cin_charge(this)" id="cin_money" type="text" name="cin_money" style="width: 100px" disabled/><label>원</label>
				</div>
	
				<div class="form-inline" style="text-align:right">
					<label for="ccurrent_money">보유 포인트</label>
					<input class="form-control" type="text" id="hmoney" name="hmoney" value="" style="width: 100px" readonly/>원<br/>
					<label for="charge_money">+ 충전 포인트</label>
					<input class="form-control" type="text" id="ccmoney" name="ccmoney" value="" style="width: 100px" readonly/>원<br/>
					<label for="cafter_money">= 예상 포인트</label>
					<input class="form-control" type="text" id="camoney" name="camoney" value="" style="width: 100px" readonly/>원<br/>
					<input type="hidden" id="mcheck" name="mcheck" value="${authInfo.mcheck }"/>
				</div>
		 	</div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn" onclick="chargeInit()">취소</a>
              <a data-toggle="modal" href="#myModal4" class="btn btn-custom" onclick="chargeCheck()">충전하기</a>
            </div>
          </div>
        </div>
    </div>	

	<div class="modal" id="myModal3" aria-hidden="true" style="display: none; z-index: 1070;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">후원 확인</h4>
            </div><div class="container"></div>
            <div id="dtxtModal" class="modal-body">
            	
            </div>      
           	<div id="dbtnModal"class="modal-footer">
             		
           	</div>
          </div>
        </div>
    </div>
	
	<div class="modal" id="myModal4" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 id="chTitle" class="modal-title"></h4>
            </div><div class="container"></div>
            <div id="ctxtModal" class="modal-body">
              	
            </div>
            <div id="cbtnModal"class="modal-footer">
	            
            </div>
          </div>
        </div>
    </div>
    
<!-- 게시판 modal -->

<div id="pbmodaldiv">
	<div class="modal" id="pbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-lg">
       		<div class="modal-content">
            	<div class="modal-header">
              		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              		<h4 class="modal-title">초기값</h4>
            	</div><div class="container"></div>
            	<div class="modal-body">
            		<p>초기값</p>
              		<a data-toggle="modal" href="#" class="btn btn-primary">Launch modal</a>
            	</div>
            	<div class="modal-footer">
              		<a href="#" data-dismiss="modal" class="btn">Close</a>
            	</div>
          	</div>
        </div>
    </div>
</div>

<div id="mbmodaldiv">
	<div class="modal" id="mbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-lg">
       		<div class="modal-content">
            	<div class="modal-header">
              		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              		<h4 class="modal-title">초기값</h4>
            	</div><div class="container"></div>
            	<div class="modal-body">
            		<p>초기값</p>
              		<a data-toggle="modal" href="#" class="btn btn-primary">Launch modal</a>
            	</div>
            	<div class="modal-footer">
              		<a href="#" data-dismiss="modal" class="btn">Close</a>
            	</div>
          	</div>
        </div>
    </div>
</div>

<div id="rmchkmodaldiv">
	<div class="modal" id="rmchkmodal" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-lg">
       		<div class="modal-content">
            	<div class="modal-header">
              		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              		<h4 class="modal-title">초기값</h4>
            	</div><div class="container"></div>
            	<div class="modal-body">
            		<p>초기값</p>
              		<a data-toggle="modal" href="#" class="btn btn-primary">Launch modal</a>
            	</div>
            	<div class="modal-footer">
              		<a href="#" data-dismiss="modal" class="btn">Close</a>
            	</div>
          	</div>
        </div>
    </div>
</div>

</body>
</html>