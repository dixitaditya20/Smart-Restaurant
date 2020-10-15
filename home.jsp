<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
<link href="//cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.css" type="text/css" rel="stylesheet" />
<script src="//cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js" type="text/javascript" charset="utf-8"></script>
  <style>
 
  
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      background: cover;
      
  }
  
  		.testimonials {
						    padding-top: 7rem;
						    padding-bottom: 7rem
						}
						
						.testimonials .testimonial-item {
						    max-width: 18rem
						}
						
						.testimonials .testimonial-item img {
						    max-width: 12rem;
						    box-shadow: 0 5px 5px 0 #adb5bd
						}
  		
  </style>
<title>Welcome</title>
</head>

<body style="background:url('../resources/img/img.jpg');background-repeat: no-repeat;background-size: cover;">
	
	<div class="container-fluid">
	<jsp:include page="menu.jsp" /> 
	<div class="row">
  <div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li class="item1 active"></li>
      <li class="item2"></li>
      <li class="item3"></li>
      <li class="item4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="../resources/img/aru.jpg" alt="Chania"  >
        <div class="carousel-caption">
          <h1 style="margin-left:65px;color:white;font-style: inherit;font-size: xxx-large;font-family: cursive; background:rgba(0,0,0,0.5);    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;"><b>    Welcome to Smart Restaurant  </b> </h1>
        </div>
      </div>

      <div class="item">
        <img src="../resources/img/5.jpg" alt="Chania"  >
        <div class="carousel-caption">
            <h1 style="margin-left:65px;color:white;font-style: inherit;font-size: xxx-large;font-family: cursive; background:rgba(0,0,0,0.5);    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;"><b>   Welcome to Smart Restaurant  </b> </h1>
        </div>
      </div>
    
      <div class="item">
        <img src="../resoures/img/8.jpg" alt="Flower" >
        <div class="carousel-caption">
            <h1 style="margin-left:65px;color:white;font-style: inherit;font-size: xxx-large;font-family: cursive; background:rgba(0,0,0,0.5);    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;"><b>   Welcome to Smart Restaurant  </b> </h1>
        </div>
      </div>

      <div class="item">
        <img src="../resources/img/4.jpg" alt="Flower" >
        <div class="carousel-caption">
           <h1 style="margin-left:65px;color:white;font-style: inherit;font-size: xxx-large;font-family: cursive; background:rgba(0,0,0,0.5);    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;"> <b>   Welcome to Smart Restaurant  </b> </h1>
        </div>
      </div>
  			
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
  
  
  		<div class="row">
  		<section class="testimonials text-center mybg">
        <div class="container">
            <h2 class="mb-5">What people are saying...</h2>
            <div class="row">
                
                	<div class="col" >
					<table class="table">
		 					<thead>
		   					<tr>
		     						<th scope="col">Name</th>					
		     						<th scope="col">Feedback</th>
			     			</tr>
			     		</thead>
			     		<tbody>
			     			<c:forEach var="menu" items="${feedbackList}">
				     			<tr>
				     				<form:form action="wel" name="order" modelAttribute="FeedBackModel" method="POST">
					     				<tr>
						     				<td>${menu.Name}</td> <input type="text" name="orderNo" hidden value="${menu.Name}">
											<td>${menu.Feedback}</td> <input type="text" name="tableNo" hidden value="${menu.Feedback}">
										</tr>
									</form:form>
				     			</tr>
			     			</c:forEach>
			 			</tbody>
			 		</table>
   			</div>
		</div>
                
            </div>
        </div>
    </section>
  		
  		</div>
  


<script>
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel();
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });
});
</script>
	
	
</body>
</html>