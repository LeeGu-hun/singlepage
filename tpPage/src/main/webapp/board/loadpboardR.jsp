<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% pageContext.setAttribute("renewLine", "\n"); %>

<script>
 function ts(text, url) {
	 window.open("https://twitter.com/intent/tweet?text=" + text + "&url=" + url);
 }
</script>

<div class="modal" id="pbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="min-width: 500px">
      		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              	<h4 class="modal-title"><c:out value="${pboard.pbsubject }" /></h4>
            </div>
            <div class="modal-body">
            	<p align="right"><label><c:out value="${pboard.mname }" />&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${pboard.pbdate }" pattern="MM-dd HH:mm" /></label></p>
            	<div align="center">
            		<c:if test="${!empty pboard.pbnewfile }">
            			<img src="/tpPage/buploads/pbuploads/${pboard.pbnewfile }" width="400px" />
            		</c:if>
            	</div>
            	<br>
            	<div style="word-break:break-word">
            		${fn:replace(pboard.pbcontent, newLineChar, "<br/>") }
            	</div>
            	<input type="text" id="shareurl" value="192.168.0.48:8080/tpPage/page/${pboard.pbhostid }?pbid=${pboard.pbid }"
            		style="position:absolute;top:-9999em;"/>
				<p align="right">
            		<a style="color: black;" href="javascript:ts('test', 'http://192.168.0.48:8080/tpPage/page/${pboard.pbhostid }?pbid=${pboard.pbid }');"><i class="fa fa-twitter fa-2x" aria-hidden="true"></i></a>
            		<a style="color: black;" class="sharebtn"><i class="fa fa-share fa-2x" aria-hidden="true"></i></a>
            	</p>
            	<div id="pbrebox">
	            	<c:if test="${!empty authInfo }">
            		<hr style="margin:0px; border-color: black;" />
		            <form:form commandName="pbrecmd" action="/tpPage/pbrewrite">
	            		<form:textarea path="pbcontent" required="required" rows="2" cols="auto" class="pbrecontent form-control"
	            			style="width:100%; margin-top:5px; resize:none" placeholder="댓글을 입력해주세요"></form:textarea>
	            		<form:hidden path="pbid" value="${pboard.pbid }" />
	            		<form:hidden path="pbreid" value="${pboard.pbid }" />
	            		<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
	            		<p align="right"><input type="button" value="댓글쓰기" class="pbrew btn btn-custom"></p>
	            	</form:form>
	           		</c:if>
	           		<c:forEach var="pbrelist" items="${pbrelist }">
	            		<div class="pbreboxrow">
	          				<hr style="margin:5px;" />
	          				<div style="display: inline-flex;" class="pbreboxmark">
	          				<c:if test="${pbrelist.pbre_lev > 1 }">
	          					<c:forEach begin="2" end="${pbrelist.pbre_lev }" step="1">
	          						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          					</c:forEach>
	          				</c:if>
	          				↘
	          				</div>
							<div style="display: inline-flex; word-break:break-word;" class="pbreboxcont">
	          				${fn:replace(pbrelist.pbcontent, newLineChar, "<br/>") }
							</div>	          				
	          				<p style="margin:0px;" align="right"><c:out value="${pbrelist.mname }" />&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${pboard.pbdate }" pattern="MM-dd HH:mm" />
	          				<c:if test="${authInfo.mid == pbrelist.pbwriterid }">
	          					<c:if test="${pbrelist.pbid > 0 }">
	          						<a class="pbrmbtn" style="color:red">삭제</a>
	          						<input type="hidden" value="${pbrelist.pbid }" />
	          					</c:if>
	          				</c:if>
							<c:if test="${!empty authInfo }">
          						<c:if test="${pbrelist.pbid > 0 }">
          							<a class="pbrebtn">댓글</a>
	          					</c:if>
	          				</c:if>
	          				</p>
	          				<c:if test="${!empty authInfo }">
	          				<div style="display: none">
								<form:form commandName="pbrecmd" action="/tpPage/pbrewrite" class="refrm">
									<form:textarea path="pbcontent" required="required" rows="1" cols="auto" class="pbrecontent form-control"
										style="width:100%; resize:none" placeholder="댓글을 입력해주세요"></form:textarea>
									<form:hidden path="pbid" value="${pboard.pbid }" />
									<form:hidden path="pbreid" value="${pbrelist.pbid }" />
									<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
									<p align="right"><input type="button" value="댓글쓰기" class="pbrew btn btn-custom btn-xs"></p>
								</form:form>
							</div>
	          				</c:if>
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
	             			<a class="btn btn-custom" id="pblikebtn" onclick="pblike();">좋아요X</a>
	             		</c:when>
	             		<c:otherwise>
	             			<a class="btn btn-custom" id="pblikebtn" onclick="pblike();">좋아요O</a>
	             		</c:otherwise>
	             	</c:choose>
             	</c:if>
             	<a href="#" data-dismiss="modal" class="btn btn-custom">닫기</a>
            </div>
   		</div>
	</div>
</div> 