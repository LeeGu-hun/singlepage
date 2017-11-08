<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<div class="modal" id="mbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              	<h4 class="modal-title">mb수정값</h4>
            </div>
            <div class="modal-body">
            	<c:out value="${mboard.mbid }" />
            	//<c:out value="${mboard.mbre_ref}" />
            	//<c:out value="${mboard.mbre_lev}" />
            	//<c:out value="${mboard.mbre_seq}" />
            	//<c:out value="${mboard.mbcontent}" />
	            <div id="mbrebox">
            		<c:if test="${!empty authInfo }">
            		<hr />
		            <form:form commandName="mbrecmd" action="/tpPage/mbrewrite">
	            		<form:textarea path="mbcontent" class="mbrecontent"></form:textarea>
	            		<form:hidden path="mbid" value="${mboard.mbid }" />
	            		<form:hidden path="mbreid" value="${mboard.mbid }" />
	            		<form:hidden path="mbhostid" value="${mboard.mbhostid }" />
	            		<p><input type="button" value="댓글쓰기" class="mbrew"></p>
	            	</form:form>
	           		</c:if>
	           		<c:forEach var="mbrelist" items="${mbrelist }">
	            		<div>
	          				<hr style="margin:5px;" />
	          				<c:out value="${mbrelist.mbid }" />
	          				//<c:out value="${mbrelist.mbre_ref }" />
	          				//<c:out value="${mbrelist.mbre_lev }" />
	          				//<c:out value="${mbrelist.mbre_seq }" />
	          				//<c:out value="${mbrelist.mbcontent }" />
	          				<c:if test="${authInfo.mid == mbrelist.mbwriterid }">
	          				<a>삭제</a>	
	          				</c:if>
	          				<c:if test="${!empty authInfo }">
	          				<a class="mbrebtn">댓글쓰기</a>
	          				<div style="display: none">
								<form:form commandName="mbrecmd" action="/tpPage/mbrewrite" class="refrm">
									<form:textarea path="mbcontent" class="mbrecontent"></form:textarea>
									<form:hidden path="mbid" value="${mboard.mbid }" />
									<form:hidden path="mbreid" value="${mbrelist.mbid }" />
									<form:hidden path="mbhostid" value="${mboard.mbhostid }" />
									<p><input type="button" value="댓글쓰기" class="mbrew"></p>
								</form:form>
							</div>
							</c:if>
	          			</div>
	          		</c:forEach>
            	</div>
            </div>
            <div class="modal-footer">
             	<a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
   		</div>
	</div>
</div> 