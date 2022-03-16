<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="header-user.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>MyCart</title>
<script>
if(window.history.forward(1)!=null){
	window.history.forward(1);
}
</script>
</head>
<body>

<br><br>
<table>
<thead>
<div style="color: white;  text-align: center; font-size: 30px;">Payment Process <i class='fas fa-cart-arrow-down'></i></div>

<%
String email1=session.getAttribute("email").toString();
int total=0;
int sno=0;
int id=0;
int quantity=0;
int quantity_db=0;
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from orders where email='"+email1+"' and address is Null");
	while(rs.next()){
		total=rs.getInt(1);
	}
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: orange;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
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
          </tr>
        </thead>
        <tbody>
         <%
        ResultSet rs1=st.executeQuery("select *from product inner join orders on product.id=orders.product_id and orders.email='"+email+"' and orders.address is NULL");
        while(rs1.next()){
        %>
        
          <tr>
           <% sno+=1; %>
           <td><% out.println(sno); %></td>
           <td><img style="width:90%; height:70px;" alt="img" src="displayImage.jsp?id=<%= rs1.getString(1) %>"></td>
           <% id=rs1.getInt(1);
           quantity_db=rs1.getInt(7);
           quantity=rs1.getInt(10);%>
            <td><%= rs1.getString(2) %></td>
            <td><%= rs1.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs1.getString(4) %></td>
            <td><%= rs1.getString(10) %> </td>
            <td><i class="fa fa-inr"></i><%= rs1.getString(12) %> </td>
            </tr>
         <% }
        if(quantity>0){
        	quantity_db-=quantity;
        	st.executeUpdate("update product set quantity_db='"+quantity_db+"' where id="+id);
        }
        ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
        while(rs2.next()){
        
        %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class ="input-style" type="text" name="address" value="<%=rs2.getString(7) %>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class ="input-style" type="text" name="city" value="<%=rs2.getString(8) %>" placeholder="Enter City" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class ="input-style" type="text" name="state" value="<%=rs2.getString(9) %>" placeholder="Enter State" required>

</div>

<div class="right-div">
<h3>Enter country</h3>
<input class ="input-style" type="text" name="country" value="<%=rs2.getString(10) %>" placeholder="Enter Country" required>

</div>

<div class="right-div">
<h3>Enter pincode</h3>
<input class ="input-style" type="text" name="pincode" value="<%=rs2.getString(11) %>" placeholder="Enter Pincode" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>

 <select class="input-style" name="paymentMethod">
 <option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
  <option value="Online Payment">Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Payment ID</h3>

<input class ="input-style" type="text" name=transactionId  placeholder="Enter Transaction ID" >


<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class ="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(3) %>" placeholder="Enter Mobile Number" required>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit"> Procced to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
        }
}catch(Exception e){
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>