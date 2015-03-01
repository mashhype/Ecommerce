<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
		<!-- Website Title & Description for Search Engine purposes -->
		<title>Menu&amp;Order</title>
		<link rel="shortcut icon" href="images/logos/favicon.ico" >
		<meta name="description" content="">
		
		<!-- Mobile viewport optimized -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- Bootstrap CSS -->
		<link href="bootstrap3.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="includes/css/bootstrap-glyphicons.css" rel="stylesheet">
		
		<!-- Custom CSS -->
		<link href="includes/css/styles.css" rel="stylesheet">
</head>
<body>

		<div class="container" id="main">

			<nav class="navbar navbar-default" role="navigation">
	  			<div class="container-fluid">
	    		<!-- Brand and toggle get grouped for better mobile display -->

			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="Index.jsp"><img src="images/logos/logo1.png" alt="Your Logo"></a>
			    </div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="MenuOrder.jsp">Menu&amp;Order<span class="sr-only">(current)</span></a></li>
			        <li><a href="Contact.jsp">Contact Us</a></li>
			        <li><a href="About.jsp">About Us</a></li>
			      </ul>
			      
			      	
			      
			      <ul class="nav navbar-nav navbar-right">
					<li><a href="Signup.jsp" class="btn btn-default btn-link">Create Account</a></li>
					<li><strong class="myBar">|</strong></li>
					<li><a href="Login.jsp" class="btn btn-default btn-link">Login</a></li>
				  </ul> <!-- end navbar-right-->
				  <p class="navbar-text navbar-right">Items in Cart: ${userCart.size()}</p>
				  <p class="navbar-text navbar-right" id="messageFont">${loggedInMessage}</p>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav><!-- end navbar -->

