<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My survey</title>
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
		padding-bottom: 35px;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
	}
	.update {
		margin-top: 30px;
		margin-left: 14px;
	}
	.list {
		margin-top: 30px;
	}
</style>

<body>

	<div class="bs-docs-header" id="content" tabindex="-1">
	    <div class="container">
	        <h1>My survey</h1>
	  	</div>
	</div>
	<hr>
	
	<div id="content" class="container">
		<nav>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Questions</a></li>
				<li class="reply"><a href="result-chart">Replies</a></li>
			</ul>
		</nav>
		
	<div class="sv container" role="main">
		<div class="col-lg-12">
			<h1>${survey.title }</h1>
	        <p>: ${survey.description }</p>
		</div>
		
				 
		<c:forEach items="${survey.questions}" var="question" varStatus="status">
			<div class="question col-lg-12">
				<hr>
				<p>${question.q_value }</p>
				<c:choose>
					<c:when test="${question.q_type eq 'shortAns'}">
						<div class="item shortAns">
							<input class="string form-control" type="text" disabled>						
						</div>
					</c:when>
					<c:when test="${question.q_type eq 'longAns'}">
						<div class="item longAns">
							<textarea class="string form-control" disabled></textarea>
						</div>
					</c:when>
					<c:when test="${question.q_type eq 'multipleChoice'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item radio disabled">
								<label>
									<input type="radio" class="radio" name="options_${question.q_idx}" value="${item.i_idx}" disabled>
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'checkBox'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item checkbox disabled">
								<label>
									<input type="checkbox" class="checkbox" name="options_${question.q_idx}" value="${item.i_idx}" disabled>
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'dropDown'}">
						<select class="item dropdown form-control disabled" id="options_${question.q_idx}">
							<option>Select</option>
							<c:forEach items="${question.items}" var="item" varStatus="status">
								<option class="dropdown" value="${item.i_idx}" disabled>${item.i_value}</option>								
							</c:forEach>
						</select>
					</c:when>
				</c:choose> 
			</div>		
		</c:forEach>
		
		<a class="update btn btn-default" type="button">Update</a>
		<a class="list btn btn-primary" type="button" href="list">Back to the list</a>

	</div>
	</div>

<script>
$(document).on('click', '.reply', function () {

	$.ajax({
		  method: "POST",
		  url: "/reply-chart",
		  data: { s_idx: ${survey.s_idx}  }
		})
		.done(function( msg ) {
			$('#content').html(msg);
		});
})
</script>	

</body>
</html>