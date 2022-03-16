
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="admin-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
   <header>
    <br>
    <div class="topnav sticky">
    <%
    String email=session.getAttribute("email").toString();
    response.setHeader("Chache-Control","no-cache,no-store,must-revalidate");
    if(email==null){
    	response.sendRedirect("login.jsp");
    }
    %>
   
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
            <a href="viewUser.jsp">View User <i class='fas fa-user'></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class='fas fa-comment-alt'></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
            <a href="cancelOrders.jsp">Canceled Orders <i class='fas fa-window-close'></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class='fas fa-dolly'></i></a>
            <a href="adminProfile.jsp">Profile <i class='fas fa-user-alt'></i></a>
            <a href="addAdmin.jsp">Add Admin <i class='fas fa-user-plus'></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
           </header>
