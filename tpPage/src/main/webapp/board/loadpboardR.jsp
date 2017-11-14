<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
 function ts(text, url) {
	 window.open("https://twitter.com/intent/tweet?text=" + text + "&url=" + url);
 }
</script>

<div class="modal" id="pbmodal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
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
            		<c:out value="${pboard.pbcontent}" />
            	</div>
            	<br><c:out value="192.168.0.48:8080/tpPage/page/${pboard.pbhostid }?pbid=${pboard.pbid }" />
            	<div id="pbrebox">
	            	<c:if test="${!empty authInfo }">
            		<hr style="margin:0px" />
		            <form:form commandName="pbrecmd" action="/tpPage/pbrewrite">
	            		<form:textarea path="pbcontent" required="required" rows="2" cols="auto" class="pbrecontent"
	            			style="width:100%; margin-top:5px; resize:none" placeholder="댓글을 입력해주세요"></form:textarea>
	            		<form:hidden path="pbid" value="${pboard.pbid }" />
	            		<form:hidden path="pbreid" value="${pboard.pbid }" />
	            		<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
	            		<p align="right"><input type="button" value="댓글쓰기" class="pbrew btn btn-custom"></p>
	            	</form:form>
	           		</c:if>
	           		<c:forEach var="pbrelist" items="${pbrelist }">
	            		<div>
	          				<hr style="margin:5px;" />
	          				
	          				<c:if test="${pbrelist.pbre_lev > 1 }">
	          					<c:forEach begin="2" end="${pbrelist.pbre_lev }" step="1">
	          						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          					</c:forEach>
	          				</c:if>
	          				↘<c:out value="${pbrelist.pbcontent }" />
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
	          				<div style="display: none">
								<form:form commandName="pbrecmd" action="/tpPage/pbrewrite" class="refrm">
									<form:textarea path="pbcontent" required="required" rows="1" cols="auto" class="pbrecontent"
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
	             	<a href="javascript:ts('test', 'http://192.168.0.48:8080/tpPage/page/${pboard.pbhostid }?pbid=${pboard.pbid }');">트위터</a>
	             	&nbsp;&nbsp;&nbsp;
	             	<c:choose>
	             		<c:when test="${pblikechk == 0 || pblikechk == null }">
	             			<a class="btn btn-custom" id="pblikebtn" onclick="pblike();">좋아요X</a>
	             		</c:when>
	             		<c:otherwise>
	             			<a class="btn btn-custom" id="pblikebtn" onclick="pblike();">좋아요O</a>
	             		</c:otherwise>
	             	</c:choose>
             	</c:if>
             	<!-- <a href="#" data-dismiss="modal" class="btn">Close</a> -->
            </div>
   		</div>
	</div>
</div> 