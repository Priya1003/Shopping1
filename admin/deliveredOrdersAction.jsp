<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%

String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivered";
try{
	response.setContentType("text/html");
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	st.executeUpdate("update orders set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not null");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}

%>