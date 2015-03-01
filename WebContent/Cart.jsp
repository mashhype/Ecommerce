<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		
		<!-- Website Title & Description for Search Engine purposes -->
		<title>Shopping Cart | Wonderful Garden</title>
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
			      <a class="navbar-brand" href="index.html"><img src="images/logos/logo1.png" alt="Your Logo"></a>
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
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav><!-- end navbar -->

	</div> <!--end container main-->
	

	<div class="container" id="cart">
		<div class="row">
		<div class="page-header" id="reviewOrderHeader">
				<h1>Review Your Order</h1>
			</div><!--end page header-->
		<div class="panel panel-default">
  		<!-- Default panel contents -->
  		
  		<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row cartHeader">
							<div class="col-sm-8">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> Your Cart</h5>
							</div>
								<div class="col-sm-3 col-sm-offset-9">
									<a href="MenuOrder_NoModal.jsp" class="btn btn-warning btn-block" id="orderMoreButton">Order More Items?</a>
								</div>
							
						</div><!-- end row cartHeader -->
					</div><!-- end panel-title -->
				</div><!-- end panel-heading -->
				
			<table class="table table-hover">
				<tr>
					<th>Menu Item</th><th>Name</th><th>Price</th><th>Portion</th><th>Quantity</th><th>Item Total</th><th>Remove?</th>
				</tr>
				<c:forEach var="userCart" items="${userCart}">
				<tr>
					<td><img class="img-responsive img-thumbnail" src="${userCart.value[4]}" alt="${userCart.value[1]}"></td>
					<td><c:out value="${userCart.key}"></c:out></td>
					<td>$<c:out value="${userCart.value[1]}"></c:out></td>
					<td><c:out value="${userCart.value[2]}"></c:out></td>
					<td><c:out value="${userCart.value[3]}"></c:out></td>
					<td>$<c:out value="${userCart.value[5]}"></c:out></td>
					<td><form action="OrderServlet" method="get">
						<input type=hidden name="remove" value="${userCart.key}">
							<button type="submit" class="btn btn-link btn-lg">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</form></td>
				</tr>
				</c:forEach>
			</table><!-- end table -->
			
		</div><!-- end panel panel-info -->
		
		<div class="panel-footer">
			<div class="row text-center">
				<div class="col-sm-9">
					<h4 class="text-right">SubTotal <strong> $50.00</strong></h4>
				</div>
				<div class="col-sm-3">
				<form action="OrderServlet" method="get">
					<input type="hidden" name="checkout" value="checkout">
					<button type="submit" name="checkoutCart" class="btn btn-success btn-block" id="checkoutButton">Checkout</button>
				</form>
				</div>
			</div><!-- end row text center -->
		</div><!-- end panel footer -->
		</div><!-- end panel panel-default -->
		
		</div><!-- end row -->
	</div><!-- end container cart -->
	
	
<footer >

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