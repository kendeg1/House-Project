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
	
	<form class="form-inline" id="search" method="get" action="#">
			<script type="text/javascript">
				$(document).ready(function() {
					$('#checker').click(function() {
						checked = $("input[type=checkbox]:checked").length;
						if (!checked) {
							alert("You must choose buy or rent.");
							return false;
						}
					});
				});
			</script>
<!-- Login -->

	

	<div id="buySell" class="text-center form-check" >
			<input type="checkbox" id="buy" value="buy">Sell
			<input type="checkbox" id="sell" value="rent">Rent
			</div>
			<div id=duration style="display:none"><p>Select Renting Duration</p>
					<label for="day">Days</label><select form="search" id="day" required>
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
				
				<label for="month">Months</label><select form="search" id="month" required>
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
				
				<label for="year">Years</label><select form="search" id="year" required>
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
				</select>
				
				<br>
			<div id="listing_type">
				<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="apartment" value="option1">Apartment
				</label>
				<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="hotel" value="option2">Hotel
				</label>
				<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="room" value="option3">Room
				</label>
			</div>		
			</div>
			<br>

  			<div id="username" class="form-group row">
  				<label for="username" class="col-2 col-form-label" required>Username</label>
  				<div class="col-10">
    				<input type="text" class="form-control" id="username" placeholder="Enter Username">
  				</div>
  			</div>
			<br>
			
			<div id="homeAddress" class="form-group row">
  				<label for="homeAddress" class="col-2 col-form-label" required>Property Address</label>
  				<div class="col-10">
    				<input type="text" class="form-control" id="address" placeholder="Enter Address">
    				<input type="text" class="form-control" id="city" placeholder="Enter City">
    				<input type="text" class="form-control" id="state" placeholder="Enter State">
  				</div>
  			</div>
  			
  			<br>
			<br>
			<div class="row form-check form-check-inline" id="rooms" ><p>Number of rooms</p>
				<label class="col-md-4" for="rooms"></label><select name = "rooms" form="search" id="room_count" required>
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
			
		
			
			
			<div id=bathrooms><p>Number of bathrooms</p>
				<label  for="bathrooms"></label><select name="bathrooms" form="search" id="bathroom_count" required>
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
			
			<div id=guests><p>Number of guests</p>
			<label for="guests"></label><select name=guests form="search" id="guest_count" required>
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
  			<input type="checkbox" id="inlineCheckbox1" value="option1">Washer/Dryer
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox2" value="option2">Covered Parking
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox3" value="option3">Pet Friendly
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox3" value="option3">Air-Conditioning
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox3" value="option3">Wifi/High-Speed Internet
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox2" value="option2">Gym
			</label>
			<label class="checkbox-inline">
  			<input type="checkbox" id="inlineCheckbox2" value="option2">Gated Access
			</label>
			</div>
			<br>
			
			<div id="size" class="form-group row">
  				<label for="size" class="col-2 col-form-label" required><h3>Square Feet</h3></label>
  				<div class="col-10">
    				<input type="text" class="form-control" id="size_square_feet" placeholder="Enter Size">
  				</div>
  			</div>
			
			<br>
			<div id="cost" class="form-group row">
  				<label for="cost" class="col-2 col-form-label" required><h3>Price</h3></label>
  				<div class="col-10">
    				<input type="text" class="form-control" id="cost" placeholder="Enter Price">
  				</div>
  			</div>
			<br><br>
			<div id="notesBox" class="">
			<label for="notesBox" class="col-2 col-form-label" required>Notes about<br> the property</label>
			<textarea id="notes" style="width:50%" class="form-control" rows="3"></textarea>
			</div>
			<!--  <div id="crime" class="form-check form-check-inline">
			<h3>Crime Rate</h3><p>Enter crime rate 1-10</p>
				<label for="crime"></label>
				<input class="text-muted" type="text" name = "crimeRate" id="crameRate" placeholder="Crime Rate" required>
				
			</div>!  -->
			
			<div id="rating">
				<h3>Seller Rating</h3><p>enter your rating</p>
				<i class="glyphicon glyphicon-star"></i>
				<label for="rating"></label><select name=rating form="search" id="rating" required>
				
					  <option value="01">1</option>
  					  <option value="02">2</option>
					  <option value="03">3</option>
					  <option value="04">4</option>
					  <option value="05">5</option>
				</select>
			</div>
			<div class="col-md-4 text-center">
			<button class="btn  btn-success active" id="checker" type="submit">Finish</button>
			</div>	
	</form>
	</div>
</body>
</html>