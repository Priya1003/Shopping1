<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
String img_loc=request.getParameter("image");
String quantity_db=request.getParameter("quantity_db");
String key="msg";
try{
	response.setContentType("text/html");
	Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?);");
	File image=new File("C:\\online-shopping-img\\"+img_loc);
	FileInputStream img_file=new FileInputStream(image);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, category);
	ps.setString(4, price);
	ps.setString(5, active);
	ps.setString(7, quantity_db);
	ps.setBinaryStream(6, (InputStream)img_file,(int)(image.length()));
	ps.setString(7, quantity_db);
	ps.executeUpdate();
	con.close();
	session.setAttribute(key, "done");
	response.sendRedirect("addNewProduct.jsp");
}catch(Exception e){
	System.out.println(e);
	session.setAttribute(key, "wrong");
	response.sendRedirect("addNewProduct.jsp");
}

%>
