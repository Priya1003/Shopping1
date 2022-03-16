<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
try{
	
	String mnum=session.getAttribute("mnum").toString();
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	if(password1.equals(password2)){
		response.setContentType("text/html");  
		Context initialContext = new InitialContext();
	    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
	    String dataResourceName = "jdbc/onlineshopping1";
	    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
	    Connection con = dataSource.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select mobileNumber from users where mobileNumber='"+mnum+"'");
		if(rs.next()){	
			
			st.executeUpdate("update users set password='"+password1+"' where  mobileNumber='"+mnum+"'");
			response.sendRedirect("../login.jsp?pmsg=passwordChanged");	
			con.close();
		}
		
	}else{
		session.setAttribute("mnum", mnum);
		response.sendRedirect("newPassword.jsp?msg=notSame");
	}
}catch(Exception e){
	System.out.println(e);
}
%>