<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int quantity_db=0;
int final_total=0;
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from orders where email='"+email+"'and product_id='"+id+"' and address is Null");
	while(rs.next()){
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}else if(quantity!=1 && incdec.equals("dec")){
		quantity-=1;
		total=total-price;
		st.executeUpdate("update orders set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=dec");

	}else{
		quantity+=1;
		total=total+price;
		st.executeUpdate("update orders set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=inc");
	}

//	ResultSet rs1=st.executeQuery("select * from product where id="+id);
	//while(rs1.next()){
		//quantity_db=rs1.getInt(7);
	//}
	//if(quantity>0){
	//quantity_db-=quantity;
//	st.executeQuery("update product set quantity_db='"+quantity_db+"' where id="+id);
	//response.sendRedirect("myCart.jsp");
//	}
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("myCart.jsp?msg=invalid");

}

%>