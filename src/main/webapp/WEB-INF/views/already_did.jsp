<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joined</title>
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

	<hr>
	<div class="sv container" role="main">
		<div class="col-lg-12">
			<h1>You already joined this survey!</h1>
			<p> Join another survey.</p>
			<a class="list btn btn-primary" type="button" href="list">Back to the list</a>
		</div>
	</div>
</body>
</html>