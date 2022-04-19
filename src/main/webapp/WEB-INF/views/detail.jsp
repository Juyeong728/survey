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
	        <h1>Survey</h1>
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
						<input class="item form-control" type="text">
					</c:when>
					<c:when test="${question.q_type eq 'longAns'}">
						<textarea class="item form-control"></textarea>
					</c:when>
					<c:when test="${question.q_type eq 'multipleChoice'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item radio">
								<label>
									<input type="radio" name="options_${question.q_idx}" value="${item.i_idx}">
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'checkBox'}">
						<c:forEach items="${question.items}" var="item" varStatus="status">
							<div class="item checkbox">
								<label>
									<input type="checkbox" name="options_${question.q_idx}" value="${item.i_idx}">
	    								${item.i_value}
	  							</label>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${question.q_type eq 'dropDown'}">
						<select class="item dropdown form-control" id="options_${question.q_idx}">
							<option>Select</option>
							<c:forEach items="${question.items}" var="item" varStatus="status">
								<option class="item dropdown" value="${item.i_idx}">${item.i_value}</option>								
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
			r_date : 
			r_contents : []
	};

	$(".question").each(function( index ) {
		let contents = {
				s_idx : ${survey.s_idx},
				q_idx : ${question.q_idx},
				i_idx : {},
				content : {}
		}

		let tmp = $(this);
		//
		if(tmp.hasClass("item") == true) {
			if(tmp.hasClass("checkbox")) {//checkbox(item 여러 번 돌리기)
				let ans = $("input:checkbox[name='options_"${question.q_idx}"']").val();
			} else if(tmp.hasClass("radio")) {
				$(".item").each(function( index ) {
					let ans = $('input:[name="options_'${question.q_idx}'"]:checked').val();

					contents.i_idx.push(ans);
					contents.content.push(null);

					tmp = tmp.next();
						
					if(tmp.hasClass("item") == false) {
						return false;
					}	
				});
			} else if(tmp.hasClass("dropdown")) {
				$(".item").each(function( index ) {
					let ans = $("#options_"${question.q_idx}" option:selected").val();

					contents.i_idx.push(ans);
					contents.content.push(null);

					tmp = tmp.next();
						
					if(tmp.hasClass("item") == false) {
						return false;
					}	
				});
			} else { //단답형 or 장문형
				let ans = tmp.children().first().next().next().val();
				contents.i_idx.push(0);
				contents.content.push(ans);
			}
		} else {
			
		}
		response.r_contents.push(contents);
	});

	let response_result = JSON.stringify(response);
	$.ajax({
		
	})
});

</script>	

</body>
</html>

