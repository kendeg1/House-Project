<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
            "user=monkeyGroup&password=monkey123";
	String dbName = "jsptutorials";
	String userId = "root";
	String password = "root";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<h2 align="center">
	<font><strong>Retrieve data from database in jsp</strong></font>
</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>

	</tr>
	<tr bgcolor="#A52A2A">
		<td><b>id</b></td>
		<td><b>user_id</b></td>
		<td><b>Password</b></td>
		<td><b>Name</b></td>
		<td><b>Email</b></td>
	</tr>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM record";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr bgcolor="#DEB887">

		<td><%=resultSet.getString("id")%></td>
		<td><%=resultSet.getString("user_id")%></td>
		<td><%=resultSet.getString("password")%></td>
		<td><%=resultSet.getString("name")%></td>
		<td><%=resultSet.getString("email")%></td>

	</tr>

	<%
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</table>
<%--
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
<link rel="stylesheet" type="text/css" href="buy.css">
<title>Board</title>
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
			<a class="navbar-brand" href="searchHouse.jsp">Housing in New
				Brunswick</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="searchHouse.jsp">Main</a></li>
				<li class="active"><a href="buy.jsp">Board</a></li>
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
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Listing ID #</th>
						<th>room_count</th>
						<th>bathroom_count</th>
						<th>condition</th>
						<th>type</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>1000</td>
						<td>2</td>
						<td>3</td>
						<td>14</td>
					</tr>
				</tbody>
				
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">Post</a>
		</div>
	</div>

</body>
</html>
--%>