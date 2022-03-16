<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
<div class="container">
<center><h3 id="h3topic">Change Address</h3></center>


<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<% } %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<% } %>
<%try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
%>
<form action="addChangeAddressAction.jsp">


<h3>Enter Address</h3>
  <input class="input-style" type="text" name="address" value="<%= rs.getString(7)%>" placeholder="Enter Address">
 
 
 <h3>Enter city</h3>
 <input class="input-style" type="text" 
 pattern="[a-zA-Z\s]{4,20}"
	title="City should contains only Alphabetic"
 name="city" value="<%= rs.getString(8)%>"
 
 
  placeholder="Enter City">

<h3>Enter State</h3>
  <input class="input-style" type="text" name="state" 
  pattern="[a-zA-Z\s]{4,20}"
  title="State should contains only Alphabetic"
  value="<%= rs.getString(9)%>" placeholder="Enter State">


<h3>Enter Country</h3>
  <input class="input-style" type="text" 
  pattern="[a-zA-Z\s]{4,20}"
	title="Country should contains only Alphabetic"
  name="country" value="<%= rs.getString(10)%>" placeholder="Enter Country">

<h3>Enter Pincode</h3>
  <input class="input-style" type="text" 
  pattern=""
	title="Pincode should contains only Numeric"
  name="pincode" value="<%= rs.getString(11)%>" placeholder="Enter Pincode">

 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%}
}catch(Exception e){
	System.out.println(e);
} %>
</div>
</body>
<br><br><br>
</html>