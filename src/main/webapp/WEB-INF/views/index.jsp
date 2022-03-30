<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<sec:authentication property="principal" var="user" />
<body>
	<h1>Survey</h1>
	<div>
		<sec:authorize access="isAnonymous()">
			<div>
				<a href="/beforeSignUp">Sign Up</a>
			</div>
			<div>
				<a href="/login">Login</a>
			</div>
			<div>
				<a href="/createSurvey">Create a Survey</a>
			</div>
			<div>
				<a href="/list">Join current Surveys</a>
			</div>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			<hr>
			<div class="mydiv">${user.u_name} 님 로그인 중입니다.</div>
			<hr>
			<div>
				<a href="/createSurvey">Create a Survey</a>
			</div>
			<div>
				<a href="/list">Join current Surveys</a>
			</div>
		</sec:authorize>
	</div>
</body>
</html>