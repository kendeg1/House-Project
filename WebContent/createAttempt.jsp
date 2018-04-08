<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! //session
	String dbUsername;
	String dbPassword;
%>
<%
	try {
		
		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
				                                   "user=monkeyGroup&password=monkey123");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//set parameters
		//help from https://beginnersbook.com/2013/12/hashmap-in-java-with-example/
		HashMap<String,String> loginEntries = new HashMap<String,String>();
		loginEntries.put("username",request.getParameter("newUser"));
		loginEntries.put("password",request.getParameter("newPw"));
		loginEntries.put("email",request.getParameter("email"));
		loginEntries.put("name",request.getParameter("name"));
		loginEntries.put("phone",request.getParameter("phone"));
		Set set = loginEntries.entrySet();
		Iterator it= set.iterator();
		//help from https://www.roseindia.net/jsp/jsp-login-form-with-mysql-database-connection-and-back-end-validation.shtml
		//check for invalid input, should add more edge cases
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry)it.next();
			String temp=loginEntries.get(entry.getKey());
			if(temp.equals("") || temp.equals(null)) {
				response.sendRedirect("invalidUser.jsp");
				con.close();
			}
		}
		
		//check username
		String str = "SELECT * FROM Users WHERE username = ?";
		PreparedStatement query = con.prepareStatement(str);
		query.setString(1,loginEntries.get("username"));
		ResultSet result = query.executeQuery();
		
		//if sql returns data, the username is already in use
		if(result.next()){
			response.sendRedirect("invalidUser.jsp");
			con.close();
		} else {
			
			//jsp string template
			String insert = "INSERT INTO Users(username, `password`,email,`name`,phone_number)"
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, loginEntries.get("username"));
			ps.setString(2, loginEntries.get("password"));
			ps.setString(3, loginEntries.get("email"));
			ps.setString(4, loginEntries.get("name"));
			ps.setString(5, loginEntries.get("phone"));
			//Run the query against the DB
			ps.executeUpdate();
			response.sendRedirect("login.jsp");
			out.print("insert succeeded");
			con.close();
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("create:insert failed");
	}
%>
</body>
</html>