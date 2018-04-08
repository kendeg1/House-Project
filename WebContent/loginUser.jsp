<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging In</title>
</head>
<body>
<%! //session
	String dbUsername;
	String dbPassword;
%>
<%
	try {
		//test merge
		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
				                                   "user=monkeyGroup&password=monkey123");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//help from https://www.roseindia.net/jsp/jsp-login-form-with-mysql-database-connection-and-back-end-validation.shtml
		
		
		String username = request.getParameter("username").toLowerCase();
		String pw = request.getParameter("pw");
		if(pw.equals("")||username.equals("")||pw.equals(null)||username.equals(null)){
			response.sendRedirect("error.jsp");
			con.close();
		}
		
		
		//changed string.format to prepared statement
		/*String str = String.format("SELECT * FROM user WHERE username = '%s' AND pw='%s'",username,pw);
		out.println(str);*/
		String str = "SELECT * FROM user WHERE username = ? AND pw=?";
		PreparedStatement query = con.prepareStatement(str);
		query.setString(1,username);
		query.setString(2,pw);
		
		
		
		//Run the query against the DB
		ResultSet result = query.executeQuery();
		if(result.next()){
			dbUsername=result.getString("username");
			dbPassword=result.getString("pw");
			if(username.equals(dbUsername)&&pw.equals(dbPassword)){
				session.setAttribute("username",dbUsername);
				session.setAttribute("password",dbPassword);
				response.sendRedirect("welcome.jsp");
			}
			else{
				response.sendRedirect("error.jsp");
				con.close();
			}

			out.print("insert succeeded");
		}
		else{
			response.sendRedirect("error.jsp");
			con.close();
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html> 