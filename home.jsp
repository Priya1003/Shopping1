<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%@include file="header-user.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js">
    <link rel="stylesheet" href="css/style.css">
    <title>Home</title>
	<style>
	h3
	{
		font-size:20px;
		color: yellow;
		text-align: center;
	}
	</style>
</head>
<body>

<!-- special card section starts  -->

<section id="special" class="container-fluid">

<div class="heading text-center">
<br><br>
<center><h1>Available <span>Products</span></h1></center>
<center><p>Check out formals, casuals, Phants and Shirts from all top brands at here</p></center>
</div>


<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert">Product added successfully!</h3>

<% } %>

<%
if("exist".equals(msg)){
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>

<% } %>

<%
if("OutOfStock".equals(msg)){
%>
<h3 class="alert">Out of Stock, Sorry! Try Again Sometime</h3>

<% } %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Something went wrong! Try Again</h3>

<% } %>


<div class="card-container">
<%
try{
	response.setContentType("text/html");  
	Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where active='Yes'");
	
	while(rs.next()){
		
		String id=rs.getInt(1)+"";
		String name=rs.getString(2);
		String catagory=rs.getString(3);
		String price=rs.getString(4);
		String active=rs.getString(5);
		String quantity_db=rs.getString(7);
		
%>
    <div style=""class="card">
        <img src="displayImage.jsp?id=<%= rs.getInt(1) %>" alt="img">        
        <p><b>Product Name: </b><i><%= name %></i></p>
        <p><b>Catagory: </b><i><%= catagory %></i></p>
        <p><b>Price: </b><i><%= price %></i></p>
        <p><b>Quantity: </b><i><%= quantity_db %></i></p>
          
        <a href="addToCartAction.jsp?id=<%=rs.getInt(1)%>"><button>Add to Cart</button></a>
        <br>
    </div>

<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</div>
</section>
<!-- special card section ends  -->


</body> 
</html>