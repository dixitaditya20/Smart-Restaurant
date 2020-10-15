<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.make-center{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	#shadowbox {
		width:40%; 
		height:80%;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.5">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Non-Veg</title>
</head>
<body>
<jsp:include page="menu.jsp" /> 
		<div class="container-fluid ">
			<div class="row ">
				<div class="col-sm-8">
					
					  <div class="row " style="height: 80%;margin-left: 10px;margin-top:20px" id="shadow">
		      		<div class="col-sm-6 ml-5 shadow-lg p-5 mb-5 bg-white rounded shadowbox" >
		      		<c:forEach var="menulist1" items="${nonvegmenu}">
		      		<form:form action="nonvegmenu" name="order" modelAttribute="foodModel" method="POST">
		      		<div class="row">
		      		<div class="col-sm-6">
		      			<div class="row">
		      			<div class="col-sm-12">
		      				<h4>
		      					<b id="foodName">${menulist1.foodName}</b>
		      					<input type="text" name="foodName" hidden value="${menulist1.foodName}">
		      				</h4>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-12">
		      				<h4>
		      					<b id="foodPrice">${menulist1.price}</b>
		      					<input type="text" name="price" hidden value="${menulist1.price}">
		      				</h4>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-12">
		      				<span hidden id="foodId"><b>${menulist1.foodId}</b></span>
		      				<input type="text" name="foodId" hidden value="${menulist1.foodId}">
		      			</div>
		      		</div>
		      		</div>
		      		<div class="col-sm-3">
		      		<img src="${menulist1.image}" alt="img not found" class=".img-circle">
		      		</div>
		      		<div class="col-sm-3">
		      			
		      			<button class="btn btn-info">Add to cart</button>
		      			
		      		</div>
		      		</div></form:form>
		      		</c:forEach>
		      	</div>
		      		
		      		<div class="col-sm-6" style="width:50%">
		      			 
					</div>
					</div>
				</div>
				
			</div>
		</div>
</body>
</html>