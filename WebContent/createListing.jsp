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
		
		
		String listing_type,address,state,city,username,notes,duration,sellOrRent,cost;
		Integer room_count, bathroom_count, guest_count, min_cost, max_cost,size_square_feet,rent_id,bed_count,amenity_id, listing_id;
		Boolean sell,individualRooms;
		if(request.getParameter("checker") != null){
			//UX doesn't have to be in order of this, but this is the hierarchy of each table
			//blank textbox
			address=request.getParameter("address");
			state=request.getParameter("state");
			city=request.getParameter("city");
				//how do we store username?
			username=(String) session.getAttribute("username");
			String str="INSERT INTO Sellers(username) VALUES (?)";
			PreparedStatement query = con.prepareStatement(str);
			query.setString(1,username);
			ResultSet result = query.executeQuery();
				//notes - not required
			notes=request.getParameter("notes");
			str="INSERT INTO Seller_Listings(address,state,city,username,notes) VALUES (?,?,?,?,?)";
			query=con.prepareStatement(str);
			query.setString(1,address);
			query.setString(2,state);
			query.setString(3,city);
			query.setString(4,username);
			query.setString(5,notes);
			System.out.println(str);
			result=query.executeQuery();
						//result.getRow or whatever to get the SELECT COUNT(listing_id) FROM Seller_Listings
			listing_id=Integer.parseInt(request.getParameter("listing_id"));
					
			//blank textbox
			cost=request.getParameter("cost");
			//dropdown menu:1-10
			bathroom_count=Integer.parseInt(request.getParameter("bathroom_count"));
			guest_count=Integer.parseInt(request.getParameter("guest_count"));
			
			
			
			//dropdown menu that says Sell or Rent?
			sell=Boolean.parseBoolean(request.getParameter("listing_type"));
			if(sell){
				//dropdown menu:1-10
				room_count=Integer.parseInt(request.getParameter("room_count"));
				//blank text box; size - not required
				size_square_feet=Integer.parseInt(request.getParameter("size_square_feet"));
				str="INSERT INTO Sell(listing_id,cost,room_count,bathroom_count,guest_count,size_square_feet) VALUES (?,?,?,?,?,?)";
				query=con.prepareStatement(str);
				query.setInt(1,listing_id);
				query.setString(2,cost);
				query.setInt(3,room_count);
				query.setInt(4,bathroom_count);
				query.setInt(5,guest_count);
				query.setInt(6,size_square_feet);
				result=query.executeQuery();
			} else {
				//blank textbox (in days, can convert to mm/dd/yr on frontend); duration - not required
				duration = request.getParameter("duration");
				//drop down menu - apartment, hotel, room
				listing_type=request.getParameter("listing_type");
				str="INSERT INTO Rent(listing_id,duration,listing_type) VALUES (?,?,?)";
				query=con.prepareStatement(str);
				query.setInt(1,listing_id);
				query.setString(2,duration);
				query.setString(3,listing_type);
				result=query.executeQuery();
				str="SELECT COUNT(rent_id) FROM Rent";
				query=con.prepareStatement(str);
				result=query.executeQuery();
				
				//NEXT ROW?? WHATS THE COMMAND?``````````````````````````````````
				rent_id=result.getInt("rent_id");
				System.out.println(rent_id);
				if(listing_type=="apartment"){
					//dropdown menu:1-10
					room_count=Integer.parseInt(request.getParameter("room_count"));
					str="INSERT INTO Apartment_Number(rent_id,cost,room_count,bathroom_count,guest_count) VALUES (?,?,?,?,?)";
					query=con.prepareStatement(str);
					query.setInt(1,rent_id);
					query.setString(2,cost);
					query.setInt(3,room_count);
					query.setInt(4,bathroom_count);
					query.setInt(5,guest_count);
					result=query.executeQuery();
				} else {
					//hotel and individual rooms
					//dropdown menu:1-10
					bed_count=Integer.parseInt(request.getParameter("bed_count"));
					str="INSERT INTO Room_Number(rent_id,cost,bed_count,bathroom_count,guest_count) VALUES (?,?,?,?)";
					query=con.prepareStatement(str);
					query.setInt(1,rent_id);
					query.setString(2,cost);
					query.setInt(3,bed_count);
					query.setInt(4,bathroom_count);
					query.setInt(5,guest_count);
					result=query.executeQuery();
				}
			}
			
			//check boxes, into a vector, while loop through vector to add amenities
			str="INSERT INTO Listing_Amenities(listing_id,amenity_id) VALUES (?,?)";
			query=con.prepareStatement(str);
			query.setInt(1,listing_id);
			amenity_id=Integer.parseInt(request.getParameter("amenity_id"));
			query.setInt(2,amenity_id);
			result=query.executeQuery();
			query.close();
		} else {
			out.print("SHIT!");
			System.out.println("FUCK!!!!!!!!");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html> 