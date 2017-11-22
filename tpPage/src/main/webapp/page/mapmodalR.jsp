<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal" id="mapmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
   		<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          		<h4 class="modal-title">위치정보</h4>
        	</div><div class="container"></div>
        	<div class="modal-body" align="center">
        	<input type="hidden" id="mapmodalplatlng" value="${platlng }" >
        	<div id="mapdiv" style="width:600px; height:500px;"></div>
        	<br>
        	<c:choose>
        		<c:when test="${! empty ploc }">
		        	<label><c:out value="${ploc }" /></label>
        		</c:when>
        		<c:otherwise>
        			<label>위치정보가 없습니다.</label>
        		</c:otherwise>
        	</c:choose>
        	</div>
        	<div class="modal-footer">
          		<a href="" data-dismiss="modal" class="btn btn-custom">Close</a>
        	</div>
      	</div>
    </div>
</div>