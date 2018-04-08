<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="login.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <title>Login Page</title>
</head>
 <body class="text-center bg-info ">
  <nav class="navbar navbar-default">
 	<div class="navbar-header">
 		<a class="navbar-brand" href="searchHouse.jsp">Housing in New Brunswick</a>
 	</div>
 	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 		<ul class="nav navbar-nav">
 			<li><a href="searchHouse.jsp">Main</a></li>
 			<li><a href="buy.jsp">Buy Page</a>
 		</ul>
 		
 	</div>	
 </nav>
 
 
 
  <div class="avatar">
    <img src="http://www.york.ca/wps/wcm/connect/yorkpublic/7f496162-920a-4109-9058-7dc6451eec49/Housing_icon.jpg?MOD=AJPERES&CACHEID=7f496162-920a-4109-9058-7dc6451eec49" alt="img">
  </div>

  <div class="container">
  
  <form method="post" action="loginUser.jsp">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input type="text" class="form-control" name="username" placeholder="Enter Username">
    </div>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input type="password" class="form-control" name="pw" placeholder="Enter Password">
    </div>
    <br>
    <button class="btn btn-info active" type="submit" value="submit">Login</button>	
  </form>
  	<form method="post" action="forgotPassword.jsp">
  	<button class="btn btn-info active" type="submit" value="submit">Forgot password? (Not ready)</button>
  	</form>
  	<form method="post" action="createUser.jsp">
  	<button class="btn btn-info active" type="submit" value="submit">Create Account</button>
  	</form>
    <%-- <button type="button" class="cancel">Cancel</button>--%>
    
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body> 
</html>
