<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=313" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/topmodify.js?ver=11"></script>

<input type="hidden" id="realPath" value="<%=request.getRealPath("/tuploads/")%>" />

<form:form commandName="topcmd" id="frm" action="sendTop" enctype="multipart/form-data">
	<div id="list">
	<c:if test="${ptop == null}">
		<input type="hidden" id="originCnt" name="originCnt" value="0"/>
		<input type="hidden" id="count" name="count" value="1"/>
		<div class="topList">
			<input type="hidden" id = "turn1" name="turn" value="1" />
			<input type="hidden" id="checked1" name="checked" value="0" />
			<input type="checkbox" id="ck1" value="1" />보이기 <hr>
			<span class="delspan">
				<input type="button" class="btn btn-info btn-sm" id="del1" value="삭제" onclick="deleteList(1)" />
			</span>
			<div class="col-md-6">
				<label>링크: </label><input type="text" id="link1" name="link" required /><br/><br/>
				<label>이미지: <input type="file" id="thum1" name="thum" onchange="imgreadURL(this);" />
				<input type="hidden" id="tupdir1" name="tupdir" value="<%=request.getRealPath("/tuploads/")%>" />
				</label>
			</div>
			<div class="col-md-6">
				<img id="tuploadImg1" name="tuploadImg"/>
			</div>
		</div><br/>
	</c:if>
	<c:if test="${ptop != null}">
		<input type="hidden" id="originCnt" name="originCnt" value="${fn:length(ptop)}"/>
		<input type="hidden" id="count" name="count" value="${fn:length(ptop)}"/>
		<c:forEach var="list" items="${ptop }">
		<div class="topList">
			<input type="hidden" id="tid${list.turn }" name="tid" value="${list.tid }" />
			<input type="hidden"  id="turn${list.turn }" name="turn" value="${list.turn }" />
			<input type="hidden" id="checked${list.turn }" name="checked" value="${list.tcheck }" />
			<input type="checkbox" id="ck${list.turn }" value="${list.turn }" ${list.tcheck==0?'':'checked'} />보이기
			<span class="delspan">
				<input type="button" class="btn btn-info btn-sm" id="del${list.turn }" value="삭제" onclick="deleteList(${list.turn})" />
			</span>
			<hr>
			<div class="col-md-6">
				<label>링크: </label><input type="text" id="link${list.turn }" name="link" value="${list.url }" required /><br/><br/>
				<label>이미지: <input type="file" id="thum${list.turn }" name="thum" onchange="imgreadURL(this)" value="${list.thum }" />
				<input type="hidden" id="tupdir${list.turn }" name="tupdir" value="<%=request.getRealPath("/tuploads/")%>" />
				</label>
			</div>
			<div class="col-md-6">
				<img id="tuploadImg${list.turn }" name="tuploadImg" src="/tpPage/tuploads/${list.newthum }" style="width:200px; height: auto;"/>
			</div>
		</div><br/>
		</c:forEach>
	</c:if>
	</div>
	<a href="#" id="plus" onclick="addlist()"><img src="plus.png"></a>
	<br/>
	
	<div>
		<input type="submit" class="btn btn-info btn-sm" value="수정" />
	</div>
</form:form>