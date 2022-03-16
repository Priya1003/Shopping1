<%@ page import="java.sql.*"%>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

String key="msg";
int isValid=0;
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select email,password from admin where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		isValid=1;
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	if(isValid==0){
		session.setAttribute(key, "notexist");
		response.sendRedirect("adminLogin.jsp");
	}
}catch(SQLSyntaxErrorException e){
	System.out.println(e);
	session.setAttribute(key, "invalid");
	response.sendRedirect("adminLogin.jsp");
}catch (NamingException e){
           e.printStackTrace();
}

%>