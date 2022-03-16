<%@include file="adminHeader.jsp"%>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addAdmin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<title>Admin Profile</title>
</head>
<body>



<div class="container">
<h2>Profile</h2>
		<hr>
		<br>

<%
try{
	response.setContentType("text/html");
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
	while(rs.next()){
%>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 id="msg-p">Saved successfully</h3>
<% } %>

<%
if("invalid".equals(msg)){
%>
<h3 id="msg-f">something went wrong!</h3>
<% } %>

<form action="adminProfileAction.jsp" method="post">



	<p>Name</p>	
	<input type="text" name="name" 
	pattern="[a-zA-Z0-9\s]{4,20}"
	title="Name should contains only Alphabetic with length(4-20)"
	value="<%=rs.getString(1) %>">
	
	 <p>Email</p>
	 <input type="email" name="email" value="<%=rs.getString(2) %>" disabled> 
	 
	 <p>Mobile Number</p>
	 <input type="number" name="mnum" value="<%=rs.getString(3) %>"> 
	 
	<p>Password</p> 
	 <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}"
	 title="Password should maintain length(4-12) and Includes Atleast 1 Capital, 1 small letter and 1 numeric number"
	  name="password" value="<%=rs.getString(4) %>"> 
	
	<button class="button" id="save" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>		

      <br>
<%	}
}catch(Exception e){
	System.out.println(e);
}
%>
</div>

</body>
</html>