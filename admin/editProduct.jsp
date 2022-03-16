<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back
{
  color: black;
  margin-left: 2.5%;
  margin-top: 10px;
}
#h2{
margin: 20px 0;
}
</style>
</head>
<body>
<div style="margin:7% 8%;"class="container sticky">
<center><h2 id="h2">Edit Products</h2></center>
<%
String id=request.getParameter("id");
try{
	response.setContentType("text/html");  
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next()){
%>

<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>

</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>

</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" min="50" name="price" value="<%=rs.getString(4)%>" required>

</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>

</div>
<br><br>

<div class="left-div">
<h3>Enter Quantity</h3>
 <input class="input-style" type="number" name="quantity_db" value="<%=rs.getString(7)%>" min="1" max="100" required>

</div>

<div class="right-div">
<h3>Image</h3>
<center><img value="<%=rs.getString(5) %>" class="input-style" style="width:60%; height:150px" alt="img" src="displayImage.jsp?id=<%=id%>"></center>
</div>

<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button> 
</form>




<%
}
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp");
}
%>


<br><br><br>
</div>
</body>
</html>