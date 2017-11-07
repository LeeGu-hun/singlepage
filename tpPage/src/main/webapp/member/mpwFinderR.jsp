<%@page import="member.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form commandName="mpwfindcmd" action="mpwfmodal">
	<p>
		<label>
			<form:input path="mpwfmemail" placeholder="이메일을 입력해줘야돼요"/>
		</label>
	</p>
	<p><input type="submit" value="이메일똑바로!" onclick="mpwfmodal(); " /></p>
</form:form>
