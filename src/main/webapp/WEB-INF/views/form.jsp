<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<body>
<sec:authentication property="principal" var="user" />

<div class="bs-docs-header" id="content" tabindex="-1">
    <div class="container">
        <h1>설문지</h1>
  	</div>
</div>

<hr>
<div class="container">
	<div class="jumbotron">
		<form>
			<div class="form-group">
				<input type="text" class="survey form-control input-lg" placeholder="설문지 제목">
			</div>
			<div class="form-group">
				<textarea class="description form-control" rows="3" placeholder="설문지 설명"></textarea>
			</div>
		</form>
	</div>			
		
	<div class="question jumbotron">
		<form class="row form-group">
			<div class="col-md-9">
				<input type="text" class="form-control input-lg" placeholder="질문 제목">
			</div>
			<div class="col-md-3">
				<select name="qKind" class="questionOption form-control input-lg">
					<option value="none">===선택===</option>
					<option value="shortAns">단답형</option>
					<option value="longAns">장문형</option>
					<option value="multipleChoice">객관식 질문</option>
					<option value="checkBox">체크박스</option>
					<option value="dropDown">드롭다운</option>
				</select>
			</div>
		</form>
				
		<!-- Items -->
				
		<br>
		<button type="button" class="deleteQuestion btn btn-default col-md-offset-10" qMaster="${sv.sNo}" qIndex="${q.qIndex}">
			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 질문 삭제
		</button>
	</div>
		
	<!-- question, panel -->
			
	<!-- sidebar -->
     
	<div>
		<br>
		<button type="button" class="addQuestion btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 질문 추가하기
		</button>
	</div>
	<br>
	<div>
		<button type="button" class="submit btn btn-default">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 작성하기
		</button>
	</div>	
</div>

<!------------------------------------------------------------------------->

<script>

$(document).on('change', '.questionOption', function () {
	while(true) {
		if($(this).parent().parent().next().hasClass("item2") == true || $(this).parent().parent().next().hasClass("addItemM") == true || $(this).parent().parent().next().hasClass("addItemC") == true) {
			$(this).parent().parent().next().remove();
		} else {
			break;	
		}
	}
	if($(this).val() == "shortAns") {
		$(this).parent().prev().children().prop("placeholder", "질문")
		$(this).parent().parent().after("<div class='item2'><input class='item form-control' type='text' placeholder='단답형 텍스트' disabled></div>")
	} else if($(this).val()  == "longAns") {
		$(this).parent().prev().children().prop("placeholder", "질문")
		$(this).parent().parent().after("<div class='item2'><textarea class='item form-control' placeholder='장문형 텍스트' disabled></textarea></div>")
	} else if($(this).val()  == "multipleChoice") {
		$(this).parent().prev().children().prop("placeholder", "질문")
		$(this).parent().parent().after("<div class='item2 row'><div class='item radio disabled'><label class='col-md-8'><input type='radio' name='optionsRadios' value='option1' disabled><input type='text' class='form-control' placeholder='옵션'></label><button type='button' class='deleteItem btn btn-default'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 삭제</button></div><!--Added option --></div><button type='button' class='addItemM btn btn-default'><span class='glyphicon glyphicon-th-list' aria-hidden='true'></span> 옵션 추가</button>");
	} else if($(this).val()  == "checkBox") {
		$(this).parent().prev().children().prop("placeholder", "질문")
		$(this).parent().parent().after("<div class='item2 row'><div class='item checkbox disabled'><label class='col-md-8'><input type='checkbox' name='optionsCheckbox' value='option1' disabled><input type='text' class='form-control' placeholder='옵션'></label><button type='button' class='deleteItem btn btn-default'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 삭제</button></div><!--Added option --></div><button type='button' class='addItemC btn btn-default'><span class='glyphicon glyphicon-th-list' aria-hidden='true'></span> 옵션 추가</button>");
	} else if($(this).val()  == "dropDown") {
		$(this).parent().prev().children().prop("placeholder", "질문")
		$(this).parent().parent().after("<div class='item2 row'><div class='item checkbox disabled'><label class='col-md-8'><input type='checkbox' name='optionsDropdown' value='option1' disabled><input type='text' class='form-control' placeholder='옵션'></label><button type='button' class='deleteItem btn btn-default'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 삭제</button></div><!--Added option --></div><button type='button' class='addItemC btn btn-default'><span class='glyphicon glyphicon-th-list' aria-hidden='true'></span> 옵션 추가</button>")
	} else if($(this).val()  == "none") {
		$(this).parent().prev().children().prop("placeholder", "질문 제목")
	}
});

$(document).on('click', '.addQuestion', function () {
	$(this).parent().parent().children().last().prev().prev().prev().after
	("<div class='question jumbotron'><form class='row form-group'><div class='col-md-9'><input type='text' name='' class='form-control input-lg' placeholder='질문 제목'></div><div class='col-md-3'><select name='qKind' class='questionOption form-control input-lg'><option value='none'>===선택===</option><option value='shortAns'>단답형</option><option value='longAns'>장문형</option><option value='multipleChoice'>객관식 질문</option><option value='checkBox'>체크박스</option><option value='dropDown'>드롭다운</option></select></div></form><br><button type='button' class='deleteQuestion btn btn-default col-md-offset-10' qMaster='${sv.sNo}' qIndex='${q.qIndex}'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span> 질문 삭제</button></div>")
});

$(document).on('click', '.addItemM', function () {
	$(this).prev().children().last().after("<div class='item radio disabled'><label class='col-md-8'><input type='radio' name='optionsRadios' value='option1' disabled><input type='text' class='form-control' placeholder='옵션'></label><button type='button' class='deleteItem btn btn-default' aria-label='Left Align'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 삭제</button></div>");
});

$(document).on('click', '.addItemC', function () {
	$(this).prev().children().last().after("<div class='item checkbox disabled'><label class='col-md-8'><input type='checkbox' name='optionsCheckbox' value='option1' disabled><input type='text' class='form-control' placeholder='옵션'></label><button type='button' class='deleteItem btn btn-default' aria-label='Left Align'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 삭제</button></div>");
});

$(document).on('click', '.submit', function () {
	let survey = {
			u_idx : '${user.username}',
			title : $(".survey").val(),
			description : $(".description").val(),
			questions : []
	};

	$(".question").each(function( index ) {
		let question = {
				q_value : $(this).children().first().children().first().children().val(),
				q_type : $(this).children().first().children().first().next().children().val(),
				items : []
		}
		
		let tmp = $(this).children().first().next().children();
		//item2의 children().first()
		if(tmp.hasClass("item") == true) {
			$(".item").each(function( index ) {
				let item = {};
				
				item.i_value = tmp.children().first().children().last().val();
				question.items.push(item);
				
				tmp = tmp.next();
				
				if(tmp.hasClass("item") == false) {
					return false;
				}
			});
		} else {
			question.items.push(null);
		}
		survey.questions.push(question);
	});
	
	let surveyresult = JSON.stringify(survey);
	$.ajax({
		method: "POST",
		url: "/createSurvey/process",
		data: surveyresult,
		contentType : "application/json",
		success: function(data) {
			let url = "/complete";
			location.replace(url);
		}
	})	
});

$(document).on('click', '.deleteQuestion', function () {
	$(this).parent().remove();
});

$(document).on('click', '.deleteItem', function () {		
	$(this).parent().remove();
});

</script>
	
</body>

</html>