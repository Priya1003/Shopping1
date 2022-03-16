<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@page import ="java.sql.*" %>
<%@include file="adminHeader.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Products</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
#h2{
margin: 20px 0;
}
.container{
margin:10% 0;
background:yellow;
	border-radius:20px;
	border:solid black;
}
</style>
</head>
<body>
<div class="container">
<div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>

<%
String msg=(String)session.getAttribute("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product updated Successfully!</h3>
<% } %>

<%
if("removed".equals(msg)){
%>
<h3 class="alert-failure">Product removed Successfully!</h3>
<% } %>


<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">image</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th>Quantity</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
            
          </tr>
        </thead>
        <tbody>
        
        <%try{
        	response.setContentType("text/html");  
        	Context initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
            String dataResourceName = "jdbc/onlineshopping1";
            DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
            Connection con = dataSource.getConnection();
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select *from product");
        	while(rs.next()){
        %>
          <tr>
            <td><%= rs.getString(1)%></td>
             <td><img style="width:90%; height:100px;" alt="img" src="displayImage.jsp?id=<%= rs.getString(1) %>"></td>
            <td><%= rs.getString(2)%></td>
            <td><%= rs.getString(3)%></td>
            <td><%= rs.getString(4)%><i class="fa fa-inr"></i></td>
            <td><%= rs.getString(5)%></td>
            <td><%= rs.getString(7)%></td>
            <td><a href="editProduct.jsp?id=<%= rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a href="removeFromCartAction.jsp?id=<%= rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
            
          </tr>
          
        <%}
        }catch(Exception e){
        	System.out.println(e);

        } %>
       
         
        </tbody>
      </table>
      <br>
      <br>
      <br>
</div>
</body>
</html>