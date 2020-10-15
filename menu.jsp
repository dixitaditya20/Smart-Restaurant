<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.5">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Menu</title>
</head>
<body>
	
  <div class="container-fluid">
	 
		<div class="row sticky-top" style="height:10%;background:maroon">
			<div class="col-sm-12 make-center mt-1" style="color: white;height:70px"><marquee><h3>Welcome To Sheraton Gold</marquee></h3></div>
			<div class="col-sm-6" style="height:56px">
			<nav class="navbar navbar-inverse">		
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      
      <li>
        <a  href="/Smart_Restaurant/startermenu?str=1">Starter</a> 
      </li>
      
      <li>
        <a href="/Smart_Restaurant/vegmenu?v=2">Veg
        </a>
      </li>
      
      <li>
        <a href="/Smart_Restaurant/nonvegmenu?n=3">Non-Veg</a>
      </li>
      <li>
        <a href="/Smart_Restaurant/cart">Show Cart</a>
      </li>
        <li>
        <a href="/Smart_Restaurant/bill">Generate Bill</a>
      </li>
      <li>
        <a href="/Smart_Restaurant/logout">LogOut</a>
      </li>
    </ul>
    </nav>
			</div>
	
		</div>
	</div>
</nav>
</body>
</html>