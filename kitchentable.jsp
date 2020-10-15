<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>SMART RESTAURANT</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
		<script>
			$(menuList.status).ready(function(){
			    $("button").click(function(){
			        $.get(function(){
			        		menuList.status=menuList.status+1;
			        });
			    });
			});
		</script>
		
	</head>

	<body style="background-image: url('/kitchen/resources/img/Chaat.jpeg');">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center"> 
		   			<h1>Smart Restaurant</h1>
				</div>
			</div>
			<div class="col" >
					<table class="table">
		 					<thead>
		   					<tr>
		     					<th scope="col">Orderno</th>					
		     					<th scope="col">Tableno</th>
			        			<th scope="col">Food</th>
			        			<th scope="col">Quantity</th>
			       				<th scope="col">Status</th>
			     			</tr>
			     		</thead>
			     		<tbody>
			     			<c:forEach var="menu" items="${menuList}">
				     			<tr>
				     				<form:form action="kitchen" name="order" modelAttribute="KitchenModel" method="POST">
					     				<tr>
						     				<td>${menu.orderNo}</td> <input type="text" name="orderNo" hidden value="${menu.orderNo}">
											<td>${menu.tableNo}</td> <input type="text" name="tableNo" hidden value="${menu.tableNo}">
											<td>${menu.food}</td>	<input type="text" name="food" hidden value="${menu.food}">
											<td>${menu.quantity}</td> <input type="text" name="quantity" hidden value="${menu.quantity}">
											<td>${menu.status}</td>  <input type="text" name="status" hidden value="${menu.status}">
											<td>
												<button type="submit" class="btn btn-info m-2" style=" margin-right: 20px;">
													Change Status
												</button>
											</td>
										</tr>
									</form:form>
				     			</tr>
			     			</c:forEach>
			 			</tbody>
			 		</table>
   			</div>
		</div>
	</body>
</html>