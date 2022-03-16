<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String pincode=request.getParameter("pincode");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId="";
transactionId=request.getParameter("transactionId");
String  status="bill";
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	PreparedStatement ps=con.prepareStatement("update users set address=? ,city=?, state=?, country=?, mobileNumber=?, pincode=? where email='"+email+"'");
	ps.setString(1,address );
	ps.setString(2, city);
	ps.setString(3,state );
	ps.setString(4, country);
	ps.setString(5, mobileNumber);
	ps.setString(6, pincode);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update orders set address=? ,city=?, state=?, country=?, mobileNumber=? ,pincode=?,orderDate=now(),deliveryDtae=DATE_ADD(orderDate,INTERVAL 7 DAY), paymentMethod=?, transactionId=?,status=? where email='"+email+"' and address is null");
	ps1.setString(1,address );
	ps1.setString(2, city);
	ps1.setString(3,state );
	ps1.setString(4, country);
	ps1.setString(5, mobileNumber);
	ps1.setString(6, pincode);
	ps1.setString(7, paymentMethod);
	ps1.setString(8, transactionId);
	ps1.setString(9, status);

	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	System.out.println(e);
	
}
	
%>