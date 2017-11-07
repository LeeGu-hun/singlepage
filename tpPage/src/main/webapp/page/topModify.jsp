<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=313" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/topmodify.js?ver=1122"></script>

<div id="list">
	<div class="topList">
		<input type="checkbox" name="carousel" value="1"/>보이기 <hr>
		<div class="col-md-6">
			<label>링크: </label><input type="text" id="link" name="link" value=""/><br/><br/>
			<label>이미지: <input type="file" id="thum" name="thum" onchange="imgreadURL(this);"/></label>
		</div>
		<div class="col-md-6">
			<img id="tuploadImg" name="tuploadImg"/>
		</div>
	</div><br/>
</div>
<a href="#" onclick="addlist()"><img src="plus.png"></a>

<br/>

<div>
	<a class="btn btn-info btn-sm" href="./topModify">수정</a>
</div>