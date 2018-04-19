<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="searchStyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<meta charset="ISO-8859-1">
<title>Search for housing</title>
</head>
	<div>                
  <ul class="pager">
    <li class="previous"><a href="login.jsp">Login Page</a></li>
  </ul>
</div> 
	
	<form id="address" method="get" action="#">
	<div class="text-center">
		<input id="searchbox" type="text" name="search" placeholder="Search An Address"><br>
		<button class="btn btn-success active" id="address" type="submit">Search</button>
	</div>
	</form>
<body class="bg-info">

<!-- 6 houses on cover  -->
	<div class="text-center container-fluid">
		<img class="img-responsive img-rounded center-block" id ="six"
			src="https://www.montgomerycountymd.gov/PortalImages/InfoCentral/Feature/38/2017/workforce-housing.png"
			alt="housing" height="500" width="300">
		<h1 id="title" class="text-center">Find housing in New Brunswick</h1>
		<p>Are you looking to buy or rent?</p>
		
		
		
<!-- Popup for Search -->
			<form class="" id="search" method="get" action="buy.jsp">
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
			
			<script>
			$(document).ready(function() {
				   $('input[name="selection"]').click(function() {
				       if($(this).attr('id') == 'rent') {
				            $('#duration').show();           
				       }

				       else {
				            $('#duration').hide();   
				       }
				   });
				});
			</script>
<!-- Login -->

	<div id="buySell" class="text-center form-check" >
			<input name="selection" type="radio" id="buy" value="buy">Buy
			<input name="selection" type="radio" id="rent" value="rent">Rent
			</div>
			<div id=duration style="display:none"><p>If Renting, Select Renting Duration</p>
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
				
				<label for="year">Years</label><select form="search" id="year" required>
					  <option value="00">00</option>
					  <option value="01">01</option>
  					  <option value="02">02</option>
					  <option value="03">03</option>
					  <option value="04">04</option>
					  <option value="05">05</option>
				</select>
				
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
			<div class="row form-check form-check-inline" id=rooms ><p>Number of rooms</p>
				<label class="col-md-4" for="rooms"></label><select name = "room_count" form="search" id="room_count" required>
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
				<label  for="bathrooms"></label><select name="bathroom_count" form="search" id="bathroom_count" required>
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
			<label for="guests"></label><select name=guests_count form="search" id="guest_count" required>
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
			<div id="price" class="form-check form-check-inline">
			<h3>Price</h3>
				<label class="col-2 col-form-label" for="minmax">
				<input class="form-control" id="minCost" type="text" name = "minCost" placeholder="Enter Minimum Price" required><b>To</b>
				<input class="form-control" id="maxCost" type="text" name = "maxCost" placeholder="Enter Maximum Price" required>
				</label>
			</div>
			
			<div id="crime" class="form-check form-check-inline">
			<h3>Crime Rate</h3><p>Enter crime rate 1-10 10 being worst</p>
				<label for="crime"></label>
				<input class="text-muted" type="text" name = "minCrime" placeholder="Minimum Crime Rate" ><b>To</b>
				<input class="text-muted" type="text" name = "maxCrime" placeholder="Maximum Crime Rate" >
			</div>
			
			<div id="rating">
				<h3>Seller Rating</h3><p>What rating seller's listings would you look at</p>
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
		<button class="btn  btn-success active" id="checker" type="submit">Search</button>
		</div>
		</form>
	</div>
</body>
</html>