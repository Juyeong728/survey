<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
.row {
	text-align: center;
}
.sv {
	margin-top: 30px;
	margin-bottom: 10px;
	height: 350px;
}
.pagination {
	text-align: center;
}

</style>
</head>


<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
          	<!-- 
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
             -->
            <a class="btn btn-success" href="/login">Sign in</a>
            <a class="btn btn-success" href="/beforeSignUp">Sign up »</a>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
	</nav>


	
	<div class="container">
	
		<div class="masthead">
	        <h3 class="text-muted">Project name</h3>
	        <nav>
	          <ul class="nav nav-justified">
	            <li><a href="#">Home</a></li>
	            <li class="active"><a href="#" class="showMySurveys">Projects</a></li>
	            <li><a href="#">Services</a></li>
	            <li><a href="#">About</a></li>
	            <li><a href="#">Contact</a></li>
	          </ul>
	        </nav>
      	</div>
      	
      	<div id="content">
		<div class="jumbotron">
	        <h1>Create your survey!</h1>
	        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.</p>
	        <p><a class="btn btn-lg btn-success" href="/createSurvey" role="button">Get started »</a></p>
      	</div>
      	</div>
      	
      	<div class="row">
      		<!--  
		      <div class="col-md-12">
		         <h2>My current surveys</h2>
		       </div>
		     -->
	      	<c:forEach items="${list}" var="survey" varStatus="status">
	      		<div class="sv col-lg-4">
	      		<img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
		          <h2>${survey.title}</h2>
		          <p>${survey.description}</p>
		          <p><a class="btn btn-default" href="detail?s_idx=${survey.s_idx}" role="button">Join this survey »</a></p>
		        </div>
	      	</c:forEach>
      	</div>
      	
	
	
<!-- pagination -->	
		<div class="pagination">
			<nav>
				<ul class="pagination pagination-lg">
					<c:choose>
						<c:when test="${ pagination.prevPage ge 5}">
							<li>
								<a href="list?page=${pagination.prevPage}">◀</a>
							</li>
						</c:when>
					</c:choose> 
					
					<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
						
							<c:choose>
								<c:when test="${ pagination.page eq i }">
									<li style="background-color:#ededed;">
										<span>${i}</span>
									</li>
								</c:when>
								<c:when test="${ pagination.page ne i }">
									<li>
										<a href="list?page=${i}">${i}</a>
									</li>
								</c:when>
							</c:choose>
							
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pagination.nextPage le pagination.lastPage }">
							<li>
								<a href="list?page=${pagination.nextPage}">▶</a>
							</li>
						</c:when>
					</c:choose>
					
				</ul>
			</nav>
		</div>
	
      	<hr class="featurette-divider">

      	<footer>
        	<p>© Company 2022</p>
      	</footer>
	</div>	
<script>
	document.getElementById("searchBtn").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "listPageSearch?page=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>


</body>
</html>