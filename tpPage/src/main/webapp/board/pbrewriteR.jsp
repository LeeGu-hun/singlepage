<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<%
	AuthInfo authinfo = (AuthInfo) request.getSession().getAttribute("authInfo"); 
	if(authinfo == null) {
%>

<script type="text/javascript">
	location.href="./login";
</script>

<% 
	} else {
%>

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

<%
	}
%>

