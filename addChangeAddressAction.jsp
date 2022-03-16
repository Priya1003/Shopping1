<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String pincode=request.getParameter("pincode");

try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	PreparedStatement ps=con.prepareStatement("update users set address='"+address+"',city='"+city+"',state='"+state+"',country='"+country+"',pincode='"+pincode+"' where email='"+email+"'");
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
	con.close();
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>