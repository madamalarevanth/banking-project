<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.utilities.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction page</title>
</head>
<body>
 <%
  
//getting input from the form of transaction.jsp
    String acno = request.getParameter("accnum");
    int acnos = Integer.parseInt(acno);
    String amt = request.getParameter("amount");
    int amts=Integer.parseInt(amt);
    String type = request.getParameter("type");
    
    //getting seesion attribute which contains name
    //so that we could use it for obtaining the user details
    String name =(String)session.getAttribute("nameo");
    		
  //session is null or not		
   	if(name!=null)
   	{
   		//checking whether account no and amt fields are not null
   		if(acno!=null || amt!=null)
   		{
   			//creating an object of Transaction_operations to perform the logic 
   			Transaction_operations operations = new Transaction_operations();
   			
   			//working on users account
   			//get balance method is called which is present in Transaction_operations class 
   			//using this method to obtain the user balance 
   			int bal= operations.getBalance(name);
   			
   			//if the operation is debit from  then debiting amt from others account to user account
   			if(type.equals("debit_from"))
   			{
   			//user balance is increased 
   			bal+=amts;
   			}
   			else
   			{
   				//else refers to credit to which means credit from user to others account 
   				//deducing the balance from the user 
   				bal-=amts;	
   			}
   			//calling the updatebalance method to update the tuple of the user from Transaction_operations class
   			int result=operations.updateBalance(name,bal);
   			//working on the form specified account number(i.e others account)
   		    
   			//get balance method is called which is present in Transaction_operations class 
   			//using this method to obtain the others balance 
   			int othersbal = operations.getothersBalance(acnos);
   			
   			//if the operation is debit from  then debiting amt from others account to user account
   			if(type.equals("debit_from"))
   			{
   				//decrementing others balance
   				othersbal-=amts;
   			}
   			else
   			{
   			//else refers to credit to which means credit from user to others account 
   			//incrementing the balance from the user 
   				othersbal+=amts;	
   			}
   		   
   			//updating others balance it with new balance 
   			int result1 = operations.updateothersBalance(acnos, othersbal);
   			
   			//condition refers to the state of both the update statements being executed 
   			if(result>0 && result1>0)
   			{
%>

		<%--it includes all the sidebars and background --%>
		<jsp:include page="header3.jsp"></jsp:include>

<marquee><h2 style="color: green;"><i>- transaction has been authorized-</i></h2></marquee><br/><br/>

 <%
   			}
   			else
   			{
%>
<marquee><h2 style="color: green;"><i>- your transaction has been failed due to technichal error -</i></h2></marquee><br/><br/>
<% 
   			}
 		}
   	
   		else
   		{
   			System.out.println("amount and account are null"); 		
  %>
   		<marquee><h2 style="color: red;"><i>- Account_no or Amount are null-</i></h2></marquee><br/><br/>
<%
   		}
   	}	
   	else
   	{
   		System.out.println("name is null");
   	}
 %>
 </body>
</html>