<%@include file="header.jsp"%>

<html>
<head>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Signup</title>

</head>
<body>

<div class="container">
	<h1 >Signup <i class='fas fa-users'></i></h1>
	
	<%
  String msg=(String)session.getAttribute("msg");
  if("valid".equals(msg)){
  %>
  <h3 id="msg-success">Registered successfull</h3>
  <% } %>
  
  <%
  if("invalid".equals(msg)){
  %>
  <h3 id="msg-failure">fill correct details !</h3>
  <% } %>
  
	<form  id="registration_form" action="signupAction.jsp"  method="post" >
	    <p>Enter Name</p>	    
	    <input type="text" name="name" id="name" placeholder="Enter Name" required><br>
	    <span class="error_form" id="name_error_message"></span>
	    
	    
	    <p>Enter Email</p>
	    <input type="email" name="email" id="email" placeholder="Enter Email" required><br>
	    <span class="error_form" id="email_error_message"></span>
	    
	    
	    <p>Enter MobileNumber</p>
	    <input type="tel" name="mobilenumber" id="mobilenumber" placeholder="Enter Mobilenumber" required><br>
	    <span class="error_form" id="mnum_error_message"></span>
	   
	   
	    <p>Select your security Question</p>
	    <select name="securityQuestion" required>
	    <option value="What was your first car?">What was your first car?</option>
	    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
	    <option value="What is your nickname?">What is your nickname?</option>
	    <option value="Others?">Others?</option>
	    </select>
	    <p>Enter Your Answer</p>
	    <input type ="text" name="answer" id="answer" placeholder="Enter answer" required><br>
	    <span class="error_form" id="answer_error_message"></span>
	    
	    
	    <p>Enter Password</p>
	    <input type ="password" name="password" id="password" placeholder="Enter Password" required><br>
	    <span class="error_form" id="pwd_error_message"></span>
	    <br>
	    <button type="submit" id="signup">signup</button>
	    
	    </form>	
		
</div>
<script type="text/javascript">
      $(function() {

         $("#name_error_message").hide();
         $("#email_error_message").hide();
         $("#mnum_error_message").hide();
         $("#answer_error_message").hide();
         $("#pwd_error_message").hide();

         var error_name = false;
         var error_email = false;
         var error_mnum = false;
         var error_answer = false;
         var error_password = false;

         $("#name").focusout(function(){
            check_name();
         });
         $("#email").focusout(function() {
            check_email();
         });
         $("#mobilenumber").focusout(function() {
           check_mnum();
         });
         $("#answer").focusout(function() {
        	 check_answer();
         });
         $("#password").focusout(function() {
        	 check_password();
         });

         function check_name() {
            var pattern = /^[a-zA-Z]*$/;
            var name_length = $("#name").val().length;
            var name = $("#name").val();
            
            if (pattern.test(name) && name != '' && name_length>3 &&name_length<20) {
               $("#name_error_message").hide();
               $("#name").css("border","3px solid green");
               error_name = true;
            } else {
               $("#name_error_message").html("Should contain only Characters and length sholud be [4-20]!");
               $("#name_error_message").show();
               $("#name").css("border","3px solid red");
               
              
            }
         }

         function check_email() {
             var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
             var email = $("#email").val();
             if (pattern.test(email) && email !== '') {
                $("#email_error_message").hide();
                $("#email").css("border","3px solid green");
                error_email = true;
             } else {
                $("#email_error_message").html("Email is not valid!");
                $("#email_error_message").show();
                $("#email").css("border","3px solid red");
                
                
                
             }
          }
         function check_mnum(){
        	 var mnum = $("#mobilenumber").val();
            	 var pattern = /^[6-9][0-9]{9}$/;
            	 if(pattern.test(mnum)){
            		 $("#mnum_error_message").hide();
                     	 $("#mobilenumber").css("border","3px solid green");
                     	error_mnum = true;
            	 }else{
            		 $("#mnum_error_message").html("Mobilenumber is not valid!");
                     $("#mnum_error_message").show();
                     $("#mobilenumber").css("border","3px solid red");
                     
                     
                     
            	 }

         }
         
         function check_answer() {
             var answer_length = $("#answer").val().length;
             if (answer_length <3 ) {
                $("#answer_error_message").html("Answer length should maintain (3-20)");
                $("#answer_error_message").show();
                $("#answer").css("border","3px solid red");
               
               
             } else {
                $("#answer_error_message").hide();
                $("#answer").css("border","3px solid green");
                error_answer = true;
             }
          }

         function check_password() {
            var regex=/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}/;
            var password = $("#password").val();

            if (regex.test(password)==false) {
               $("#pwd_error_message").html("Password should maintain length(4-12) and Includes Atleast 1 Capital, 1 small letter and 1 numeric number");
               $("#pwd_error_message").show();
               $("#password").css("border","3px solid red");
              
            } else {
               $("#pwd_error_message").hide();
               $("#password").css("border","3px solid green");
               error_password = true;
            }
         }

         
         $("#registration_form").submit(function() {  
        	 check_name();
        	 check_email();
        	 check_mnum();
        	 check_answer();
        	 check_password();
            
        console.log(error_name+" "+error_email+" "+error_mnum+" "+error_answer+" " +error_password);
            //document.write(error_name+" "+error_email+" "+error_password+" "+error_answer);
            if (error_name && error_email && check_mnum && error_password && error_answer) {
                return true;
            } else {
            	alert("fill this details properly");
            	//alert("fill this details properly"+error_name+" "+error_email+" "+error_mnum+" "+error_answer+" " +error_password);
                return false;            	
                }
         });
      });
   </script>

</body>
</html>

  