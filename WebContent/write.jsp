<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="write.css">
<title>Buy Page</title>
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="searchHouse.jsp">Housing in New Brunswick</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="searchHouse.jsp">Main Page</a></li>
				<li class="active"><a href="buy.jsp">Buy Page</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Access<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">Login</a></li>
						<li><a href="createUser.jsp">Create Account</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>

	<div class="container">
		<div class="row">

			<form method="post" action="writeAction.jsp">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="5">Posting Board</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<!-- type -->
							<td><input type="text" class="form-control"
								placeholder="type" name="type" maxlength="20"></td>
						<!-- condition -->		
							<td><input type="text" class="form-control"
								placeholder="condition" name="condition" maxlength="20"></td>
						<!-- room count -->
							<td><input type="text"class="form-control" 
							placeholder="room count" name="room_count" maxlength="10"></td>
						<!-- bathroom count -->	
							<td><input type="text"class="form-control" 
							placeholder="bathroom count" name="bathroom_count" maxlength="10"></td>
						<!-- additional notes -->	
							<td class="txtbox"><textarea type="text"
									class="form-control" placeholder="additional notes"
									name="additional_notes" maxlength="100"></textarea></td>
						</tr>
					</tbody>
					<input type="submit" class="btn btn-primary pull-right"
						value="Post">
				</table>
			</form>
		</div>
	</div>

</body>
</html>
