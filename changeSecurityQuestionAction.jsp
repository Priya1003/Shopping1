<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=session.getAttribute("email").toString();
String securityQuestion = request.getParameter("securityQuestion");
String newAnswer = request.getParameter("newAnswer");
String password = request.getParameter("password");
int check=0;
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set securityQuestion='"+securityQuestion+"' ,answer='"+newAnswer+"',password='"+password+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");

	}
}catch(Exception e){
           e.printStackTrace();
}
%>