<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>account creator</title>
</head>
<body>
	
	<%
	//getting input from the form of create2.jsp
	String name = request.getParameter("name");
	String dob =request.getParameter("dob");
	
	//DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	//java.util.Date dobs = format.parse(dob);
	
	String contact =request.getParameter("contactno").trim();
	long con_no=Long.parseLong(contact);
	String email =request.getParameter("email").trim();
	String adress =request.getParameter("address").trim();
	String account =request.getParameter("account").trim();
	String bal =request.getParameter("bal").trim();
	int balance=Integer.parseInt(bal);
	String acno =request.getParameter("accno").trim();
	long acnos=Long.parseLong(acno);
	
	//primary condition is to check if the session variable is stored or not 
	if(name!=null){
	
		//loading mysql drivers	
	Class.forName("com.mysql.jdbc.Driver");
	
	 /*creating a connection to the phpadmin, banking_system folder using drivermanager
    class by providing the folder name username and password*/
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking_system?"+"user=root&password=");
	
	//using prepared to statement to fire the query into mysql server to insert the account into the account table  
	PreparedStatement ps = con.prepareStatement("insert into account(name,dob,contact_no,email_id,adress,acc_type,balance,account_no) values(?,?,?,?,?,?,?,?)");
	
	//using setstring,setlong,setint  methods to give the values to the sql query 
	ps.setString(1, name);
	ps.setString(2, dob);
	ps.setLong(3, con_no);
	ps.setString(4, email);
	ps.setString(5, adress);
	ps.setString(6, account);
	ps.setInt(7, balance);
	ps.setLong(8, acnos);
	
	//executing the query and storing the result for verifying the process
	int res=ps.executeUpdate();
	if(res>0)
	{
		System.out.println("row  inserted");
		
		//closing the connection 
		con.close();
	}
	else
	{
		//this is an error case if there is any problem with the insert statement 
		System.out.println("Issue with the insert");
	
	}
		%>
		<%--it includes all the sidebars and background --%>
		<jsp:include page="header3.jsp"></jsp:include>
		
		<marquee><h2 style="color: green;"><i>- account has been created-</i></h2></marquee><br/><br/>
		<% 
		
	}
	else{
		System.out.println("The field Name: "+name+" is null");
		
	%>
	
	<%
	}
	%>
</body>
</html>