<!-- begin menu Panels -->
<div class="container" id="menu">
	
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="row text-center">
			<div class="col-sm-8">
				<h4 id="messageFont">${dataValMessage}</h4>
			</div>
			<div class="col-sm-4">
				<a href="ShoppingCart.jsp" class="btn btn-warning btn-default pull-right">
				<span class="glyphicon glyphicon-share-alt"></span><b>Go To Your Cart</b></a>
			</div>
		</div>
	
	<div class="panel panel-default">

		<div class="panel-heading" role="tab" id="appetizerMenu">
  			<h4 class="panel-title">
    			<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Appetizers</a>
  			</h4>
		</div>

		<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			
				<div class="thumbnails row">

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/new_appetizers/dumplings.jpg" alt="Dumplings" class="img-responsive">

							<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>4.99</div>

								<div class="caption">
							
									<h3>Dumplings</h3>

									<p>Try our savory Dumplings today.  Made fresh to order!</p>
									
									<form action="OrderServlet" method="get">
									
										<div class="form-group">
											<h4>Select Portion</h4>
											<div class="radio"> 
													<label>
												    <input type="radio" name="portion" id="smallPortion" value="small">
												    Small
												 </label>
											</div>
											<div class="radio">
												 <label>
												    <input type="radio" name="portion" id="largePortion" value="large">
												    Large ($1.00 extra)
												 </label>
											</div>
										
											<h4>Select Quantity</h4>
											<select name="quantity" class="form-control">
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											</select>
										
										</div>
										<input type="hidden" name="itemName" value="Dumplings">
										<input type="hidden" name="itemPrice" value="4.99">
										<input type="hidden" name="imageUrl" value="images/new_appetizers/dumplings.jpg">
										<button type="submit" class="btn btn-warning">Add To Cart</button>
									</form>	

								</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/new_appetizers/crabrangoons.jpg" alt="Crab Rangoons" class="img-responsive">

							<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>5.99</div>

								<div class="caption">

									<h3>Crab Rangoons</h3>

									<p>Try an order of our crab rangoons today!  Made fresh to order!</p>

									<form action="OrderServlet" method="get">
									
										<div class="form-group">
											<h4>Select Portion</h4>
											<div class="radio"> 
													<label>
												    <input type="radio" name="portion" id="smallPortion" value="small">
												    Small
												 </label>
											</div>
											<div class="radio">
												 <label>
												    <input type="radio" name="portion" id="largePortion" value="large">
												    Large ($1.00 extra)
												 </label>
											</div>
										
											<h4>Select Quantity</h4>
											<select name="quantity" class="form-control">
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											</select>
										
										</div>
										<input type="hidden" name="itemName" value="Crab Rangoons">
										<input type="hidden" name="itemPrice" value="5.99">
										<input type="hidden" name="imageUrl" value="images/new_appetizers/crabrangoons.jpg">
										<button type="submit" class="btn btn-warning">Add To Cart</button>
									</form>	

							</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/new_appetizers/eggrolls.jpg" alt="Egg Rolls" class="img-responsive">

							<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span> <sup>$</sup>5.99</div>

							<div class="caption">
								<h3>Egg Rolls</h3>

								<p>Try an order of our egg rolls today!  Made fresh to order!</p>

								<form action="OrderServlet" method="get">
									
										<div class="form-group">
											<h4>Select Portion</h4>
											<div class="radio"> 
													<label>
												    <input type="radio" name="portion" id="smallPortion" value="small">
												    Small
												 </label>
											</div>
											<div class="radio">
												 <label>
												    <input type="radio" name="portion" id="largePortion" value="large">
												    Large ($1.00 extra)
												 </label>
											</div>
										
											<h4>Select Quantity</h4>
											<select name="quantity" class="form-control">
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											</select>
										
										</div>
										<input type="hidden" name="itemName" value="Egg Rolls">
										<input type="hidden" name="itemPrice" value="5.99">
										<input type="hidden" name="imageUrl" value="images/new_appetizers/eggrolls.jpg">
										<button type="submit" class="btn btn-warning">Add To Cart</button>
									</form>	

							</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/new_appetizers/friedwontons.jpg" alt="Fried Wontons" class="img-responsive">

							<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>5.99</div>

							<div class="caption">
								<h3>Fried Wontons</h3>

								<p>Try an order of our Fried Wontons today! Made fresh to order!</p>

								<form action="OrderServlet" method="get">
									
										<div class="form-group">
											<h4>Select Portion</h4>
											<div class="radio"> 
													<label>
												    <input type="radio" name="portion" id="smallPortion" value="small">
												    Small
												 </label>
											</div>
											<div class="radio">
												 <label>
												    <input type="radio" name="portion" id="largePortion" value="large">
												    Large ($1.00 extra)
												 </label>
											</div>
										
											<h4>Select Quantity</h4>
											<select name="quantity" class="form-control">
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											</select>
										
										</div>
										<input type="hidden" name="itemName" value="Fried Wontons">
										<input type="hidden" name="itemPrice" value="5.99">
										<input type="hidden" name="imageUrl" value="images/new_appetizers/friedwontons.jpg">
										<button type="submit" class="btn btn-warning">Add To Cart</button>
									</form>	

							</div><!--end caption-->
						</div><!--end thumbnail-->
					</div><!--end col-3-->

				</div><!--end thumbnails row-->
		</div><!-- end panel collapse -->

	</div><!-- end panel default -->
	</div><!-- end panel group -->

				
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="lunchMenu">
	      <h4 class="panel-title">
	        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          Lunch
	        </a>
	      </h4>
	    </div>
    	<div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
	      <div class="panel-body">
	        <div class="thumbnails row">

				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="images/lunch/chicken_broccoli.jpg" alt="Chicken Broccoli" class="img-responsive">

						<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>7.99</div>

							<div class="caption">
						
								<h3>Chicken Broccoli</h3>

								<p>Try our savory Chicken Broccoli today.  Made fresh to order!</p>

								<form action="OrderServlet" method="get">
							
								<div class="form-group">
									<h4>Select Portion</h4>
									<div class="radio"> 
											<label>
										    <input type="radio" name="portion" id="smallPortion" value="small">
										    Small
										 </label>
									</div>
									<div class="radio">
										 <label>
										    <input type="radio" name="portion" id="largePortion" value="large">
										    Large ($1.00 extra)
										 </label>
									</div>
								
									<h4>Select Quantity</h4>
									<select name="quantity" class="form-control">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select>
								
								</div>
								<input type="hidden" name="itemName" value="Chicken Broccoli">
								<input type="hidden" name="itemPrice" value="7.99">
								<input type="hidden" name="imageUrl" value="images/lunch/chicken_broccoli.jpg">
								<button type="submit" class="btn btn-warning">Add To Cart</button>
							</form>	

							</div><!-- end caption -->
					</div><!-- end thumbnail -->
				</div><!-- end col-3 -->

				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="images/lunch/chicken_lo_mein.jpg" alt="Chicken Lo Mein" class="img-responsive">

						<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>7.99</div>

							<div class="caption">

								<h3>Chicken Lo Mein</h3>

								<p>Try an order of our Chicken Lo Mein today!  Made fresh to order!</p>

								<form action="OrderServlet" method="get">
							
								<div class="form-group">
									<h4>Select Portion</h4>
									<div class="radio"> 
											<label>
										    <input type="radio" name="portion" id="smallPortion" value="small">
										    Small
										 </label>
									</div>
									<div class="radio">
										 <label>
										    <input type="radio" name="portion" id="largePortion" value="large">
										    Large ($1.00 extra)
										 </label>
									</div>
								
									<h4>Select Quantity</h4>
									<select name="quantity" class="form-control">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select>
								
								</div>
								<input type="hidden" name="itemName" value="Chicken Lo Mein">
								<input type="hidden" name="itemPrice" value="7.99">
								<input type="hidden" name="imageUrl" value="images/lunch/chicken_lo_mein.jpg">
								<button type="submit" class="btn btn-warning">Add To Cart</button>
							</form>	

						</div><!-- end caption -->
					</div><!-- end thumbnail -->
				</div><!-- end col-3 -->

				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="images/lunch/shrimp_lo_mein.jpg" alt="Shrimp Lo Mein" class="img-responsive">

						<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span> <sup>$</sup>8.99</div>

						<div class="caption">
							<h3>Shrimp Lo Mein</h3>

							<p>Try an order of our Shrimp Lo Mein today!  Made fresh to order!</p>

							<form action="OrderServlet" method="get">
							
								<div class="form-group">
									<h4>Select Portion</h4>
									<div class="radio"> 
											<label>
										    <input type="radio" name="portion" id="smallPortion" value="small">
										    Small
										 </label>
									</div>
									<div class="radio">
										 <label>
										    <input type="radio" name="portion" id="largePortion" value="large">
										    Large ($1.00 extra)
										 </label>
									</div>
								
									<h4>Select Quantity</h4>
									<select name="quantity" class="form-control">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select>
								
								</div>
								<input type="hidden" name="itemName" value="Shrimp Lo Mein">
								<input type="hidden" name="itemPrice" value="8.99">
								<input type="hidden" name="imageUrl" value="images/lunch/shrimp_lo_mein.jpg">
								<button type="submit" class="btn btn-warning">Add To Cart</button>
							</form>	

						</div><!-- end caption -->
					</div><!-- end thumbnail -->
				</div><!-- end col-3 -->

				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="images/lunch/vegetarian_stir_fry.jpg" alt="Vegetarian Stir Fry" class="img-responsive">

						<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>7.99</div>

						<div class="caption">
							<h3>Vegetable Stir Fry</h3>

							<p>Try an order of our Vegetable Stir Fry today! Made fresh to order!</p>

							<form action="OrderServlet" method="get">
							
								<div class="form-group">
									<h4>Select Portion</h4>
									<div class="radio"> 
											<label>
										    <input type="radio" name="portion" id="smallPortion" value="small">
										    Small
										 </label>
									</div>
									<div class="radio">
										 <label>
										    <input type="radio" name="portion" id="largePortion" value="large">
										    Large ($1.00 extra)
										 </label>
									</div>
								
									<h4>Select Quantity</h4>
									<select name="quantity" class="form-control">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select>
								
								</div>
								<input type="hidden" name="itemName" value="Vegetable Stir Fry">
								<input type="hidden" name="itemPrice" value="7.99">
								<input type="hidden" name="imageUrl" value="images/lunch/vegetarian_stir_fry.jpg">
								<button type="submit" class="btn btn-warning">Add To Cart</button>
							</form>	

						</div><!--end caption-->
					</div><!--end thumbnail-->
				</div><!--end col-3-->

			</div><!--end thumbnails row-->

	      </div><!-- end panel-body -->
	    </div><!-- end collapseTwo -->
	  </div><!-- end panel-default -->
			

		<div class="panel panel-default">
		    <div class="panel-heading" role="tab" >
		      <h4 class="panel-title">
		        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          Dinner
		        </a>
		      </h4>
		    </div>
	    	<div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
	      		<div class="panel-body" id="dinnerMenu">
		        	<div class="thumbnails row">

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/dinner/generaltsaoschicken.jpeg" alt="Crab Rangoon" class="img-responsive">

							<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>8.99</div>

								<div class="caption">
							
									<h3>General Tsao's Chicken</h3>

									<p>Try our savory General Tsao's Chicken today.  Made fresh to order!</p>

									<form action="OrderServlet" method="get">
								
									<div class="form-group">
										<h4>Select Portion</h4>
										<div class="radio"> 
												<label>
											    <input type="radio" name="portion" id="smallPortion" value="small">
											    Small
											 </label>
										</div>
										<div class="radio">
											 <label>
											    <input type="radio" name="portion" id="largePortion" value="large">
											    Large ($1.00 extra)
											 </label>
										</div>
									
										<h4>Select Quantity</h4>
										<select name="quantity" class="form-control">
										  <option value="1">1</option>
										  <option value="2">2</option>
										  <option value="3">3</option>
										  <option value="4">4</option>
										  <option value="5">5</option>
										</select>
									
									</div>
									<input type="hidden" name="itemName" value="General Tsaos Chicken">
									<input type="hidden" name="itemPrice" value="8.99">
									<input type="hidden" name="imageUrl" value="images/dinner/generaltsaoschicken.jpeg">
									<button type="submit" class="btn btn-warning">Add To Cart</button>
								</form>	

								</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/dinner/kungpaochicken.jpg" alt="Kung Pao Chicken" class="img-responsive">

							<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>8.99</div>

								<div class="caption">

									<h3>Kung Pao Chicken</h3>

									<p>Try an order of our Kung Pao Chicken today!  Made fresh to order!</p>

									<form action="OrderServlet" method="get">
								
									<div class="form-group">
										<h4>Select Portion</h4>
										<div class="radio"> 
												<label>
											    <input type="radio" name="portion" id="smallPortion" value="small">
											    Small
											 </label>
										</div>
										<div class="radio">
											 <label>
											    <input type="radio" name="portion" id="largePortion" value="large">
											    Large ($1.00 extra)
											 </label>
										</div>
									
										<h4>Select Quantity</h4>
										<select name="quantity" class="form-control">
										  <option value="1">1</option>
										  <option value="2">2</option>
										  <option value="3">3</option>
										  <option value="4">4</option>
										  <option value="5">5</option>
										</select>
									
									</div>
									<input type="hidden" name="itemName" value="Kung Pao Chicken">
									<input type="hidden" name="itemPrice" value="8.99">
									<input type="hidden" name="imageUrl" value="images/dinner/kungpaochicken.jpg">
									<button type="submit" class="btn btn-warning">Add To Cart</button>
								</form>	

							</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/dinner/sesamechicken.jpg" alt="Sesame Chicken" class="img-responsive">

							<div class="label label-success price"><span class="glyphicon glyphicon-tag"></span> <sup>$</sup>8.99</div>

							<div class="caption">
								<h3>Sesame Chicken</h3>

								<p>Try an order of our Sesame Chicken today!  Made fresh to order!</p>

								<form action="OrderServlet" method="get">
								
									<div class="form-group">
										<h4>Select Portion</h4>
										<div class="radio"> 
												<label>
											    <input type="radio" name="portion" id="smallPortion" value="small">
											    Small
											 </label>
										</div>
										<div class="radio">
											 <label>
											    <input type="radio" name="portion" id="largePortion" value="large">
											    Large ($1.00 extra)
											 </label>
										</div>
									
										<h4>Select Quantity</h4>
										<select name="quantity" class="form-control">
										  <option value="1">1</option>
										  <option value="2">2</option>
										  <option value="3">3</option>
										  <option value="4">4</option>
										  <option value="5">5</option>
										</select>
									
									</div>
									<input type="hidden" name="itemName" value="Sesame Chicken">
									<input type="hidden" name="itemPrice" value="8.99">
									<input type="hidden" name="imageUrl" value="images/dinner/sesamechicken.jpg">
									<button type="submit" class="btn btn-warning">Add To Cart</button>
								</form>	

							</div><!-- end caption -->
						</div><!-- end thumbnail -->
					</div><!-- end col-3 -->

					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="images/dinner/dinner6.JPG" alt="Hunan Yellow Curry" class="img-responsive">

							<div class="label label-info price"><span class="glyphicon glyphicon-tag"></span><sup>$</sup>8.99</div>

							<div class="caption">
								<h3>Hunan Yellow Curry </h3>

								<p>Try an order of our Hunan Yellow Curry today! Made fresh to order!</p>

								<form action="OrderServlet" method="get">
								
									<div class="form-group">
										<h4>Select Portion</h4>
										<div class="radio"> 
												<label>
											    <input type="radio" name="portion" id="smallPortion" value="small">
											    Small
											 </label>
										</div>
										<div class="radio">
											 <label>
											    <input type="radio" name="portion" id="largePortion" value="large">
											    Large ($1.00 extra)
											 </label>
										</div>
									
										<h4>Select Quantity</h4>
										<select name="quantity" class="form-control">
										  <option value="1">1</option>
										  <option value="2">2</option>
										  <option value="3">3</option>
										  <option value="4">4</option>
										  <option value="5">5</option>
										</select>
									
									</div>
									<input type="hidden" name="itemName" value="Hunan Yellow Curry">
									<input type="hidden" name="itemPrice" value="8.99">
									<input type="hidden" name="imageUrl" value="images/dinner/dinner6.JPG">
									<button type="submit" class="btn btn-warning">Add To Cart</button>
								</form>	

							</div><!--end caption-->
						</div><!--end thumbnail-->
					</div><!--end col-3-->

				</div><!--end thumbnails row-->
	      		</div><!--end panel-body-->
			</div><!--end collapse-->
		</div> <!--end panel-default-->
	</div><!--end collapseThree -->
