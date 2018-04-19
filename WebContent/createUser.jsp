<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="login.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
  <title>Create User</title>
</head>
 <body class="bg-info">
 <nav class="navbar navbar-default">
 	<div class="navbar-header">
 		<a class="navbar-brand" href="searchHouse.jsp">Housing in New Brunswick</a>
 	</div>
 	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 		<ul class="nav navbar-nav">
 			<li><a href="searchHouse.jsp">Main</a></li>
 			<li><a href="userInfo.jsp">User Info</a>
 		</ul>
 		
 	</div>	
 </nav>
 <div class="container">
  	<form method="post" action="createAttempt.jsp">
  	<b>Username</b>
    <input type="text" name = "newUser" placeholder="Enter Username">
   	<b>Password</b>
    <input type="password" name = "newPw" placeholder="Enter Password">
	<b>Email</b>
    <input type="text" name = "email" placeholder="Enter Email. Ex:email@rutgers.edu">
	<b>Name</b>
    <input type="text" name = "name" placeholder="Enter Name. Ex: John Doe">
	<b>Phone Number (numbers only, no dashes or spaces)</b>
    <input type="text" name = "phone" placeholder="Enter Phone Number. Ex:1231231234">
    <button class="btn btn-block btn-primary active" type="submit" value="submit">Create Account</button>
  	</form>
  </div>
</body> 
</html>