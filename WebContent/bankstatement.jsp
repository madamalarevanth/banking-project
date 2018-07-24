<%@page import="com.sun.org.apache.xerces.internal.impl.RevalidationHandler"%>
<%@ page import="java.text.*" %>
<%@  page import="com.utilities.*" %>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<br>
<%

  String sdate = request.getParameter("sdate");
  String edate = request.getParameter("edate");
  
  System.out.println("date is "+sdate);
  
   // DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	//java.util.Date sd = format.parse(sdate);
	//java.util.Date ed = format.parse(edate);

  String name =(String)session.getAttribute("nameo");
  int total_count=0;
   
   Bank_statement bank = new Bank_statement();
   Transaction_operations trans = new Transaction_operations();	
    
    System.out.println("name sent is "+name);
    
  int result = bank.userinfoelements(name);
 
    
  if(result == 1)
  {
	  System.out.println("sucessfully acquired");
  }
   
   
      Connection con;
   
        Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost/banking_system?"+"user=root&password=");
	    
	  Statement st = con.createStatement();
	  String strQuery = "select * from transactions where account_no="+bank.getAcc()+" and date between '"+sdate+"' and '"+edate+"'"; 
	  ResultSet res = st.executeQuery(strQuery);
	  
	  
	%>  
	
	<jsp:include page="header3.jsp"></jsp:include>
	
	<table style="padding-left:150px;">
<tr style="background-color:efefef;">
<td><b>Account No</b></td><td>:</td><td><%=bank.getAcc()%></td>
</tr>
<tr style="background-color:efefef;">
<td><b>Username</b></td><td>:</td><td><%=name%></td>
<td><b>Contact</b></td><td>:</td><td><%=bank.getContact()%></td>
</tr>
<tr style="background-color:efefef;">
<td><b>Address</b></td><td>:</td><td><%=bank.getAdress()%></td>
<td><b>Account type</b></td><td>:</td><td><%=bank.getAcc_type()%></td>
</tr>
<td><b>Balance</b></td><td>:</td><td><%=bank.getBal()%></td>
<tr>
</table>
<br><br><br>
<table width="700px" align="center"  style="border:1px solid #000000;" >
<tr style="background-color:efefef;">
<td><b>SNo</b></td>
<td><b>Date</b></td>
<td><b>Description</b></td>
<td><b>Cheque_no</b></td>
<td><b>withdrawal</b></td>
<td><b>deposit</b></td>
<td><b>Available balance</b></td>
</tr>	 
<%
   int count=0 ;
  String color="null";
		  
	  while(res.next())
	  { 
		  if((count%2)==0)
		{
			color = "#eeffee";	
		}
		else
		{
			 color = "#F9EBB3";
		}
		  count++;  
	 %>
	 <tr style="background-color:<%=color%>;">
<td><%=count%></td>
<td><%=res.getDate(3)%></td>
<td><%=res.getString(4)%></td>
<td><%=res.getInt(5)%></td>
<td><%=res.getInt(6)%></td>
<td><%=res.getInt(7)%></td>
<td><%=res.getInt(8)%></td>
</tr>
	 <%
		}
	 %>
	  </table>
	  <br><br>
	  <table width="100px" align="center" border=0><tr>
	  <%
	 if(count==0)
		{
		 %>
         <tr style="background-color:<%=color%>;">
            <td colspan=8 align="center">No Record</td>
         </tr>
     <%
		}
	  
	  con.close();
	    System.out.println("Disconnected from database");
    
 %> 
</tr>
</table>

</body>
</html>


