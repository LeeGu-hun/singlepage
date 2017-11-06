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
              	<h4 class="modal-title">수정</h4>
            </div>
            <div class="modal-body">
            	<p><c:out value="${pboard.pbid }" /></p>
            	<p><c:out value="${pboard.pbsubject }" /></p>
            	<p><c:out value="${pboard.pbcontent }" /></p>
            	<p><c:out value="${pboard.pbfile }" /></p>
            	<p><c:out value="${pboard.pbnewfile }" /></p>
            	<p><c:out value="${pboard.pbreadcount }" /></p>
            	<p><c:out value="${pboard.pbdate }" /></p>
            	<p><c:out value="${pboard.pbhostid }" /></p>
            	<p><c:out value="${pboard.pbwriterid }" /></p>
            	<p><c:out value="${pboard.pname }" /></p>
            	<p><c:out value="${pboard.mname }" /></p>
            </div>
            <hr style="margin:0px;" />
            <div class="modal-body">
            	<form:form commandName="pbrecmd" action="pbrewrite">
            		<p><form:textarea path="pbrecontent" class="pbrecontent"></form:textarea></p>
            		<form:hidden path="pbid" value="${pboard.pbid }" />
            		<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
            		<p><input type="submit" value="댓글쓰기" onclick="pbrewrite(); "></p>
            	</form:form>
            	<div id="pbrebox">
            		<div>
            		<c:forEach var="pbrelist" items="${pbrelist }">
            		<div>
            			<hr style="margin:0px;" />
				       	<c:out value="${pbrelist.pbid }" />
  						//<c:out value="${pbrelist.pbcontent }" />
 						//<c:out value="${pbrelist.pbre_ref }" />
						//<c:out value="${pbrelist.pbre_lev }" />
						//<c:out value="${pbrelist.pbre_seq }" />
						//<c:out value="${pbrelist.pbhostid }" />
						//<c:out value="${pbrelist.pbwriterid }" />
				        //<a class="rebtn">댓글쓰기</a>
				        <div style="display:none">
				        	<form:form commandName="pbrerecmd" action="pbrerewrite">
            					<p><form:textarea path="pbrecontent" class="pbrecontent"></form:textarea></p>
            					<form:hidden path="pbid" value="${pboard.pbid }" />
            					<form:hidden path="pbreid" value="${pbrelist.pbid }" />
            					<form:hidden path="pbhostid" value="${pboard.pbhostid }" />
            					<p><input type="submit" value="댓글쓰기" onclick="pbrerewrite(); "></p>
            				</form:form>
				        </div>
            		</div>
            		</c:forEach>
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
             	<a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
   		</div>
	</div>
</div> 