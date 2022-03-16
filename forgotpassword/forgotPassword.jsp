<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ForgotPassword</title>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="forgotpassword.css">
</head>
<body>
<div class="container">
<div class="heading">
<h2>Forgot password</h2>
</div>

<%
String msg=request.getParameter("msg");
if("notRegistered".equals(msg)){
%>	
<h3 style="text-align:center;background:red; color:white;">MobileNumber is not registered</h3>
<%}
if("notValid".equals(msg)){
%>
<h3 style="text-align:center;background:red; color:white;">Something went wrong</h3>	
<%}
if("reSend".equals(msg)){
%>
<h3 style="text-align:center;background:red; color:white;">Re-Enter Mobilenumber</h3>	

<%
}
%>
<hr>

<form action="mobilenumberValidation.jsp" method="post">
<p>Mobile Number</p>
<input type="number" placeholder="Enter mobile number" name="mnum" required>
<button type="submit">Send OTP</button>
</form>
<hr>

</div>

</body> 
</html>