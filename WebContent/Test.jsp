<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Page</title>

<body>

<p> Testing to see if I can access any value I want inside my HashSet where I have one key and multiple values: </p>

<div class="container" id="cart">
		<div class="row">
			<div class="page-header" id="reviewOrderHeader">
				<h1>Review Your Order</h1>
			</div><!--end page header-->
		</div>
		
		<table class="table table-hover">
			<tr>
				<th>Menu Item</th><th>Price</th><th>Portion</th><th>Quantity</th><th>Total</th>
			</tr>
			<c:forEach var="shopping2" items="${testMap}">
			<tr>
				<td><c:out value="${shopping2.key}"></c:out>
				<td><c:out value="${shopping2.value[0]}"></c:out>
				<td><c:out value="${shopping2.value[1]}"></c:out>
				<td><c:out value="${shopping2.value[2]}"></c:out>
				<td><c:out value="${shopping2.value[3]}"></c:out>
				
			</tr>
			</c:forEach>
		</table>
	</div><!-- end container cart -->
		
</body>
</html>