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
	String[] amenities;
%>
<%
	try {

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
				                                   "user=monkeyGroup&password=monkey123");
		
		
		String listing_type,address,state,city,username,notes,sellOrRent,cost=null;
		Integer room_count, bathroom_count, guest_count, min_cost, max_cost,size_square_feet,rent_id=-1,bed_count,amenity_id, listing_id=-1,duration=0;
		Boolean sell,individualRooms=true;
		//UX doesn't have to be in order of this, but this is the hierarchy of each table
		//blank textbox
		address=request.getParameter("address");
		state=request.getParameter("state");
		city=request.getParameter("city");
			//how do we store username?
		username=(String) session.getAttribute("username");
		System.out.println(username);
		String str="SELECT username FROM Sellers WHERE username=(?)";
		PreparedStatement query = con.prepareStatement(str);
		ResultSet result;
		query.setString(1,username);
		result=query.executeQuery();
		if(!result.next()){
			str="INSERT INTO Sellers(username) VALUES (?)";
			query.setString(1,username);
			if(query.executeUpdate()==1){
				System.out.println(str);
			} else {
				out.print("failed: "+str);
			}
		} else {
			System.out.println("user already in Sellers");
		}
		query.close();
			//notes - not required
		notes=request.getParameter("notes");
		str="INSERT INTO Seller_Listings(address,state,city,username,notes) VALUES (?,?,?,?,?)";
		query=con.prepareStatement(str);
		System.out.println(address);
		System.out.println(state);
		System.out.println(city);
		System.out.println(username);
		System.out.println(notes);
		query.setString(1,address);
		query.setString(2,state);
		query.setString(3,city);
		query.setString(4,username);
		query.setString(5,notes);
		if(query.executeUpdate()==1){
			str="SELECT listing_id FROM Seller_Listings WHERE address=? AND state=? AND city=? AND username=? AND notes=? ORDER BY listing_id DESC";
			query=con.prepareStatement(str);
			query.setString(1,address);
			query.setString(2,state);
			query.setString(3,city);
			query.setString(4,username);
			query.setString(5,notes);
			result=query.executeQuery();
			if(result.next()){
				listing_id=result.getInt("listing_id");
				System.out.format("listing_id: %d\n",listing_id);
			} else {
				System.out.println("can't find listing id");
				System.exit(0);
			}
			System.out.println("inserted listing");
		} else {
			System.out.print("listing failed: "+str);
			System.exit(0);
		}
		query.close();
		//blank textbox
		cost=request.getParameter("cost");
		//dropdown menu:1-10
		bathroom_count=Integer.parseInt(request.getParameter("bathroom_count"));
		guest_count=Integer.parseInt(request.getParameter("guest_count"));
		//dropdown menu that says Sell or Rent?
		sell=Boolean.parseBoolean(request.getParameter("selection"));
		if(sell){
			//dropdown menu:1-10
			room_count=Integer.parseInt(request.getParameter("room_count"));
			//blank text box; size - not required
			size_square_feet=Integer.parseInt(request.getParameter("size_square_feet"));
			str="INSERT INTO Sell(listing_id,cost,room_count,bathroom_count,guest_count,size_square_feet) VALUES (?,?,?,?,?,?)";
			query=con.prepareStatement(str);
			if(listing_id==-1){
				System.out.println("listing id not found");
				System.exit(0);
			}
			query.setInt(1,listing_id);
			query.setString(2,cost);
			query.setInt(3,room_count);
			query.setInt(4,bathroom_count);
			query.setInt(5,guest_count);
			query.setInt(6,size_square_feet);
			if(query.executeUpdate()==1){
				System.out.print(str);
			} else {
				System.out.print("failed: "+str);
			}
			query.close();
		} else {
			//blank textbox (in days, can convert to mm/dd/yr on frontend); duration - not required
			duration = Integer.parseInt(request.getParameter("day"));
			duration+=Integer.parseInt(request.getParameter("month"))*30;
			duration+=Integer.parseInt(request.getParameter("year"))*365;
			//drop down menu - apartment, hotel, room
			listing_type=request.getParameter("listing_type");
			str="INSERT INTO Rent(listing_id,duration,listing_type) VALUES (?,?,?)";
			query=con.prepareStatement(str);
			query.setInt(1,listing_id);
			query.setInt(2,duration);
			query.setString(3,listing_type);
			if(query.executeUpdate()==1){
				query.close();
				str="SELECT rent_id FROM Rent WHERE listing_id=? AND duration=? AND listing_type=? ORDER BY rent_id DESC";
				query=con.prepareStatement(str);
				query.setInt(1,listing_id);
				query.setInt(2,duration);
				query.setString(3,listing_type);
				result=query.executeQuery();
				if(result.next()){
					rent_id=result.getInt("rent_id");
					System.out.format("rent_id: %d\n",rent_id);
				} else {
					System.out.println("can't find rent_id");
					System.exit(0);
				}
				System.out.println("inserted rent");
			} else {
				System.out.print("renting failed: "+str);
				query.close();
				System.exit(0);
			}
			query.close();
			if(listing_type=="apartment"){
				//dropdown menu:1-10
				room_count=Integer.parseInt(request.getParameter("room_count"));
				str="INSERT INTO Apartment_Number(rent_id,cost,room_count,bathroom_count,guest_count) VALUES (?,?,?,?,?)";
				query=con.prepareStatement(str);
				if(rent_id==-1){
					System.out.println("rent id not found");
					System.exit(0);
				}
				query.setInt(1,rent_id);
				query.setString(2,cost);
				query.setInt(3,room_count);
				query.setInt(4,bathroom_count);
				query.setInt(5,guest_count);
				if(query.executeUpdate()==1){
					System.out.print(str);
				} else {
					System.out.print("failed: "+str);
				}
				query.close();
			} else {
				//hotel and individual rooms
				//dropdown menu:1-10
				bed_count=Integer.parseInt(request.getParameter("room_count"));
				str="INSERT INTO Room_Number(rent_id,cost,bed_count,bathroom_count,guest_count) VALUES (?,?,?,?,?)";
				query=con.prepareStatement(str);
				if(rent_id==-1){
					System.out.println("rent id not found");
					System.exit(0);
				}
				query.setInt(1,rent_id);
				query.setString(2,cost);
				query.setInt(3,bed_count);
				query.setInt(4,bathroom_count);
				query.setInt(5,guest_count);
				if(query.executeUpdate()==1){
					System.out.print(str);
				} else {
					System.out.print("failed: "+str);
				}
				query.close();
			}
		}
		//check boxes, into a vector, while loop through vector to add amenities
		str="INSERT INTO Listing_Amenities(listing_id,amenity_id) VALUES (?,?)";
		amenities=request.getParameterValues("amenities");
		if(amenities!=null){
			for(int i=0;i<amenities.length;i++){
				query=con.prepareStatement(str);
				query.setInt(1,listing_id);
				amenity_id=Integer.parseInt(amenities[i]);
				query.setInt(2,amenity_id);
				if(query.executeUpdate()==1){
					System.out.print(str);
				} else {
					System.out.print("failed: "+str);
				}
				query.close();
			}
		}
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html> 