<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>credit card authentication</title>
<style type=text/css>
  
  body {
     
        background-image: url("C:/Users/REVANTH/Pictures/my start wallpapers/credit.jpg");
        } 
  
  </style>
</head>
<body>
	<%
	//getting input from the form of cerditcard2.html
	String name = request.getParameter("name");
	String cardnum =(String)request.getParameter("cardnum");
	int cardnums= Integer.parseInt(cardnum.trim());
	String cvv=(String)request.getParameter("cvv");
	int cvvs = Integer.parseInt(cvv);
	String amt =(String)request.getParameter("amt");
	int amts = Integer.parseInt(amt);
	
	//primary condition is to check y=that amount is less than 1 lakh  
	if(amts>100000){
		%>
		<jsp:include page="header3.jsp"></jsp:include>
		<center>
<marquee><h2 style="font-size:20px; color: green;" ><i> transaction can't be authorized as amt is greater than 1 lakh </i></h2></marquee><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</center>
  <%
  }
	else{
	
	//loading my sql drivers
	Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver loaded...");
    
    /*creating a connection to the phpadmin ,banking_system folder using drivermanager
    class by providing the folder name username and password*/
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/banking_system?"+"user=root&password=");
    System.out.println("Connected to the database");
    
    //creating a statement variable to fire a sql query using createStatement() constructor

    Statement st= con.createStatement();
    
    //sql query to select everything from the tuple where name and password matches the user input  from the tuple authentication 

    String str_qry = "select * from credit_card where name='"+name+"' and card_no="+cardnums+" and cvv="+cvvs+"";
	
	//firing the query and storing the obtained result iin the result set rst 

	ResultSet rst=st.executeQuery(str_qry);
	//since you are getting result set
	
	//if condition refers to an empty result set
	if(rst.next()==false)
	{	
		%>
		
		<jsp:include page="header3.jsp"></jsp:include>
		<center>
<marquee><h2 style="font-size:20px; color: green;" ><i> transaction can't be authorized</i></h2></marquee><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</center>
		<%  
	
	}
	
	else 
	{ 
	%>

    <jsp:include page="header3.jsp"></jsp:include>
    
    <center>
<marquee><h2 style="font-size:20px; color: green;" ><i> transaction authorized</i></h2></marquee><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</center>
<%
//closing connection 
  con.close();
	}
	}
%>