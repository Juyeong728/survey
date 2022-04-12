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
	body {
	    background-color: #ede7f6;
	    }
	.sv {
		background-color: white;
		padding-top: 20px;
		padding-bottom: 20px;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
	}
</style>

<body>

	<div class="bs-docs-header" id="content" tabindex="-1">
	    <div class="container">
	        <h1>설문지</h1>
	  	</div>
	</div>

	<hr>
	<div class="sv container" role="main">
		<div class="col-lg-8">
			<h1>${survey.title }</h1>
	        <p>${survey.description }</p>
		</div>
		
		 
		<c:forEach items="${questions}" var="question" varStatus="status">
			<p>${question.q_value }</p>
			<c:choose>
				<c:when test="${question.q_type eq 'shortAns'}">
					
				</c:when>
				<c:when test="${question.q_type eq 'longAns'}">
					
				</c:when>
				<c:when test="${question.q_type eq 'multipleChoice'}">
					
				</c:when>
				<c:when test="${question.q_type eq 'checkBox'}">
					
				</c:when>
				<c:when test="${question.q_type eq 'dropDown'}">
					
				</c:when>
			</c:choose> 		
		</c:forEach>
		
		
	</div>

</body>
</html>

