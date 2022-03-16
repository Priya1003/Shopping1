<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ForgotPassword</title>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="forgotpassword.css">

<script>
if(window.history.forward(1)!=null){
	window.history.forward(1);
}
</script>
</head>
<body>
<div class="container">
<div class="heading">
<h2>Verify OTP</h2>
</div>

<%
String mnum=session.getAttribute("mnum").toString();
String otp=session.getAttribute("otp").toString();

String msg=request.getParameter("msg");

session.setAttribute("otp", otp);
session.setAttribute("mnum", mnum);

if("registered".equals(msg)){
%>	
<h3 style="text-align:center;background:green; color:white;">OTP was Sended to your Mobile</h3>
<%}
if("notValid".equals(msg)){
%>
<h3 style="text-align:center;background:red; color:white;">Something went wrong</h3>	
<%}
if("wrongOtp".equals(msg)){
%>
<h3 style="text-align:center;background:red; color:white;"> Otp Wrong!</h3>	
<%}
%>

<hr>

<form action="otpValidation.jsp" method="post">
<p>Enter OTP</p>
<input type="number" placeholder="Enter otp" name="getOtp" required>
<button type="submit">Verify</button>
<a style="color:black; margin-left:10px;"href="forgotPassword.jsp?msg=reSend">Wrong number?</a>
</form>
<hr>

</div>

</body> 
</html>