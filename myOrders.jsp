<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="header-user.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Orders</title>
</head>
<body>
<div class="container">
<div  style="color: black;  text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
        <%
        String email1=session.getAttribute("email").toString();
        String product_id;
        String product_name;
         String catagory;
         String price;
         int quantity=0;
         String sub_total;
         String order_date;
         String ExpectedDelivery_date;
         String payment;
         String status;
         String img;
         int sno=0;
         int quantity_db=0;
         int z=0;
        try{
        	response.setContentType("text/html");
                Context initialContext = new InitialContext();
                Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
                String dataResourceName = "jdbc/onlineshopping1";
                DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
                Connection con = dataSource.getConnection();
                Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from orders inner join product where orders.product_id=product.id and email='"+email+"'and orders.orderDate is not null");
        	while(rs.next()){
        		product_id=rs.getString(2);
        		product_name=rs.getString(18);
        	    catagory=rs.getString(19);
        		price=rs.getString(20);
        		quantity=rs.getInt(3);
        		sub_total=rs.getString(5);
        		order_date=rs.getString(11);
        		ExpectedDelivery_date=rs.getString(12);
        		payment=rs.getString(13);
        		status=rs.getString(15);
        		img=rs.getString(17);
			sno+=1;
        %>
          <tr>
            <td><% out.println(sno); %></td>
            <td><img style="width:90%; height:70px;" alt="img" src="displayImage.jsp?id=<%= rs.getString(17) %>"></td>
            
            <td><%= rs.getString(18) %></td>
            <td> <%= rs.getString(19) %> </td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(20) %></td>
            <td> <%= rs.getInt(3) %> </td>
            <td> <%= rs.getString(5) %> <i class="fa fa-inr"></i> </td>
             <td> <%= rs.getString(11) %> </td>
              <td> <%= rs.getString(12) %> </td>
               <td> <%= rs.getString(13) %></td>
               <td> <%= rs.getString(15) %> </td>
            </tr>
      <% 
            
        	}
//        	ResultSet rs1=st.executeQuery("select * from product where id="+product_id);
  //      	while(rs1.next()){
    //    		quantity_db=rs1.getInt(7);
            	
            	
      //  	}
        	//quantity_db-=quantity;
        //	st.executeQuery("update product set quantity_db='"+quantity_db+"' where id="+product_id);
        	

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