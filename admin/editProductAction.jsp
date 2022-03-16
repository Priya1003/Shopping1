<%@ page import="java.io.*"%>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>

<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
String quantity_db=request.getParameter("quantity_db");

//String img_loc=request.getParameter("image");

String key="msg";
try{
	response.setContentType("text/html");  
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
/*	File image=new File(img_loc);
	FileInputStream img_file=new FileInputStream(image);
	PreparedStatement ps=con.prepareStatement("update product set name='"+name+"' ,catagory='"+category+"',price='"+price+"',active='"+active+"',image=? where id='"+id+"'");
	ps.setBinaryStream(1, (InputStream)img_file,(int)(image.length()));
*/
	st.executeUpdate("update product set name='"+name+"' ,catagory='"+category+"',price='"+price+"',active='"+active+"',quantity_db='"+quantity_db+"' where id='"+id+"'");
	
	if(active.equals("No")){
		st.executeUpdate("delete from orders where product_id='"+id+"' and address is NULL");
	}
	con.close();
	session.setAttribute(key, "done");
	response.sendRedirect("allProductEditProduct.jsp");
}catch(Exception e){
	System.out.println(e);
	session.setAttribute(key, "wrong");
	response.sendRedirect("allProductEditProduct.jsp");
}

%>
