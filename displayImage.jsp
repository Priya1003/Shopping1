<%@page import ="java.sql.*" %>
<%@page import ="java.io.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%
try{
	String id=request.getParameter("id").toString();
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where active='Yes' and id="+id);
	
	Blob image = null;
	byte[ ] imgData = null ;

	if (rs.next()) {
		image = rs.getBlob(6);
		imgData = image.getBytes(1,(int)image.length());
	}
	
	response.setContentType("image/jpg");
	OutputStream o = response.getOutputStream();
	o.write(imgData);
	o.flush();
	o.close();
	out.clear(); 
	out = pageContext.pushBody();
	
}catch(Exception e){
System.out.println(e);
}		
%>