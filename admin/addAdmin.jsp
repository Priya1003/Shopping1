<%@include file="adminHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addAdmin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Add Admin</title>
</head>
<body>
<div class="container">


<form action="addAdminAction.jsp" method="post">
		<h2>Add Admin</h2>
		<hr>
		<br>
		
		<%
		String msg=request.getParameter("msg");
		if("added".equals(msg)){
		%>
		<h3 id="msg-p">Admin Added successfull</h3>
		<% } %>	
		
		<%
		if("wrong".equals(msg)){
		%>
		<h3 id="msg-f">something went wrong!</h3>
		<% } %>	
				
	     <p>Admin Name</p>	    
	    <input type="text" name="name" id="name" 	    
		    pattern="[a-zA-Z0-9\s]{4,20}"
		    title="Name should contains only Alphabetic with length(4-20)"
		    placeholder="Enter Name" required>
	    <p>Admin mail-Id</p>
	    	<input type="email" name="email" id="email" 	    
	    	placeholder="Enter Email" required>
	    <p>Admin MobileNumber</p>
	    	<input type="tel" name="mobilenumber" id="mobilenumber" 
	    	pattern="^[6-9][0-9]{9}$"
	    	title="Mobile number is invalid"
	    	placeholder="Enter Mobilenumber" required>
	    <p>Admin Password</p>
	    <input type ="password" name="password" id="password" 
	    	 pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}"
		 title="Password should maintain length(4-12) and Includes Atleast 1 Capital, 1 small letter and 1 numeric number"
		 placeholder="Enter Password" required>
	    
	    <button type="submit" id="add">Add Admin <i class="for-fa-arrow-alt-circle-right"></i></button>


</form>
</div>

</body>
</html>