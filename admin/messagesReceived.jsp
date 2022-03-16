<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
.container{
margin:10% 5%;
background:yellow;
border-radius:20px;
border:solid black;	
}
</style>
</head>
<body>
<div class="container">
<div style="color: black; margin:5px 0;text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
<%
try{
	response.setContentType("text/html");  
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from message");
	while(rs.next()){
%>
    
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
          </tr>
          <%}
}catch(Exception e){
	System.out.println(e);
}
%>
         
        </tbody>
      </table>
      <br>
      <br>
      <br>
</div>
</body>
</html>