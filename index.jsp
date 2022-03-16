<%@page import ="java.sql.*" %>
<%@page import ="java.io.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%@include file="header.jsp"%>
<%@include file="displayImage.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Dashboard</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>


<section id="special" class="container-fluid">

<div class="heading text-center">
<center><h1>Available <span>Products</span></h1></center>
<center><p>Check out formals, casuals, Phants and Shirts from all top brands at here</p></center>
</div>
<div class="card-container">
<%
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
                   
        Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where active='Yes'");
	
	
	while(rs.next()){
		
		
		String id=rs.getInt(1)+"";
		String name=rs.getString(2);
		String catagory=rs.getString(3);
		String price=rs.getString(4);
		String active=rs.getString(5);
		String quantity_db=rs.getString(7);
		
%>

    <div class="card">
        <img src="displayImage.jsp?id=<%= rs.getInt(1) %>" alt="img">
        <hr>
        <p><b>Product Name: </b><i><%= name %></i></p>
        <p><b>Catagory: </b><i><%= catagory %></i></p>
        <p><b>Price: </b><i><%= price %></i></p>
        <p><b>Quantity: </b><i><%= quantity_db %></i></p>
        
        <a href="login.jsp?msg=directAccess"><button>Add to Cart</button></a>
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

<section id="footer" class="container-fluid">
<div class="row align-items-center">
	<div class="col-md-4 brand">			
		<div class="icons">
		    <a href="https://www.facebook.com/" class="fab fa-facebook-square"  target="_blank"></a>
		    <a href="https://twitter.com/login" class="fab fa-twitter-square"  target="_blank"></a>
		    <a href="https://www.instagram.com/_mr._.mistake?utm_medium=copy_link" class="fab fa-instagram-square" target="_blank"></a>
		    <a href="https://www.linkedin.com/" class="fab fa-pinterest-square"  target="_blank"></a>
		</div>	
	</div>
</div>

<h1>&copy; copyright @ 2021 by <span>Mohamed Safdar</span></h1>
</section>


</body> 


</html>