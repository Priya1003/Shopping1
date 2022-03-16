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
<h2>Change Password</h2>
</div>

<%
String mnum=session.getAttribute("mnum").toString();
session.setAttribute("mnum", mnum);
String msg=request.getParameter("msg");
if("success".equals(msg)){
%>	
<h3 style="text-align:center;background:green; color:white;">Otp verified sucessfully</h3>
<%
}
if("notSame".equals(msg)){
%>	
<h3 style="text-align:center;background:red; color:white;">Password doesn't match!</h3>
<%
}
%>
<hr>

<form action="newPasswordAction.jsp" method="post">
<p>Enter New Password</p>
<input type="password" placeholder="Enter New Password" name="password1"
	pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}"
	title="Password should maintain length(4-12) and Includes Atleast 1 Capital, 1 small letter and 1 numeric number"
			 
	 required>
<p>Re-Enter New Password</p>
<input type="password" placeholder="Re-Enter New Password" name="password2" 
pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}"
title="Password should maintain length(4-12) and Includes Atleast 1 Capital, 1 small letter and 1 numeric number"
		 
required>
<button type="submit">Reset Password</button>
</form>
<hr>

</div>

</body> 
</html>