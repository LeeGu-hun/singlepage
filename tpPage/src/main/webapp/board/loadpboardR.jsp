<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal" id="pbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              	<h4 class="modal-title">pb수정값</h4>
            </div>
            <div class="modal-body">
            	<c:out value="${pboard.pbid }" />
            	//<c:out value="${pboard.pbre_ref}" />
            	//<c:out value="${pboard.pbre_lev}" />
            	//<c:out value="${pboard.pbre_seq}" />
            	//<c:out value="${pboard.pbcontent}" />
            	<br><c:out value="192.168.0.48:8080/tpPage/page?host=${pboard.pbhostid }&pbid=${pboard.pbid }" />
            	<hr />
	            <div id="pbrebox">
		            <form:form commandName="pbrecmd" action="pbrewrite">
	            		<form:textarea path="pbcontent" class="pbrecontent"></form:textarea>
	            		<form:hidden path="pbid" value="${pboard.pbid }" />
	            		<form:hidden path="pbreid" value="${pboard.pbid }" />
	            		<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
	            		<p><input type="button" value="댓글쓰기" class="pbrew"></p>
	            	</form:form>
	           		<c:forEach var="pbrelist" items="${pbrelist }">
	            		<div>
	          				<hr style="margin:5px;" />
	          				<c:out value="${pbrelist.pbid }" />
	          				//<c:out value="${pbrelist.pbre_ref }" />
	          				//<c:out value="${pbrelist.pbre_lev }" />
	          				//<c:out value="${pbrelist.pbre_seq }" />
	          				//<c:out value="${pbrelist.pbcontent }" />
	          				<a class="pbrebtn">댓글쓰기</a>
	          				<div style="display: none">
								<form:form commandName="pbrecmd" action="pbrewrite" class="refrm">
									<form:textarea path="pbcontent" class="pbrecontent"></form:textarea>
									<form:hidden path="pbid" value="${pboard.pbid }" />
									<form:hidden path="pbreid" value="${pbrelist.pbid }" />
									<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
									<p><input type="button" value="댓글쓰기" class="pbrew"></p>
								</form:form>
							</div>
	          			</div>
	          		</c:forEach>
            	</div>
            </div>
            <div class="modal-footer">
             	<c:if test="${!empty authInfo }">
	             	<input type="hidden" id="nowpbid" name="nowpbid" value="${pboard.pbid }" />
            		<input type="hidden" id="pblikechk" name="pblikechk" value="${pblikechk }" />
	             	<c:choose>
	             		<c:when test="${pblikechk == 0 || pblikechk == null }">
	             			<a class="btn btn-primary" id="pblikebtn" onclick="pblike();">좋아요X</a>
	             		</c:when>
	             		<c:otherwise>
	             			<a class="btn btn-primary" id="pblikebtn" onclick="pblike();">좋아요O</a>
	             		</c:otherwise>
	             	</c:choose>
             	</c:if>
             	<a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
   		</div>
	</div>
</div> 