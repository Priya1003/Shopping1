<%@page import="java.sql.*" %>
<%@page import ="javax.sql.DataSource" %>
<%@page import ="javax.naming.*" %>
<%@ page language="java" import ="otp.OtpValidation"%>
<%
try{
	
	String mnum=request.getParameter("mnum");
	response.setContentType("text/html");
	Context initialContext = new InitialContext();
    Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
    String dataResourceName = "jdbc/onlineshopping1";
    DataSource dataSource = (DataSource) environmentContext.lookup(dataResourceName);
    Connection con = dataSource.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select mobileNumber from users where mobileNumber='"+mnum+"'");
	if(rs.next()){
		
		OtpValidation otpValidation=new OtpValidation();
		String gOtp=otpValidation.generateOtp();
		String message="Hi, \nYou requested for online-shopping Forgot Password\n \nYour OTP: "+gOtp+"\n \nDon't share this code with others\n \nRegards Mohamed Safdar from online-shopping(Aspire sys)\n \n";
		boolean isSended=otpValidation.sendOtp(gOtp, message, mnum);
		if(isSended){
			session.setAttribute("mnum", mnum);
			session.setAttribute("otp", gOtp);
			response.sendRedirect("otp.jsp?msg=registered");
		}else{
			response.sendRedirect("forgotPassword.jsp?msg=notRegistered");
		}
		
	}else{
		response.sendRedirect("forgotPassword.jsp?msg=notRegistered");

	}
}catch(Exception e){
	response.sendRedirect("forgotPassword.jsp?msg=notValid");
	System.out.println(e);
}
%>