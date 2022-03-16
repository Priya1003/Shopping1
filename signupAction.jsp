<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@ page import="java.sql.*"%>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="",city="",state="",country="";
String key="msg";
try{
	response.setContentType("text/html");
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();  
	
	PreparedStatement ps=con.prepareStatement("insert into users(name,email,mobileNumber,securityQuestion,answer,password)values(?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobilenumber);
	ps.setString(4, securityQuestion);
	ps.setString(5, answer);
	ps.setString(6, password);
	ps.executeUpdate();
	
	session.setAttribute(key, "valid");
	response.sendRedirect("signup.jsp");
}catch(Exception e){
	session.setAttribute(key, "invalid");
	response.sendRedirect("signup.jsp");
}

%>
