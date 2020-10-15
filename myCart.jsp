<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page="menu.jsp" /> 
		<div class="container">
			<div class="col" >
				<table class="table">
	 					<thead>
	   					<tr>
	     					<th scope="col">FoodId</th>					
	     					<th scope="col">FoodName</th>
		        			<th scope="col">Price</th>
		        			<th scope="col">Quantity</th>
		       				<th scope="col">Cancel</th>
		     			</tr>
		     		</thead>
		     		<tbody>
		     		
		     			<c:forEach var="menu" items="${orderList}">
			     			<tr>
			     				<form:form action="cart" method="POST" modelAttribute="changeorder" name="change">
				     				<tr>
					     				<td>${menu.foodId}</td> <input type="text" name="foodId" hidden value="${menu.foodId}">
										<td>${menu.foodName}</td> <input type="text" name="foodName" hidden value="${menu.foodName}">
										<td>${menu.price}</td>	<input type="text" name="price" hidden value="${menu.price}">
										<td>
											<!--  <button id="down" class="btn btn-default" onclick=" down('0')"><span class="glyphicon glyphicon-minus"></span></button>	-->
											<input type="text" id="myNumber" name="quantity" value="${menu.quantity}">
										    <button class='plus-item'> Confirm </button>
										</td>
									</tr>
								</form:form>
			     			</tr>
		     			</c:forEach>
		 			</tbody>
		 		</table>
		 		
   			</div>
   			<div><form:form action="placeorder"  method="GET">
		     			<button type="submit" class="btn btn-info m-2" style=" margin-right: 20px;">
							Place Order
						</button>
						</form:form></div>
		</div>
	</body>
</html>