<%@page import="com.restaurant.model.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
	.make-center{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.shadowbox {
		width:40%; 
		height:100%;
	}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.5">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Veg</title>
</head>
<body>
	<jsp:include page="menu.jsp" /> 
		<div class="container-fluid">
			<div class="row sticky-top">
				<div class="col-sm-8">
					
					
					<div class="row " style="height: 80%;margin-left: 10px;margin-top:20px" id="shadow">
				      	<div class="col-sm-8 ml-5 shadow-lg p-5 mb-5 bg-white rounded shadowbox" >
				      		<c:forEach var="menulist" items="${vegmenu}">
				      		<form:form action="vegmenu" name="order" modelAttribute="foodModel" method="POST">
					      		<div class="row">
						      		<div class="col-sm-6">
						      			<div class="row">
							      			<div class="col-sm-12">
							      				<h4>
							      					<b>${menulist.foodName}</b>
							      					<input type="text" name="foodName" hidden value="${menulist.foodName}">
							      				</h4>
							      			</div>
						      			</div>
							      		<div class="row">
							      			<div class="col-sm-12">
							      				<h4>
							      					<b>${menulist.price}</b>
							      					<input type="text" name="price" hidden value="${menulist.price}">
							      				</h4>
							      			</div>
							      		</div>
							      		<div class="row">
							      			<div class="col-sm-12">
							      				<span hidden id="foodId"><b>${menulist.foodId}</b></span>
							      				<input type="text" name="foodId" hidden value="${menulist.foodId}">
							      			</div>
							      		</div>
						      		</div>
						      		<div class="col-sm-3">
						      			<img src="${menulist.image}" alt="img not found" class=".img-circle">
						      		</div>
						      		<div class="col-sm-3">
						     			<button class="btn btn-info" name="addToCart">Add to cart</button>
						      		</div>
				      			</div>
				      		</form:form>
				      		</c:forEach>
		      			</div>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>