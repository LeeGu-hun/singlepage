<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
</head>
<body>
 	<form:form commandName="joincmd" action="memberJoin">
	<p>
		<label>이멜:<br>
		<form:input path="memail" />
		<form:errors path="memail" />
		</label>
	</p>
	<p>
		<label>이름:<br>
		<form:input path="mname" />
		<form:errors path="mname" />
		</label>
	</p>
	<p>
		<label>비밀번호:<br>
		<form:password path="mpw" />
		<form:errors path="mpw" />
		</label>
	</p>
	<p>
		<label>비밀번호 확인:<br>
		<form:password path="mpwconf" />
		<form:errors path="mpwconf" />
		</label>
	</p>
	
	<p>가입하면 약관은 자동동의</p>
	<input type="submit" value="가입 완료">
	</form:form>
</body>
</html>