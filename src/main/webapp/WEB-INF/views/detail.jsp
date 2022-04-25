<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지</title>
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
	.submit {
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
	        <h1>Join this survey</h1>
	  	</div>
	</div>

	<hr>
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
							<input class="string form-control" type="text">						
						</div>
					</c:when>
					<c:when test="${question.q_type eq 'longAns'}">
						<div class="item longAns">
							<textarea class="string form-control"></textarea>
						</div>
					</c:when>
					<c:when test="${question.q_type eq 'multipleChoice'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item radio">
								<label>
									<input type="radio" class="radio" name="options_${question.q_idx}" value="${item.i_idx}">
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'checkBox'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item checkbox">
								<label>
									<input type="checkbox" class="checkbox" name="options_${question.q_idx}" value="${item.i_idx}">
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'dropDown'}">
						<select class="item dropdown form-control" id="options_${question.q_idx}">
							<option>Select</option>
							<c:forEach items="${question.items}" var="item" varStatus="status">
								<option class="dropdown" value="${item.i_idx}">${item.i_value}</option>								
							</c:forEach>
						</select>
					</c:when>
				</c:choose> 
			</div>		
		</c:forEach>
		
		<button class="submit btn btn-default" type="submit">Submit</button>
		<a class="list btn btn-primary" type="button" href="list">Back to the list</a>

	</div>
	

<script>
$(document).on('click', '.submit', function () {
	let response = {
			s_idx : ${survey.s_idx},
			u_name : '${user.u_name}',
			r_contents : []
	};

	$(".question").each(function( index ) {
		let contents = {
				s_idx : ${survey.s_idx},
				q_idx : ${firstQ_idx}+index,
				resp_items : [],
		}

		let tmp = $(this).children().first().next().next();
		//
		if(tmp.hasClass("item") == true) {
			$(".item").each(function( index ) {
				let i_content = {};

				tmp.find("input.checkbox:checked").each(function( index ) {
					i_content.i_idx = $(this).val();
					i_content.content = null;

					contents.resp_items.push(i_content);
				});//checkbox

				tmp.find("input.radio:checked").each(function( index ) {
					i_content.i_idx = $(this).val();
					i_content.content = null;

					contents.resp_items.push(i_content);
				});//radio

				tmp.find("option.dropdown:selected").each(function( index ) {
					i_content.i_idx = $(this).val();
					i_content.content = null;

					contents.resp_items.push(i_content);
				});//dropdown

				tmp.find("input.string").each(function( index ) {
					i_content.i_idx = 0;
					i_content.content = $(this).val();

					contents.resp_items.push(i_content);
				});//shortAns

				tmp.find("textarea.string").each(function( index ) {
					i_content.i_idx = 0;
					i_content.content = $(this).val();

					contents.resp_items.push(i_content);
				});//longAns
				
				tmp = tmp.next();
				
				if(tmp.hasClass("item") == false) {
					return false;
				}
			});
		} else {

		}
		response.r_contents.push(contents);
	});

	let response_result = JSON.stringify(response);
	$.ajax({
		method: "POST",
		url: "/respond",
		data: response_result,
		contentType: "application/json",
		success: function(data) {
			let url = "/complete";
			location.replace(url);
		}
	})
});

</script>	

</body>
</html>

