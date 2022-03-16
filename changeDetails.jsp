<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>

</head>
<body>
<div class="container">
<%
try{
	response.setContentType("text/html");  
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        String dataResourceName = "jdbc/onlineshopping1";
        DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
        Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
%>		
		
<center><h3 id="h3topic">Profile</h3></center>

<h3>Name: <%=rs.getString(1) %> </h3>
<br>
 <h3>Email: <%=rs.getString(2) %></h3>
 <br>
 <h3>Mobile Number: <%=rs.getString(3) %></h3>
 <br>
<h3>Security Question: <%=rs.getString(4) %></h3>
      
      <br>
      <br>
<%	}
}catch(Exception e){
	System.out.println(e);
}
%>
</div>
</body>
</html>