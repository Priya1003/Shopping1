<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%@include file="header-user.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}

</style>
</head>
<body>
<div class="container">
<div style="color: black;  text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<% } %>

<%
if("inc".equals(msg)){
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<% } %>

<%
if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<% } %>

<%
if("removed".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<% } %>

<table>
<thead>
<%
int total=0;
int sno=0;
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from orders where email='"+email+"' and address is Null");
	while(rs.next()){
		total=rs.getInt(1);
	}

%>

          <tr>
            <th scope="col"  style="background-color: orange;">Total: <i class="fa fa-inr"></i><% out.println(total); %> </th>
            <%
            if(total>0){ 
            %>
            <th scope="col"  style="background-color:#ddd;"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            <% } %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Image</th>
            <th scope="col">Product Name</th>            
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        
        <%
      
        ResultSet rs1=st.executeQuery("select * from product inner join orders on product.id=orders.product_id and orders.email='"+email+"' and orders.address is NULL");
        
        while(rs1.next()){
        	
        %>
      
          <tr>
          <% sno+=1; %>
           <td><%out.println(sno); %></td>
            <td><img style="width:50%; height:70px;" alt="img" src="displayImage.jsp?id=<%= rs1.getString(1) %>"></td>

            <td><%= rs1.getString(2) %></td>
            <td><%= rs1.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs1.getString(4) %></td>
            <td><a href="incDecQuantityAction.jsp?id=<%= rs1.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%= rs1.getString(10) %> <a href="incDecQuantityAction.jsp?id=<%= rs1.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%= rs1.getString(11) %> </td>
            <td><a href="removeFomCart.jsp?id=<%= rs1.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
          <% } 
}catch(Exception e){
	System.out.println(e);
}
          %>
          
        </tbody>
      </table>
      <br>
      <br>
      <br>
</div>
</body>
</html>