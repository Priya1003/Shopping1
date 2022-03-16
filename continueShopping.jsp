<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	PreparedStatement ps=con.prepareStatement("update orders set status=? where email=? and status='bill' ");
	ps.setString(1,status);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>