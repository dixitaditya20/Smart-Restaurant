<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>


    <meta charset="utf-8">
        <title>Fullscreen Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

      
        <link href="<c:url value="/resources/CSS/reset.css" />" rel="stylesheet" >
          <link href="<c:url value="/resources/CSS/supersized.css" />" rel="stylesheet" >
       <link href="<c:url value="/resources/CSS/style.css" />" rel="stylesheet" >
</head>
<body>


	<h1 style="color:white">Canteen Management System</h1>
        <div class="page-container">
		
		
		
		
		
            <h1>Login</h1>
            <form action="adminhome" method="post">
                <input type="text" name="username" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
				<select>
					<option value="volvo">Admin</option>
					<option value="saab">Supervisor</option>
					<option value="opel">Staff</option>
				</select>
                <button type="submit">Sign me in</button>
                <div class="error"><span>+</span></div>
            </form>
           
        </div>

        <!-- Javascript -->
        <script src="<c:url value="/resources/js/jquery-1.8.2.min.js" />"></script>
      	<script src="<c:url value="/resources/js/slideshow_jquery_plugin.js" />"></script>
      	<script src="<c:url value="/resources/js/slideshow.js" />"></script>
      	<script src="<c:url value="/resources/js/script.js" />"></script>
</body>
</html>