<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}

</style>
<body bgcolor="#808000">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <img src="C:/Users/REVANTH/workspace/project/images/Bank_logo.jpg" style="width:100%">
  <a href="create2.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
  <img src="C:/Users/REVANTH/workspace/project/images/login.jpg" style="width:100%">
    <p>Create New Account</p>
  </a>
  <a href="transaction2.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <img src="C:/Users/REVANTH/workspace/project/images/credit.jpg" style="width:100%">
    <p>Transactions</p>
  </a>
  <a href="display2.html" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <img src="C:/Users/REVANTH/workspace/project/images/bankstatement.jpg" style="width:100%">
    <p>Bank Statement</p>
  </a>
  <a href="creditcard2.html" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
 <img src="C:/Users/REVANTH/workspace/project/images/creditcard_trans.jpg" style="width:100%">
    <p>Authorize Credit Card Transactions</p>
  </a>
  <a href="logout.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
 <img src="C:/Users/REVANTH/workspace/project/images/logout.jpg" style="width:100%">
    <p>Logout</p>
  </a>
</nav>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1 class="w3-jumbo"><span class="w3-hide-small">ONLINE</span> BANKING</span> SYSTEM</h1>
  </header>

<!-- END PAGE CONTENT -->
</div>

  <%String name=(String)session.getAttribute("nameo");%>

   <%
    if(name!=null)
    {%>
        <li> <a href="logout.jsp">Logout</a></li>
    <%}%>

</body>
</html>
