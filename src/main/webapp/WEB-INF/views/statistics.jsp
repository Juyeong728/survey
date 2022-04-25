<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        <h1>Survey</h1>
	  	</div>
	</div>
	
	<div class="col-lg-12">
	<nav>
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="#" class="showMySurveys">Projects</a></li>
			<li><a href="#">Services</a></li>
		</ul>
	</nav>

	
	<div class="sv container" role="main">
		<div class="col-lg-12">
			<h1>You completed it!</h1>
			<a class="list btn btn-primary" type="button" href="list">Back to the list</a>
			<!-- 크기 container에 맞추기 -->
			<div id="piechart" style="width: 720px; height: 500px;"></div>
		</div>
	</div>
	</div>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
</script>

</body>
</html>