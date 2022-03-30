<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 설문지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<style>
	.color {
	    back-ground-color: #cdbfe3;
	    }
</style>

<body>

	<div class="bs-docs-header" id="content" tabindex="-1">
	    <div class="container">
	        <h1>설문지</h1>
	  	</div>
	</div>

	<hr>
	<div class="container theme-showcase" role="main">
		<div class="jumbotron">
			<h1>Theme example</h1>
	        <p>This is a template showcasing the optional theme stylesheet included in Bootstrap. Use it as a starting point to create something more unique by building on or modifying it.</p>
		</div>
		
		<!--
		<c:forEach items="${questions}" var="question" varStatus="status">
			<c:choose>
				<c:when test="${questions.q_type eq 'shortAns'}">
					
				</c:when>
				<c:when test="${questions.q_type eq 'longAns'}">
					
				</c:when>
				<c:when test="${questions.q_type eq 'multipleChoice'}">
					
				</c:when>
				<c:when test="${questions.q_type eq 'checkBox'}">
					
				</c:when>
				<c:when test="${questions.q_type eq 'dropDown'}">
					
				</c:when>
			</c:choose> 		
		</c:forEach>
		-->
		
	</div>

</body>
</html>

