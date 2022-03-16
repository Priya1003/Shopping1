<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<% 
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>