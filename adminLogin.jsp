<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Admin</title>
</head>
<body>

<div class="container">
	<h1 >Admin <i class="fa fa-edit"></i></h1>
	
	<%
  String msg=(String)session.getAttribute("msg");
  String id="";
  id=(String)session.getAttribute("id");
	
  if("notexist".equals(msg)){
  %>
  	  <h3 id="msg-failure">Incorrect Username or Password</h1>
  <% } %>
  <%
  String msg1=request.getParameter("msg");
  id=request.getParameter("id");
  if("directAccess".equals(msg1)){
	  %>
	<h3 id="msg-failure">Before going to purchase, please login!</h1>
  <% } %>
  
  <%
  if("invalid".equals(msg)){
  %>
	  <h3 id="msg-failure" >Some thing Went Wrong! Try Again !</h3>
  <% } %>
	
	<form action="adminLoginAction.jsp" method="post">
		<p>Admin Id</p>
		<input type="email" name="email" placeholder="Enter Email">
		<p>Password</p>
		<input type="password" name="password" placeholder="Enter Password">
		<button type="submit" id="login">login</button>
			
	</form>
	
</div>


</body>
</html>