<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="searchStyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<meta charset="ISO-8859-1">
<title>Search for housing</title>
</head>

<body class="bg-info">

<!-- 6 houses on cover  -->
	<div class="text-center container-fluid">
		<img class="img-responsive img-rounded center-block" id ="six"
			src="https://www.montgomerycountymd.gov/PortalImages/InfoCentral/Feature/38/2017/workforce-housing.png"
			alt="housing" height="500" width="300">
		<h1 id="title" class="text-center">Find housing in New Brunswick</h1>
		<p>Are you looking to buy or rent?</p>
		
		
		
<!-- Popup for Search -->
			<form>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#checker').click(function() {
						checked = $("input[type=radio]:checked").length;
						if (!checked) {
							alert("You must choose buy or rent.");
							return false;
						}
					});
				});
			</script>
<!-- Login -->
			<div>
				<ul class="pager">
					<li class="login"><a href="login.jsp">Login Page</a></li>
				</ul>
			</div>
			
			
			<div id="buySell">
				<input type="radio" name="id" value="buy" >Buy 
				<input type="radio" name="id" value="rent">Rent
			</div>

			<div id=house></div>

			<button class="btn btn-primary active" id="checker" type="submit">Search</button>
			</form>
		
	</div>
</body>

</html>