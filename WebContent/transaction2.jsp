<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>ACCOUNT CREATION</title>
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
<head>
<style>
#grad1 {
    height: 200px;
    background: red; /* For browsers that do not support gradients */
    background: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1)); /* Standard syntax (must be last) */
}
</style>
</head>
<body id="grad1">

<!-- Page Content -->
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1 class="w3-jumbo"><span class="w3-hide-small">BANKING</span> SYSTEM</h1>
    <p>TRANSACTIONS</p>
  </header>
  
   <!-- creating a form to get the input variables from user to perform transaction and passing it to debit.jsp-->
  
  <form action="debit.jsp" method="post">
      <p><input    class="w3-input w3-padding-16"type="text" name="accnum"	    placeholder="Account_number" ></p>
      <p><input    class="w3-input w3-padding-16"type="text" name="amount" 		placeholder="Amount"></p>
	  <p><select  class="w3-input w3-padding-16" name="type" >
  				<option value="credit_to">credit to</option>
  				<option value="debit_from">debit from</option>
    		</select>	
      </p>
      <p>
        <button class="w3-button w3-light-grey w3-padding-large" type="submit">
           SUBMIT REQUEST
        </button>
      </p>
    </form>

<!-- END PAGE CONTENT -->
</div>
</body>
</html>