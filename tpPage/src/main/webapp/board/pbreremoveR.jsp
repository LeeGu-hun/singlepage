<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="pbrmmodaldiv">
	<div class="modal" id="pbrmmodal" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-lg">
       		<div class="modal-content">
            	<div class="modal-header">
              		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              		<h4 class="modal-title">삭제하시겠습니까?</h4>
            	</div><div class="container"></div>
            	<div class="modal-body">
            		<c:out value="${pbid }" />
            		//<c:out value="${rmpbid }" />
            		<br><a class="pbrermgo">삭제</a>
            		<input type="hidden" value="${pbid }" />
            		<input type="hidden" value="${rmpbid }" />
            		<a href="#" data-dismiss="modal" class="btn">취소</a>
            	</div>
            </div>
        </div>
    </div>
</div>