</div>
	
	<footer >
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<h6>Copyright &copy; 2014 MS Consulting</h6>
				</div><!--end col-sm-2 -->

				<div class="col-sm-2">
					<h6>Navigation</h6>
						<ul class="unstyled">
							<li><a href="Index.jsp">Home</a></li>
							<li><a href="About.jsp">About Us</a></li>
							<li><a href="Contact.jsp">Contact Us</a></li>
							<li><a href="MenuOrder.jsp">Menu&amp;Order</a></li>
						</ul>
				</div><!--end col-sm-2-->

				<div class="col-sm-4">
					<h6>Follow Us</h6>
						<ul class="unstyled">
							<li><a href="#">Twitter</a></li>
							<li><a href="#">Facebook</a></li>
							<li><a href="#">Google Plus</a></li>
						</ul>
				</div><!--end col-sm-2-->

				<div class="col-sm-2">
					<h6>Approved <span class="glyphicon glyphicon-thumbs-up"></span> by Mashhood</h6>
				</div><!--end col-sm-2-->
			</div><!--end row-->
		</div><!--end container-->	
	</footer>

	<!-- All Javascript at the bottom of the page for faster page loading -->
		
	<!-- First try for the online version of jQuery-->
	<script src="http://code.jquery.com/jquery.js"></script>
	
	<!-- If no online access, fallback to our hardcoded version of jQuery -->
	<script>window.jQuery || document.write('<script src="includes/js/jquery-1.8.2.min.js"><\/script>')</script>
	
	<!-- Bootstrap JS -->
	<script src="bootstrap3.3.1/js/bootstrap.min.js"></script>
	
	<!-- Custom JS -->
	<script src="includes/js/script.js"></script>

	</body>
</html>
