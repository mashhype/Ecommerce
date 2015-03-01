<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
  <head>
    
    <!-- Website Title & Description for Search Engine purposes -->
    <title>Checkout | Wonderful Garden></title>
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



<!-- Begin Checkout -->

<div class="container" id="checkout">
	
	<div class="page-header" id="reviewOrderHeader">
		<h1>Checkout &amp; Pay</h1>
	</div><!--end page header-->
	
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-primary">

        <div class="panel-heading" role="tab" id="headingOne">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              Step 1: Checkout Options
            </a>
          </h4>
        </div><!-- end panel-heading -->

        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
          <div class="panel-body">
           <div class="row">
           	<div class="col-sm-6" id="newCustomerForm">
           		<h4 id="messageFont">${checkoutTypeMessage}</h4>
           	</div>
           </div>
            <div class="row">
              <div class="col-sm-6" id="newCustomerForm">
                <form action="SignupServlet" method="post" class="form-horizontal" role="form">
                  <div class="form-group">
                    <h3>New Customers</h3>
                    <div class="radio"> 
						<label>
					    <input type="radio" name="checkoutType" value="register" checked>
					    	Register Account
					 	</label>
					</div><!-- end 1st radio button -->
					<div class="radio">
					 	<label>
					    	<input type="radio" name="checkoutType" value="guest">
					    	Checkout As Guest
					 	</label>					 						 	
					</div><!-- end 2nd radio button -->
					<br>
					<div>
						<button type="submit" class="btn btn-primary" id="checkoutButton" data-target="#collapseTwo">Continue</button>
					</div>	
                  </div><!-- end form group -->                
                </form>
              </div><!-- end col-sm-6-->
            
            <form action="LoginServlet" method="post" class="form-horizontal" role="form">
             <div class="col-sm-6">
               <div class="form-group">
               	<h3>Current Customers</h3> 	
					<div class="row">
						<div class="col-sm-5">
							<input type="email" class="form-control" name="email" placeholder="Email Address"/>
						</div>
						<div class="col-sm-7">
							<h5 id="messageFont">${dataValMessage}</h5>
						</div>
					</div>
				</div> 	
			<div class="form-group">
				<div class="row">
					<div class="col-sm-5">
						<input type="password" class="form-control" name="password" placeholder="Password"/>
					</div>
				</div>
				</div><!-- end form group -->
				<div class="form-group">
					<input type="hidden" name="checkoutLogin" value="checkoutLogin">
		         	<button type="submit" class="btn btn-primary">Sign In</button>
		         </div><!-- end form group -->
              </div><!-- end col-sm-6 -->
              </form>
          </div><!-- end row -->
          
        </div><!--  end panel-body -->
    </div><!--  end panel collapse collapse in -->
  </div><!-- end panel panel-default -->

    <div class="panel panel-primary">
      <div class="panel-heading" role="tab" id="headingTwo">
        <h4 class="panel-title">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            Step 2: Order Details
          </a>
        </h4>
      </div>
          
      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="panel-body">
			<div class="row" id="rowOrderDetailsButton">
              <a href="ShoppingCart.jsp" class="btn btn-warning btn-sm pull-right" id="editOrderDetailsCheckout">
                <span class="glyphicon glyphicon-share-alt"></span><b>Edit Order Details</b>
              </a> 
            </div>
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
          </div><!--end panel body-->
          
	  		
		<div class="panel-footer">
			<div class="row">
				<div class="col-sm-4">
					<form action="CheckoutServlet" method="get" class="form-group">
						<label>Got a promo code?</label>
						<input type="text" class="form-control" name="promo" id="promo" placeholder="enter code">
						<button type="submit" class="btn btn-warning">Submit</button>
					</form>		
				</div><!-- end col-sm-3 -->
			</div><!-- end row -->	
		</div><!-- end panel-footer -->
  		 	
</div><!--end panel collapse-->

