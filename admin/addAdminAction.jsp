<%@ page import="java.sql.*"%>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");

String key="msg";
try{
	response.setContentType("text/html");
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	
	PreparedStatement ps=con.prepareStatement("insert into admin(name,email,mobileNumber,password) values(?,?,?,?);");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobilenumber);
	ps.setString(4, password);
	ps.executeUpdate();
	con.close();
	response.sendRedirect("addAdmin.jsp?msg=added");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addAdmin.jsp?msg=wrong");
}

%>
