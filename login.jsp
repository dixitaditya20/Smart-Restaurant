
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<style>
	.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
input.ng-invalid.ng-touched{
    border: 1px solid red;
}
</style>
<script>
function FormValidationForEmail() {
	
	var passwordErrorMessage = "Enter Password !!";
	var emailErrorMessage = "Enter Email Id !!";
	
	var emailFont = document.getElementById("emailError");
	var passFont = document.getElementById("passwordError");
	
	var password = document.getElementById("pass").value;
	var email = document.getElementById("email").value;	
	
	if(email == "" && password == "" ) {
		emailFont.innerHTML = emailErrorMessage;
		passFont.innerHTML = passwordErrorMessage;
		
		document.getElementById('pass').style.borderColor = "red";
		document.getElementById('email').style.borderColor = "red";
		return false;
		
	} else if( email == "" && password != "" ) {
		emailFont.innerHTML = emailErrorMessage;
		document.getElementById('email').style.borderColor = "red";
		document.getElementById('pass').style.borderColor = "green";
		return false
		
	} else if(email  !="" && password == "") {
		passFont.innerHTML = passwordErrorMessage;
		document.getElementById('pass').style.borderColor = "red";
		document.getElementById('email').style.borderColor = "green";
		return false;
	}
	else {
		
        document.getElementById('email').style.borderColor = "green";
        document.getElementById('pass').style.borderColor = "green";
        return true;
    }
}
</script>
</head>

<body>

<div class="container" >
  <div class="row" style="height: 100px;">
    <div class="col-sm-12" style="text-align: center;">
        <h1 class="mt-4" >Welcome To Smart Restaurant!!!</h1>
    </div>
  </div>
    <div class="row">
    <div class="col-sm-2">
      
    </div>
      <div class="col-sm-8">
          
                  <h1 class="text-center login-title">Sign up here </h1>
                  <div class="account-wall"> 
                      <form:form class="form-signin" modelAttribute="login" action="loginaction" onsubmit="return FormValidationForEmail();">
                          
                        <div class="form-group">
                            <label class="mt-2" style="font-size: 140%;">
                                <strong>Name</strong>
                            </label>
                            <form:input type="text" path="name" placeholder="Enter Name" class="form-control" onblur="return FormValidationForEmail();" />
                          	<font size="3" color="red" id="passwordError"></font>
                          </div>
                          
                          <div class="form-group">
                            <label class="mt-2" style="font-size: 140%;">
                                <strong>Email</strong>
                            </label>
                            <form:input type="text" path="customerEmailId" placeholder="Enter Email" class="form-control" onblur="return FormValidationForEmail();"/>
                          		<font size="3" color="red" id="emailError" ></font>
                          </div>                          
                          <form action="otp">
                          <button class="btn btn-lg btn-primary btn-block mt-4" name="insert" type="submit" value="Insert">
                              Login
                          </button>
                          </form>
                      </form:form>
                  </div>
                  
          <div class="col-md-2"></div>
      </div>
    </div>
</div>
 

</body>
</html>
