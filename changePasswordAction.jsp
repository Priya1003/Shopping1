<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<% 
String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");
int check=0;
if(!newPassword.equals(confirmPassword)){
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}else{
	try{
		response.setContentType("text/html");  
                Context initialContext = new InitialContext();
                Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
                String dataResourceName = "jdbc/onlineshopping1";
                DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
                Connection con = dataSource.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+oldPassword+"'");
		while(rs.next()){
			check=1;
			st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");

		}
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");

		}
		con.close();
	}catch(Exception e){
		//System.out.println(e);
		//response.sendRedirect("changePassword.jsp?msg=invalid");
	}
}
%>