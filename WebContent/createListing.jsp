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

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
				                                   "user=monkeyGroup&password=monkey123");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//insert into Sellers
		String st = "INSERT INTO Sellers(username,rating) VALUES ('asdf','')";
		//crime_rate
		
		
		//Seller_Listings
		
		
		
		String str = "INSERT INTO Seller_Listings(listing_id, username, room_count, bathroom_count, guests_count, min_cost, max_cost, listingType, duration, notes) VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement query = con.prepareStatement(str);
		String listing_id, username="asdf", listingType, duration, notes;
		Integer room_count, bathroom_count, guests_count, min_cost, max_cost;
		query.setString(1,listing_id);
		query.setString(2,username);
		query.setInt(3,room_count);
		query.setInt(4,bathroom_count);
		query.setInt(5,guests_count);
		query.setInt(6,min_cost);
		query.setInt(7,max_cost);
		query.setString(8,listingType);
		query.setString(9,duration);
		query.setString(10,notes);
		//Room
		//amenities
		//locations
		//Run the query against the DB
		ResultSet result = query.executeQuery();
		if(result.next()){
			dbUsername=result.getString("username");
			if(username.equals(dbUsername)){
				session.setAttribute("username",dbUsername);
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