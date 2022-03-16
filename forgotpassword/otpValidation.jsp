<%
String mnum=session.getAttribute("mnum").toString();
String otp=session.getAttribute("otp").toString();
String getOtp=request.getParameter("getOtp");
if(otp.equals(getOtp)){
	session.setAttribute("mnum", mnum);
	response.sendRedirect("newPassword.jsp?msg=success");
}else{
	response.sendRedirect("otp.jsp?msg=wrongOtp");
}
%>