</div><!-- end panel panel default -->
  
    
    <div class="panel panel-primary">

      <div class="panel-heading" role="tab" id="headingThree">
        
        <h4 class="panel-title">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
            Step 3: Payment Method
          </a>
        </h4>
      </div>

      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
        <div class="panel-body">
      
          <form role="form" action="PaymentServlet" method="post">
          	<div class="row">
              <div class="form-group col-sm-3">
                <h4>Select Card Type</h4>
                <div class="radio">
                  <label>
                    <input type="radio" name="cardType" value="mastercard" checked>MasterCard
                  </label>
                </div>
                <div class="radio">
                  <label>
                    <input type="radio" name="cardType" value="visa">Visa
                  </label>
                </div>
                <div class="radio">
                  <label>
                    <input type="radio" name="cardType" value="amex">American Express
                  </label>
                </div>
              </div><!-- end form group for radio buttons-->
              	<div class="col-sm-3 col-sm-offset-2">
              		<h5 id="messageFont">${paymentValMessage}</h5>
              	</div>
              </div>
              
              <div class="row">
	              <div class="col-sm-6">
	              	<label>First Name</label>
	              	<div>
	              	<input type="text" name="fname" class="form-control" placeholder="First Name">
	              	</div>
	              </div>
	              
	              <div class="col-sm-6">
	              	<label>Last Name</label>
	              	<div>
	              	<input type="text" name="lname" class="form-control" placeholder="Last Name">
	              	</div>
	              </div>
              </div>
              
              <div class="row">
	              <div class="col-sm-6">
	              	<label>Credit Card Number</label>
	              	<div>
	              	<input type="text" name="ccNum" class="form-control" placeholder="Credit Card Number">
	              	</div>
	              </div>
	              
	              <div class="col-sm-2">
	              	<label>Exp Month</label>
	              	<div>
	              	<select name="expMonth" class="form-control">
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											  <option value="6">6</option>
											  <option value="7">7</option>
											  <option value="8">8</option>
											  <option value="9">9</option>
											  <option value="10">10</option>
											  <option value="11">11</option>
											  <option value="12">12</option>
											</select>
	              	</div>
	              </div>
	              
	              <div class="col-sm-2">
	              	<label>Exp Year</label>
	              	<div>
	              	<select name="expYear" class="form-control">
											  <option value="2014">2014</option>
											  <option value="2015">2015</option>
											  <option value="2016">2016</option>
											  <option value="2017">2017</option>
											  <option value="2018">2018</option>
											</select>
	              	</div>
	              </div>
	              
	              <div class="col-sm-2">
	              	<label>CVC</label>
	              	<div>
	              	<input type="text" name="cvc" class="form-control" placeholder="CVC Code">
	              	</div>
	              </div>
              </div>
              <div class="row">
	              <div class="col-sm-3 col-sm-offset-4">
	              	<h3 id="messageFont">Your Total: $ ${grandTotalFormatted}</h3>
	              </div>
	            	<div class="col-sm-2 col-sm-offset-3">
	            		<button type="submit" class="btn btn-primary form-control">Pay</button>
	            	</div>
              </div>
   
          </form>

        </div>
      </div>

    </div>
  </div>
</div><!-- end checkout container -->
</div><!-- end main container -->

<!-- end Checkout page -->

<footer>

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

<!-- First try for the online version of jQuery-->
  <script src="http://code.jquery.com/jquery.js"></script>
  
  <!-- If no online access, fallback to our hardcoded version of jQuery -->
  <script>window.jQuery || document.write('<script src="includes/js/jquery-1.8.2.min.js"><\/script>')</script>
  
  <!-- Bootstrap JS -->
  <script src="bootstrap3.3.1/js/bootstrap.min.js"></script>
  
  <!-- Custom JS -->
  <script src="includes/js/script.js"></script>
  <script src="http://imsky.github.com/holder/holder.js"></script>


</body>
</html>
