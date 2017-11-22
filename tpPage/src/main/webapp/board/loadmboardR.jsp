<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% pageContext.setAttribute("renewLine", "\n"); %>
    
<div class="modal" id="mbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="min-width: 500px">
      		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              	<h4 class="modal-title"><c:out value="${mboard.mbsubject }" /></h4>
            </div>
            <div class="modal-body">
            	<p align="right"><label><c:out value="${mboard.mname }" />&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${mboard.mbdate }" pattern="MM-dd HH:mm" /></label></p>
            	<div align="center">
            		<c:if test="${!empty mboard.mbnewfile }">
            			<img src="/tpPage/buploads/mbuploads/${mboard.mbnewfile }" width="400px" />
            		</c:if>
            	</div>
            	<br>
            	<div style="word-break:break-word">
            		${fn:replace(mboard.mbcontent, newLineChar, "<br/>") }
            	</div>
            	<br>
            	<div id="mbrebox">
            		<c:if test="${!empty authInfo }">
            		<hr style="margin:0px; border-color: black;"/>
		            <form:form commandName="mbrecmd" action="/tpPage/mbrewrite">
	            		<form:textarea path="mbcontent" required="required" rows="2" cols="auto" class="mbrecontent form-control"
	            			style="width:100%; margin-top:5px; resize:none" placeholder="댓글을 입력해주세요"></form:textarea>
	            		<form:hidden path="mbid" value="${mboard.mbid }" />
	            		<form:hidden path="mbreid" value="${mboard.mbid }" />
	            		<form:hidden path="mbhostid" value="${mboard.mbhostid }" />
	            		<p align="right"><input type="button" value="댓글쓰기" class="mbrew btn btn-custom"></p>
	            	</form:form>
	           		</c:if>
	           		<c:forEach var="mbrelist" items="${mbrelist }">
	            		<div class="mbreboxrow">
	          				<hr style="margin:5px;" />
	          				<div style="display: inline-flex;" class="mbreboxmark">
	          				<c:if test="${mbrelist.mbre_lev > 1 }">
	          					<c:forEach begin="2" end="${mbrelist.mbre_lev }" step="1">
	          						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          					</c:forEach>
	          				</c:if>
	          				↘
	          				</div>
	          				<div style="display: inline-flex; word-break:break-word" class="mbreboxcont">
	          				${fn:replace(mbrelist.mbcontent, newLineChar, "<br/>") }
	          				</div>
	          				<p style="margin:0px" align="right"><c:out value="${mbrelist.mname }" />&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${mboard.mbdate }" pattern="MM-dd HH:mm" />
	          				<c:if test="${authInfo.mid == mbrelist.mbwriterid || authInfo.mid == mbrelist.mbhostid }">
	          					<c:if test="${mbrelist.mbid > 0 }">
	          						<a class="mbrmbtn" style="color:red">삭제</a>
	          						<input type="hidden" value="${mbrelist.mbid }" />	
	          					</c:if>
	          				</c:if>
	          				<c:if test="${!empty authInfo }">
	          					<c:if test="${mbrelist.mbid > 0 }">
	          						<a class="mbrebtn">댓글</a>
	          					</c:if>
							</c:if>
							</p>
							<c:if test="${!empty authInfo }">
	          				<div style="display: none">
								<form:form commandName="mbrecmd" action="/tpPage/mbrewrite" class="refrm">
									<form:textarea path="mbcontent" required="required" rows="1" cols="auto" class="mbrecontent form-control"
										style="width:100%; resize:none" placeholder="댓글을 입력해주세요"></form:textarea>
									<form:hidden path="mbid" value="${mboard.mbid }" />
									<form:hidden path="mbreid" value="${mbrelist.mbid }" />
									<form:hidden path="mbhostid" value="${mboard.mbhostid }" />
									<p align="right"><input type="button" value="댓글쓰기" class="mbrew btn btn-custom btn-xs"></p>
								</form:form>
							</div>
							</c:if>
	          			</div>
	          		</c:forEach>
            	</div>
            </div>
            <div class="modal-footer">
             	<a href="#" data-dismiss="modal" class="btn btn-custom">닫기</a>
            </div>
   		</div>
	</div>
</div> 