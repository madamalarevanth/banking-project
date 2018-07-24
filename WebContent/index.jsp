<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user verification page </title>
<style>
#grad1 {
    height: 200px;
    background: red; /* For browsers that do not support gradients */
    background: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1)); /* Standard syntax (must be last) */
}
</style>
</head>
<body id ="grad1">
	<%
	//getting input from the form of login2.html
	String name = request.getParameter("username").trim();
	String password = request.getParameter("password").trim();
	
	//loading mysql drivers
	Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver loaded...");
    
    /*creating a connection to the phpadmin ,banking_system folder using drivermanager
    class by providing the folder name username and password*/
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/banking_system?"+"user=root&password=");
    System.out.println("Connected to the database");
    
    //creating a statement variable to fire a sql query using createStatement() constructor
    Statement st= con.createStatement();
    
    //sql query to select everything from the tuple where name and password matches the user input  from the tuple authentication 
    String str_qry = "select * from authentication where username='" +name+ "' AND pswd='" +password+ "' ";
	
	//firing the query and storing the obtained result iin the result set rst 
	ResultSet rst=st.executeQuery(str_qry);
	
	// if we dont have any value in the resultset it means that there is no such tuple
	//where name and password is matching to the input so he is a invalid user
	if(!rst.next())
	{
		%>
		<h1>invalid user</h1>
		<%  
	}
	else 
	{
		
		//else use session variable to store name of the user for further use
		session.setAttribute("nameo",name);%>
<div id="container">

<%-- header3  includes all the sidebar and background --%> 
<jsp:include page="header2.jsp"></jsp:include>

<div id="content-container">
<div id="content"><center>
<marquee><h2 style="color: black;"><i>- Hello <%=name%>, welcome to the online banking -</i></h2></marquee><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="C:/Users/REVANTH/workspace/project/images/welcome.png" width="550" height="400px"/></center>
</div>

</div>

</div>
<%
//closing the connection using the connection variable con 
con.close();
}%>