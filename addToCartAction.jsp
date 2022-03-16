<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%
String email=session.getAttribute("email").toString();
int product_id=Integer.parseInt(request.getParameter("id"));
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
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
	ResultSet rs=st.executeQuery("select * from product where id="+product_id);
	while(rs.next()){
		product_price+=rs.getInt(4);
		product_total=product_price;
		quantity_db=rs.getInt(7);
	}
	if(quantity==0){
		//st.executeUpdate("update product set quantity_db='"+quantity_db+"' where id="+product_id);
		response.sendRedirect("home.jsp?msg=OutOfStock");
	}
	ResultSet rs1=st.executeQuery("select * from orders where product_id="+product_id+" and email='"+email+"' and address is NULL");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total+=product_total;
		quantity=rs1.getInt(3);
		quantity+=1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update orders set total="+cart_total+",quantity="+quantity+" where product_id="+product_id+" and email='"+email+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement ps=con.prepareStatement("insert into orders(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setInt(2, product_id);
		ps.setInt(3, quantity);
		ps.setInt(4, product_price);
		ps.setInt(5, product_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");

	}
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");

}
%>