<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%
String email=session.getAttribute("email").toString();
String newMobileNumber=request.getParameter("newMobileNumber");
String password=request.getParameter("password");
int check=0;
try{
	response.setContentType("text/html"); 
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select mobileNumber from users where email='"+email+"'and password='"+password+"'");
	while(rs.next()){
		check=1;
		if(rs.getString(1).equals(newMobileNumber)){
			response.sendRedirect("changeMobileNumber.jsp?msg=same");
		}
		else{
			PreparedStatement ps=con.prepareStatement("update users set mobileNumber='"+newMobileNumber+"' where email='"+email+"'");
			ps.executeUpdate();
			response.sendRedirect("changeMobileNumber.jsp?msg=valid");

		}		
	}
	if(check==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=invalid");
	}
	con.close();
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("changeMobileNumber.jsp?msg=invalid");
	
}
%>