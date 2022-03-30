<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<body>

    <div class="container">
        <form action="/signup" method="post">
    		<h1>Please Sign Up!</h1>
        	<hr>
            
            <label for="inputEmail">Email address</label>
	        <input type="text" id="inputEmail" class="form-control" placeholder="Email address" name="username">
	        <hr>
            <label for="inputName">Name</label>
	        <input type="text" id="inputName" class="form-control" placeholder="Name" name="u_name">
	        <hr>
            <label for="inputPassword">Password</label>
	        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password">
            <hr>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        </div>
</body>

</html>