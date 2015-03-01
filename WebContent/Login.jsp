<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		
		<!-- Website Title & Description for Search Engine purposes -->
		<title>Login | Wonderful Garden></title>
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

		<div class="container" id="login">

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
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav><!-- end navbar -->


		<div class="container text-center">
			
		    <div class="row">
				<div class="col-sm-12">
						<div class="well" >	
		            	<h1 class="text-ctr login-title">Sign In</h1>
							<form role="form" action="LoginServlet" method="post">
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
												<input type="email" class="form-control" name="email" placeholder="Email Address"/>
				         				</div>
				         				<div class="col-sm-5">
				         					<h5 id="messageFont">${dataValMessage}</h5>
				         				</div>
		         					</div>
	         					</div><!-- end form group -->
	         					
	         					<div class="form-group"> 	
		         					<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
												<input type="password" class="form-control" name="password" placeholder="Password"/>
				         				</div>
		         					</div>
	         					</div><!-- end form group --> 	
	         					
	         					<div class="form-group">
		         					<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
			         						<button type="submit" class="btn btn-primary pull-left">Signup</button>
			         						<a href="Signup.jsp" class="text-center new-account">New Customer? Create an account </a>
			         					</div>
			         					
			         				</div>
		         				</div>
	         				</form>
   						</div><!-- end well login form -->	         					
       					</div>
		        </div><!--end col-sm-6-->
		    </div><!--end row-->
		</div><!--end container text-center-->
	

	<footer id="footer">
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
		</div>
		
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