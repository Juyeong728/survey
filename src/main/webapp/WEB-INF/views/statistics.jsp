<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
	.list {
		margin-top: 20px;
	}
</style>

<body>
	<div class="bs-docs-header" id="content" tabindex="-1">
	    <div class="container">
	        <h1>My survey</h1>
	  	</div>
	</div>
	<hr>
	
	<div class="container">
		<nav>
			<ul class="ch nav nav-tabs">
				<li class=""><a href="">Questions</a></li>
				<li class="active"><a href="#">Replies</a></li>
			</ul>
		</nav>
	
		
		<div class="sv container" role="main">
			<div class="col-lg-12">
				<h1>${survey.title }</h1>
		        <p>: ${survey.description }</p>
			</div>
		
				 
		<c:forEach items="${survey.questions}" var="question" varStatus="qstatus">
			<div class="question col-lg-12">
				<hr>
				<p>${question.q_value }</p>
				<c:choose>
				
					<c:when test="${question.q_type eq 'shortAns'}">
						<div class="item shortAns">
							<c:forEach items="${replies }" var="reply" varStatus="status">
								<c:choose>
								<c:when test="${question.q_idx eq reply.q_idx}">
									<c:forEach items="${reply.resp_items}" var="resp_item" varStatus="status">
										<input class="string form-control" placeholder="${resp_item.content }" type="text" disabled>		
									</c:forEach>				
								</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</c:when>
					
					<c:when test="${question.q_type eq 'longAns'}">
						<div class="item longAns">
							<c:forEach items="${replies }" var="reply" varStatus="status">
								<c:choose>
								<c:when test="${question.q_idx eq reply.q_idx}">
									<c:forEach items="${reply.resp_items}" var="resp_item" varStatus="status">
										<textarea class="string form-control" placeholder="${resp_item.content }" disabled></textarea>		
									</c:forEach>				
								</c:when>
								</c:choose>
							</c:forEach>
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
						<div id="piechart${qstatus.index}" style="width: 720px; height: 500px;"></div>
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
						<div id="barchart_values${qstatus.index}" style="width: 720px; height: 500px;"></div>				
					</c:when>
					
					<c:when test="${question.q_type eq 'dropDown'}">
						<select class="item dropdown form-control disabled" id="options_${question.q_idx}">
							<option>Select</option>
							<c:forEach items="${question.items}" var="item" varStatus="status">
								<option class="dropdown" value="${item.i_idx}" disabled>${item.i_value}</option>								
							</c:forEach>
						</select>
						<div id="piechart${qstatus.index}" style="width: 720px; height: 500px;"></div>
					</c:when>
					
				</c:choose> 
			</div>		
		</c:forEach>
		
			<div class="col-lg-12">
				<!-- 크기 container에 맞추기 -->		
			</div>
		</div>
	</div>

<c:forEach items="" varStatus="status">

</c:forEach>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['', ''],
          ${replyCntList[1]}
        ]);

        var options = {
          title: ''
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
</script>

 <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart(index) {
        var data = google.visualization.arrayToDataTable([
          ["", ""],
          ${replyCntList[2]}
        ]);

        var view = new google.visualization.DataView(data);

        var options = {
          width: 600,
          height: 400,
          bar: {groupWidth: "50%"},
          legend: { position: "none" },
        };
        var chart = new google.visualization.BarChart(document.getElementById("barchart_values2"));
        chart.draw(view, options);
    }
</script>

</body>
</html>