
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link type="text/css" rel="stylesheet" href="$(pageContext.request.contextPath)/resources/css/style.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Bill</title>
 <script>
 function calc(){
	 var total=document.getElementById("");
	 console.log(document.getElementById("show").innerHTML);

 }
 calc();               
        // var total=calc();
        
</script>

</head>
<body>
	
	<div class="container-fluid">
	
		<jsp:include page="menu.jsp" />
   <div class="row mt-1" style="margin-top:0.5in">
      <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3 mt-2">
         <div class="row" >
            <div class="col-xs-6 col-sm-6 col-md-6">
               <address>
                  <strong>CDAC Restaurant</strong>
                  <br>
                  Raintree Marg, CBD Belapur
                  <br>
                  Kharghar, Navi Mumbai
                  <br>
                  <abbr title="Phone">P:</abbr> (213) 484-6829
               </address>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
               <p>
                  <em>Date: 24 July, 2018</em>
               </p>
               
            </div>
         </div>
         <div class="row">
            <div class="text-center">
               <h1>Receipt</h1>
            </div>
            </span>
            <table class="table table-hover">
               <thead>
                  <tr>
                       <th>Product</th>
                     <th>Quantity</th>
                     <th class="text-center">Price</th>
                     <th class="text-center">Total</th>
                  </tr>
               </thead>
               <tbody>
               
               <c:forEach var="menu" items="${billList}">
               
                  <tr>
                     <td class="col-md-9"><em>${menu.foodName }</em></td>
                     <td class="col-md-1" style="text-align: center"> ${menu.quantity } </td>
                     <td class="col-md-1 text-center">${menu.price }</td>
                     <td  id="total" class="col-md-1 text-center">${menu.total }</td>
                    
                  </tr>
                 </c:forEach>
                                   <tr>
                     <td>   </td>
                     <td>   </td>
                     <td class="text-right">
                        <h4><strong>Total: </strong></h4> 
                     </td>
                     <td class="text-center text-danger">
                        
                        <div id="show">0</div>                
                     </td>
                  </tr>
                  
                 
                  
               </tbody>
            </table>
            
          <div class='pm-button'><a href='https://www.payumoney.com/paybypayumoney/#/D8E660E0FECD0F5149C24A6BDFABBA79'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/21.png' /></a></div> 
            
         </div>
      </div>
   </div>
   
</div> 

</body>
</html>