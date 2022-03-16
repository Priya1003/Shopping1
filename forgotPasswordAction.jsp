<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@ page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");
int check=0;
String key="msg";
try{
	response.setContentType("text/html");  
	Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobilenumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
		session.setAttribute(key, "done");
		response.sendRedirect("forgotPassword");
	}
	if(check==0){
		session.setAttribute(key, "invalid");
		response.sendRedirect("forgotPassword");
	}
	con.close();
}catch(Exception e){
	System.out.println(e);
}

%>
