<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

<%
String email=session.getAttribute("email").toString();
try{
	int total=0;
	int sno=0;
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from orders where email='"+email+"' and status='bill'");
	while(rs.next()){
		total=rs.getInt(1);
	}
    	ResultSet rs1=st.executeQuery("select *from users inner join orders on orders.email=users.email where orders.email='"+email+"' and orders.status='bill'");
    	while(rs1.next()){
    		%>
    		
<h3>Online shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name:  <%=rs1.getString(1) %></h3></div>
<div class="right-div-right"><h3>Email:  <% out.println(email); %></h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rs1.getString(3) %></h3></div>  

<div class="left-div"><h3>Order Date:  <%=rs1.getString(22) %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs1.getString(23) %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs1.getString(24) %> </h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=rs1.getString(25) %></h3></div>
<div class="right-div-right"><h3>City:  <%=rs1.getString(8) %></h3></div> 
<div class="right-div"><h3>Address:  <%=rs1.getString(7) %></h3></div> 

<div class="left-div"><h3>State:  <%=rs1.getString(9) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs1.getString(10) %></h3></div>  
<div class="right-div"><h3>Pincode:  <%=rs1.getString(11) %></h3></div>
<hr>
<% 

break;} %>


	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
     <th>Image</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  
  ResultSet rs2=st.executeQuery("select * from orders inner join product where orders.product_id=product.id and orders.email='"+email+"' and orders.status='bill'");
  while(rs2.next()){
	  sno+=1;
	  
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><center><img style="width:150px; height:80px;" alt="img" src="displayImage.jsp?id=<%= rs2.getString(17) %>"></center></td>
    
    <td><%=rs2.getString(18)%></td>
    <td><%= rs2.getString(19)%></td>
    <td><%= rs2.getString(20) %> </td>
    <td><%= rs2.getString(3) %></td>
     <td><%=rs2.getString(5) %></td>
  </tr>
  <tr>
  <% } %>

</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<% 
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>