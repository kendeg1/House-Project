<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="searchStyle.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<meta charset="ISO-8859-1">
<title>Seller Page</title>
</head>

<body class="bg-info">
	<div class="text-center container-fluid">
		<img class="img-responsive img-rounded center-block" id ="six"
			src="https://www.montgomerycountymd.gov/PortalImages/InfoCentral/Feature/38/2017/workforce-housing.png"
			alt="housing" height="500" width="300">
		<h1 id="title" class="text-center">Sell housing in New Brunswick</h1>
		<p>Are you looking to sell or rent?</p>
	
	<form class="form-inline" id="search" method="post" action="createListing.jsp">
			<script type="text/javascript">
				$(document).ready(function() {
					$('#checker').click(function() {
						checked = $("input[type=radio]:checked").length;
						if (!checked) {
							alert("You must choose sell or rent.");
							return false;
						}
					});
				});
			</script>
<!-- Login -->

	

	<div id="buySell" class="text-center form-check" >
<<<<<<< HEAD
			<input name = "selection" type="radio" id="sell" value="True">Sell
			<input name = "selection" type="radio" id="rent" value="False">Rent
=======
			<input name = "selection" type="radio" id="sell" value="buy">Sell
			<input name = "selection" type="radio" id="rent" value="rent">Rent
>>>>>>> branch 'master' of https://github.com/oumoum2/House-Project.git
			</div>
			<div id=duration ><p>If Renting, Select Renting Duration</p>
					<label for="day">Days</label><select name="day" form="search" id="day" required>
				      <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
					  <option value="06">06</option>
					  <option value="07">07</option>
					  <option value="08">08</option>
					  <option value="09">09</option>
					  <option value="10">10</option>
					  <option value="11">11</option>
					  <option value="12">12</option>
					  <option value="13">13</option>
					  <option value="14">14</option>
					  <option value="15">15</option>
					  <option value="16">16</option>
					  <option value="17">17</option>
					  <option value="18">18</option>
					  <option value="19">19</option>
					  <option value="20">20</option>
					  <option value="21">21</option>
					  <option value="22">22</option>
					  <option value="23">23</option>
					  <option value="24">24</option>
					  <option value="25">25</option>
					  <option value="26">26</option>
					  <option value="27">27</option>
					  <option value="28">28</option>
					  <option value="29">29</option>
					  <option value="30">30</option>
					  <option value="31">31</option>
				</select>
				
				<label for="month">Months</label><select name="month" form="search" id="month" required>
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
					  <option value="06">06</option>
					  <option value="07">07</option>
					  <option value="08">08</option>
					  <option value="09">09</option>
					  <option value="10">10</option>
					  <option value="11">11</option>
					  <option value="12">12</option>
				</select>
				
				<label for="year">Years</label><select name="year" form="search" id="year" required>
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
				</select>
				
				<br>
			<div id="listing_type" >
				<label class="radio-inline">
  				<input type="radio" name="listing_type" id="apartment" value="apartment" required>Apartment
				</label>
				<label class="radio-inline">
  				<input type="radio" name="listing_type" id="hotel" value="hotel" required>Hotel
				</label>
				<label class="radio-inline">
  				<input type="radio" name="listing_type" id="room" value="room" required>Room
				</label>
				<label class="radio-inline">
  				<input type="radio" name="listing_type" id="house" value="house" required>House
				</label>
			</div>		
			</div>
			
			<br>
			<br>
			
			<div id="homeAddress" class="form-group row">
  				<label for="homeAddress" class="col-2 col-form-label" required>Property Address</label>
  				<div class="col-10">
    				<input type="text" class="form-control" name="address" id="address" placeholder="Enter Address" required>
    				<input type="text" class="form-control" name="city" id="city" placeholder="Enter City" required>
    				<input type="text" class="form-control" name="state" id="state" placeholder="Enter State" required>
  				</div>
  			</div>
  			
  			<br>
			<br>
			
			<div id="rooms" ><p>Number of rooms</p>
<<<<<<< HEAD
				<label class="col-md-4" for="rooms"></label><select name = "room_count" form="search" id="room_count" required>
=======
				<label class="col-md-4" for="rooms"></label><select name = "rooms" form="search" id="room_count" required>
>>>>>>> branch 'master' of https://github.com/oumoum2/House-Project.git
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
					  <option value="06">06</option>
					  <option value="07">07</option>
					  <option value="08">08</option>
					  <option value="09">09</option>
					  <option value="10">10</option>
				</select>
			</div>
			
			<div id="bathrooms"><p>Number of bathrooms</p>
				<label name="bathroom_count"  for="bathrooms"></label><select name="bathroom_count" form="search" id="bathroom_count" required>
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
					  <option value="06">06</option>
					  <option value="07">07</option>
					  <option value="08">08</option>
					  <option value="09">09</option>
					  <option value="10">10</option>
				</select>
			</div>
			
			<div id="guests"><p>Number of guests</p>
<<<<<<< HEAD
			<label name="guest_count" for="guests"></label><select name="guest_count" form="search" id="guest_count" required>
=======
			<label name="guests_count" for="guests"></label><select name="guests_count" form="search" id="guests_count" required>
>>>>>>> branch 'master' of https://github.com/oumoum2/House-Project.git
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
					  <option value="06">06</option>
					  <option value="07">07</option>
					  <option value="08">08</option>
					  <option value="09">09</option>
					  <option value="10">10</option>
				</select>
			</div>
			<br>
			<br>
			
			<div id="amenities">
			<h3>Amenities</h3>
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="washer" value="option1">Washer/Dryer
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="parking" value="option2">Covered Parking
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="pets" value="option3">Pet Friendly
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="ac" value="option3">Air-Conditioning
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="wifi" value="option3">Wifi/High-Speed Internet
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="gym" value="option2">Gym
				</label>
			
				<label class="checkbox-inline">
  					<input type="checkbox" name="amenities" id="gate" value="option2">Gated Access
				</label>
			</div>
			<br>
			
			<div id="size" class="form-group row">
  				<label for="size" class="col-2 col-form-label" required><h3>Square Feet</h3></label>
  				<div class="col-10">
<<<<<<< HEAD
    				<input name="size_square_feet" type="text" class="form-control" id="size_square_feet" placeholder="Enter Size">
=======
    				<input name="size" type="text" class="form-control" id="size_square_feet" placeholder="Enter Size">
>>>>>>> branch 'master' of https://github.com/oumoum2/House-Project.git
  				</div>
  			</div>
			
			<br>
			<div id="cost" class="form-group row">
  				<label for="cost" class="col-2 col-form-label" required><h3>Price</h3></label>
  				<div class="col-10">
    				<input type="text" name="cost" class="form-control" id="cost" placeholder="Enter Price" required>
  				</div>
  			</div>
  			
			<br><br>
			
			<div id="notesBox" class="">
				<label for="notesBox" class="col-2 col-form-label" required>Notes about<br> the property</label>
				<textarea id="notes" name="notes" style="width:50%" class="form-control" rows="3"></textarea>
			</div>

			<div class="col-md-4 text-center mb-3">
				<button class="btn  btn-success active" id="checker" type="submit" value="submit">Submit</button>
			</div>	
	</form>
	</div>
</body>
</html>