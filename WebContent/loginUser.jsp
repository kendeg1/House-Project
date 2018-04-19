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
		
		//insert 3000 user tuples
		/*Integer phone=1111111111;
		for(Integer i=0; i<3000;i++) {
			String insert = "INSERT INTO Users(username, `password`,email,`name`,phone_number)"
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Integer.toString(i));
			ps.setString(2, Integer.toString(i));
			String em="email"+Integer.toString(i)+"@rutgers.edu";
			ps.setString(3, em);
			String name="name"+Integer.toString(i);
			ps.setString(4, name);
			ps.setInt(5, phone);
			phone++;
			//Run the query against the DB
			ps.executeUpdate();
		}
		String str2 = "INSERT INTO Sellers(username) VALUES (?)";
		PreparedStatement query2 = con.prepareStatement(str2);
		query2.setString(1,"1");
		query2.executeUpdate();
		Random rand = new Random();
		for(Integer i=0; i<3000;i++) {
			String str = "INSERT INTO Seller_Listings( username, min_cost, max_cost, notes) VALUES (?, ?, ?, ?)";
			PreparedStatement query = con.prepareStatement(str);
	
			String listing_id, username="`1`", listingType, notes;
			
			notes="";
			
			
			query.setString(1,"1");
			query.setInt(2,Integer.MAX_VALUE);
			query.setInt(3,Integer.MIN_VALUE);
			query.setString(4,notes);
			query.executeUpdate();
		}*/
		
		/*
		int room_count, bathroom_count, guests_count, min_cost, max_cost, duration;

		int  n = rand.nextInt(3);
		if(n==0){
			listingType="house";
		}
		else if(n==1){
			listingType="apartment";
		}
		else if(n==2){
			listingType="single room";
		}
		//username=Integer.toString(i);*/
		
		/*room_count=rand.nextInt(10)+1;
		bathroom_count=rand.nextInt(4)+1;
		guests_count=rand.nextInt(10)+1;*/
		/*query.setString(1,username);
		query.setInt(2,room_count);
		query.setInt(3,bathroom_count);
		query.setInt(4,guests_count);
		
		
		listingType="";
		duration=0;
		query.setString(7,listingType);
		query.setInt(8,duration);*/
		
		//help from https://www.roseindia.net/jsp/jsp-login-form-with-mysql-database-connection-and-back-end-validation.shtml
		
		String username = request.getParameter("username").toLowerCase();
		String password = request.getParameter("pw");
		if(password.equals("")||username.equals("")||password.equals(null)||username.equals(null)){
			response.sendRedirect("error.jsp");
			con.close();
		}
		
		
		//changed string.format to prepared statement
		/*String str = String.format("SELECT * FROM user WHERE username = '%s' AND pw='%s'",username,pw);
		out.println(str);*/
		String str = "SELECT * FROM Users WHERE username = ? AND password=?";
		PreparedStatement query = con.prepareStatement(str);
		query.setString(1,username);
		query.setString(2,password);
		
		
		
		//Run the query against the DB
		ResultSet result = query.executeQuery();
		if(result.next()){
			dbUsername=result.getString("username");
			dbPassword=result.getString("password");
			if(username.equals(dbUsername)&&password.equals(dbPassword)){
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