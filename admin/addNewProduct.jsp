<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@page import ="java.sql.*" %>
<%@include file="adminHeader.jsp"%>


<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>

<body>
	<div class="container">
	<div style="color: black; margin-top:10px;text-align: center; font-size: 30px;">All New Products <i class='fab fa-elementor'></i></div>
	
	<%
	String msg=(String)session.getAttribute("msg");
	
	if("done".equals(msg)){
	%>
	<h3 class="alert">Product Added Successfully!</h3>
	<% } %>
	
	<%
	if("wrong".equals(msg)){
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<% } %>
	
	
	<%
	int id=1;
	try{
		response.setContentType("text/html");
                Context initialContext = new InitialContext();
                Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
                String dataResourceName = "jdbc/onlineshopping1";
                DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
                Connection con = dataSource.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from product");
		while(rs.next()){
			id=rs.getInt(1);
			id+=1;
		}
		con.close();
	}catch(Exception e){
		System.out.println(e);
	}
	%>
	<form action="addNewProductAction.jsp" method="post">
	<h3 style="color: blue; padding :20px;" >Product ID: <%out.println(id); %> </h3>
	<input type="hidden" name="id" value="<%out.println(id); %>">
	<div class="left-div">
		 <h3>Product Name</h3>
		 <input class="input-style" type="text" name="name" placeholder="Enter Product Name..." required>
		
	</div>
	
	<div class="right-div">
		<h3>Product Category</h3>
		 <input class="input-style" type="text" name="category" placeholder="Enter Product Category..." required>
		
	</div>
	
	<div class="left-div">
		<h3>Product Price</h3>
		  <input class="input-style" type="number" name="price" min="50" placeholder="Enter product price..(eg: 999)" required>
		 
	</div>
	
	<div class="right-div">
		<h3>Product Active Status</h3>
		<select class="input-style" name="active">
		<option value="Yes">Yes</option>
		<option value="No">No</option>
		</select>
	
	</div>
	 	<br><br>
	<div class="left-div">
		<h3>Product Image</h3>
		<input class="input-style" type="file" name="image"  accept="image/*" required>
	 </div>
	 
     <div class="right-div">
		<h3>Product Quantity</h3>
		 <input class="input-style" type="number" name="quantity_db" placeholder="Enter Product Quantity" min="1" max="100"required>
		
	</div>
	<br><br>
	<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button> 
	</form>
	<br><br>
</div>
<br><br>
</body>
</html>