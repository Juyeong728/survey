<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 없음</title>
<style>
	button {
		height: 30px;
		border: none;
		font-size: 16px;
		background-color: skyblue;
		cursor: pointer;
		color: white;
		margin-right: 5px;
		margin-top: 10px;
		padding: 0 20px;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
	}
</style>
</head>
<body>
<h1>권한이 없습니다.</h1>
<button type="button" onclick="location.href='login' ">Sign in</button>
</body>
</html>