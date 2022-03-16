<%@ page language="java" import="otp.*"%>
<% 
OtpValidation otpValidation=new OtpValidation();
String gOtp=otpValidation.generateOtp();
String mobileNumber=session.getAttribute("mnum").toString();
String message="Your online-shopping Forgot password code: "+gOtp+"	Don't share this code with others	Regards Mohamed Safdar from online-shopping(Aspire Sys)";
boolean returnMesage=otpValidation.sendOtp(gOtp, message, mobileNumber);
if(returnMesage==true){
%>



<%
}else{
	System.out.println("Something went wrong!");
}
%>