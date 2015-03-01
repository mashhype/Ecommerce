<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html>
	<head>
		
		<!-- Website Title & Description for Search Engine purposes -->
		<title>About | Wonderful Garden</title>
		<link rel="shortcut icon" href="images/logos/favicon.ico" >
		<meta name="description" content="">
		<!-- Mobile viewport optimized -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!-- Bootstrap CSS -->
		<link href="bootstrap3.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="includes/css/bootstrap-glyphicons.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="includes/css/styles.css" rel="stylesheet">
		<!-- Include Modernizr in the head, before any other Javascript -->
		<script src="includes/js/modernizr-2.6.2.min.js"></script>
		
	</head>


	<body>

		<div class="container" id="about">

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
				  <p class="navbar-text navbar-right" id="messageFont">${loggedInMessage}</p>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav><!-- end navbar -->


			<div class="container">
				<div class="page-header" id="aboutHeader">
		  			<h1>Wonderful Garden Chinese Restaurant </h1>
		  			<h4>Conveniently located in York Pa off of Interstate 83-N and Queen St.</h4>
		  			<img src="images/restaurantinterior.jpg" alt="..." class="img-rounded">
				</div><!-- end page-header -->

				<div class="page-header">
		  			<h1>Bringing the flavors of {some place in China} to York </h1>
		  			<p>
		  				When my husband and I came to the states in 1993, we were really excited.  
		  				We knew that we wanted to do something on our own.  I had always enjoyed cooking for my family.  
		  				My husband loved helping people.  So in 1996, we opened Wonderful Garden.  
		  				It was hard in the beginning.  No one knew us and we werent sure how the residents of York would respond to Chinese food.  
		  				Over the past 2 decades, we have received so much positive feedback and gratitude from our customers.  
		  				I feel so lucky to be able to do what I love and also make people happy.  
		  			</p>
				</div><!-- end page-header -->
			</div><!-- end container -->
		</div><!-- end container about -->

	

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<h6>Copyright &copy; 2014 MS Consulting</h6>
				</div><!--end col-sm-4 -->

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
				</div><!--end col-sm-4-->

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
