<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	st.executeUpdate("delete from orders where email='"+email+"' and product_id='"+id+"' and address is null");
	response.sendRedirect("myCart.jsp?msg=removed");

}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("myCart.jsp?msg=invalid");

}

%>