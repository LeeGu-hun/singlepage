<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ptop.css?ver=33" />

<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/top.js?ver=1"></script>

<div class='row' style="width:auto; margin:0px 0px 0px 0px">
    <div class='col-md-12'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          <div class="item active">         
            <div class="row">
              <c:if test="${fn:length(ptop) != 0}">
              <c:forEach var="list" varStatus="i" begin="0" end="2">
              <c:set var="list" value="${ptop[i.current] }" />
	              <c:if test="${i.count == list.turn }">
	              	<div class="col-md-4">
		              <a class="thumbnail" href="${list.url }"><img alt="" src="../tuploads/${list.newthum }"></a>
		            </div> 
	              </c:if>
              </c:forEach> 
              </c:if>
              <c:if test="${fn:length(ptop) == 0}">
                 <div class="col-md-4">
               		<a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              	 </div>          
              	 <div class="col-md-4">
                	<a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              	</div>
             	<div class="col-md-4">
                	<a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
             	</div>        
              </c:if>
            </div>           
          </div>
          <div class="item">
            <div class="row">
            <c:if test="${fn:length(ptop) > 3}">
              <c:forEach var="list" varStatus="i" begin="3" end="5">
              <c:set var="list" value="${ptop[i.current] }" />
	              <c:if test="${i.count == list.turn }">
	              	<div class="col-md-4">
		              <a class="thumbnail" href="${list.url }"><img alt="" src="../tuploads/${list.newthum }"></a>
		            </div> 
	              </c:if>
              </c:forEach>   
             </c:if>     
            </div>
          </div>
        </div>
        <c:if test="${fn:length(ptop) > 3}">
	        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
	        <a data-slide="next" href="#media" class="right carousel-control">›</a>
        </c:if>    
		  <div style="text-align: right">
			<c:if test="${authInfo.pid == page.pid }">
				<a class="btn btn-info btn-sm" href="/tpPage/topModify">수정</a>&nbsp;&nbsp;
			</c:if>
		  </div>
      </div>                          
    </div>
</div>
  