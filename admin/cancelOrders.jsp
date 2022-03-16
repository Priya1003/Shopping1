<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
.container{
	margin:10% 1%;
	background:yellow;
	border-radius:20px;
	border:solid black;
}
</style>
</head>
<body>
<div class="container">

<div style="color: black; text-align: center; font-size: 30px;">Cancel Orders <i class='fas fa-window-close'></i></div>
<%
String msg=(String)session.getAttribute("msg");

if("cancel".equals(msg)){
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<% } %>

<%

if("delivered".equals(msg)){
%>
<h3 class="alert">Successfully Updated!</h3>
<% } %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>


<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Product Image</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
          
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
           <%
      try{
    	  	response.setContentType("text/html");  
        	Context initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
            String dataResourceName = "jdbc/onlineshopping1";
            DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
            Connection con = dataSource.getConnection();
    		Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from orders inner join product where orders.product_id=product.id and orders.orderDate is not null and orders.status='Canceled'");

    		while(rs.next()){
    	%>
     
        
          <tr>
          <td><%=rs.getString(10) %></td>
            <td><%=rs.getString(17) %></td>
             <td><img style="width:100%; height:100px;" alt="img" src="displayImage.jsp?id=<%= rs.getString(16) %>"></td>
            
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %> </td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
              </tr>
              <%
    		}    	  
      }catch(Exception e){
    	  System.out.println(e);
      }
      %> 
         
        </table>
      <br>
      <br>
      <br>
</div>
</body>
</html>