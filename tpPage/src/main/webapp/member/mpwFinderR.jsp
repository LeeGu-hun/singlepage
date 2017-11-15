<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form commandName="mpwfindcmd" action="mpwfmodal">
	<p>
		<label>
			<form:input path="mpwfmemail" placeholder="이메일을 입력하세요" class="form-control"/>
		</label>
	</p>
	<p><input type="submit" class="btn btn-custom" value="찾기" onclick="mpwfmodal(); " /></p>
</form:form>
