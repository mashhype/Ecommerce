<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		
		<!-- Website Title & Description for Search Engine purposes -->
		<title>Confirmation | Wonderful Garden></title>
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

	<div class="container" id="confirmation">

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



		<div class="container" >	
			<div class="jumbotron" id="jumboConfirmation">
		  		<h1>Your all set ${user.firstName}!</h1>
		  			<p>This confirms your order for:</p>
		  			<table class="table table-hover">
	           	<thead>
					<tr>
						<th>Menu Item</th><th>Name</th><th>Price</th><th>Portion</th><th>Qty</th><th>Item Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userCart" items="${userCart}">
					<tr>
						<td><img class="img-responsive img-thumbnail" src="${userCart.value[4]}" alt="${userCart.value[1]}"></td>
						<td><c:out value="${userCart.key}"></c:out></td>
						<td>$<c:out value="${userCart.value[1]}"></c:out></td>
						<td><c:out value="${userCart.value[2]}"></c:out></td>
						<td><c:out value="${userCart.value[3]}"></c:out></td>
						<td>$<c:out value="${userCart.value[5]}"></c:out></td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td id="messageFont">${discountMessage}</td>
						<td></td>
						<td>Subtotal:</td>
						<td>$ ${subTotalFormatted}</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Tax:</td>
						<td>$ ${taxFormatted}</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><b>Grand Total:</b></td>
						<td><b>$ ${grandTotalFormatted}</b></td>
					</tr>	
				</tfoot>
			</table><!-- end table -->
		  			<p>${confirmationMessage}</p>
		  			<p>When you come to pick up your order, please feel free to use our drive-thru window.  This will allow us to 
		  				serve you even faster.  We look forward to seeing you soon!</p>
		  				
	  				<form action="OrderServlet" method="get">
	  					<input type="hidden" name="startOver" value="startOver">
						<button class="btn btn-primary btn-lg" type="submit">Start Another Order</button>
					</form>
			</div>
		</div>

	</div><!-- end container main -->



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
