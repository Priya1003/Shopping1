<%@page import ="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
</head>
<body>

<div class="container">
<center><h3 id="h3topic">Change Password</h3></center>

<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){
%>

<h3 class="alert">New password and Confirm password does not match!</h3>
<%
}
%>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%
}
%>

<%
if("done".equals(msg)){
%>
<h3 class="alert">Password change successfully!</h3>
<%
}
%>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%
}
%>

<form action="changePasswordAction.jsp" method="post">



<h3>Enter Old Password</h3>
<input class="input-style" type="password" placeholder="Enter Old Password" name="oldPassword" required> 
 
 <h3>Enter New Password</h3>
<input class="input-style" type="password" 
pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}" title="Must contain at least one number and one uppercase and lowercase letter, and at least length between 4-12 characters"
placeholder="Enter New Password" name="newPassword" required> 


<h3>Enter Confirm Password</h3>

<input class="input-style" type="password" 
pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}" title="Password Must contain at least one number and one uppercase and lowercase letter, and at least length between 4-12 characters"

placeholder="Enter Confirm Password" name="confirmPassword" required> 


 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 
</form>
</div>
</body>
<br><br><br>
</html>