<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>forgot password</title>
</head>
<body>

<div class="container">
	<h1 >Forgot Password</h1>
	<%
  String msg=(String)session.getAttribute("msg");
  if("done".equals(msg)){
  %>
  <h3 id="msg-success">Password Changed Successfully!</h3>
  <% } %> 

  <%
  if("invalid".equals(msg)){
  %>
  <h3 id="msg-failure" >Some thing Went Wrong! Try Again !</h3>
  <% } %> 
	  <form action="forgotPasswordAction.jsp" method="post">
	    <p>Enter Email</p>
	    <input type="email" name="email" id="email" placeholder="Enter Email" required>
	    <p>Enter MobileNumber</p>
	    <input type="number" name="mobilenumber" id="mobilenumber" placeholder="Enter Mobilenumber" required>
	    <p>Select your security Question</p>
	    <select name="securityQuestion" required>
	    <option value="What was your first car?">What was your first car?</option>
	    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
	    <option value="What is your nickname?">What is your nickname?</option>
	    <option value="Others?">Others?</option>
	    </select>
	    <p>Enter Your Answer</p>
	    <input type ="text" name="answer" id="answer" placeholder="Enter answer" required>
	    <p>Enter new Password</p>
	    <input type ="password" name="newPassword" placeholder="Enter New Password" required>
	    <input type="submit" id="save" value="Save">
	  </form>
	
</div>


<footer>
<p>All Right Reserved @ Mohamed Safdar</p>
</footer>

</body>
</html>
