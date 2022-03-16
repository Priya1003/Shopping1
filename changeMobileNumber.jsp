<%@page import ="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change MobileNumber</title>
</head>
<body>
<div class="container">
<center><h3 id="h3topic">Change MobileNumber</h3></center>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<% } %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<% } %>

<%
if("same".equals(msg)){
%>
<h3 class="alert">You Entered Old Mobile Number pls Enter New MobileNumber!</h3>
<% } %>


<form action="changeMobileNumberAction.jsp" method="post">

 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="tel" name="newMobileNumber" 
  pattern="^[6-9][0-9]{9}$" title="This Mobile number is not valid"
 placeholder="Enter new mobile number" required>

<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password"  
 placeholder="Enter password" required>


<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</div>
</body>
<br><br><br>
</html>