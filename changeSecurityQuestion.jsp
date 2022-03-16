<%@page import ="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<div class="container">
<center><h3 id="h3topic" >Change Security Question</h3></center>

<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<% } %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<% } %>
<form action="changeSecurityQuestionAction.jsp">


<h3>Select Your New Securtiy Question</h3>
  <select class="input-style" name="securityQuestion">
  <option value="What was your first car?">What was your first car?</option>
    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
    <option value="What is your nickname?">What is your nickname?</option>
    <option value="Others?">Others?</option>
  </select>
 
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter New Answer" required>

<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password(for security)" required>


 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'> </i></button>
</form>
</div>
</body>
<br><br><br>
</html>