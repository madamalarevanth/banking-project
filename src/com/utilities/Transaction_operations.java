package com.utilities;

import java.sql.*;
public class Transaction_operations 
{
	Statement st;
	Connection con;
	
	ResultSet rs;
	
	//a method to obtain balance from user account 
	public int getBalance(String name)
	{
		//creating a connection variable and getting connection 
		con=getConnection();
		//initializing  balance to 0
		int balance=0;
		try {
			
		    //creating a statement variable to fire a sql query using createStatement() constructor

			st= con.createStatement();
			
			//firing the query and storing the obtained result iin the result set rst 

			rs = st.executeQuery("select * from account where name='"+name+"'");
			
			//result set is not null 
			while(rs.next())
			{
				//getting balance from resultset
				balance=rs.getInt("balance");
				
				System.out.println("balance in the table is :"+balance);
			}
			//closing connection
			closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return balance;
	}
	
	//a method to obtain balance from others account 
	public int getothersBalance(int  acnos)
	{
		//creating a connection variable and getting connection 
		con=getConnection();
		
		//initializing  balance to 0
		int balance=0;
		
	
		try {
			
			//creating a statement variable to fire a sql query using createStatement() constructor
			
			st= con.createStatement();
			
			//firing the query and storing the obtained result iin the result set rst 

			rs=st.executeQuery("select balance from account where account_no="+acnos+"");
			System.out.println("result set balance is"+rs);
		
			
			//result set is not null 

			while(rs.next())
			{
				//getting balance from resultset
				balance=rs.getInt(1);
				System.out.println("balance in others table is :"+balance);
			}
			//closing connection 
			closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return balance;
	}
	
	// method to get connection load drivers
	public Connection getConnection()
	{
		try {
			//loading drivers
			Class.forName("com.mysql.jdbc.Driver");
			
			/*creating a connection to the phpadmin ,banking_system folder using drivermanager
		    class by providing the folder name username and password*/
			
			con=DriverManager.getConnection("jdbc:mysql://localhost/banking_system?"+"user=root&password=");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	//method t update the users tuple with new balance 
	public int updateBalance(String name,int balance)
	{
		//creating a connection variable and getting connection 

		con=getConnection();
		
		int res=0;
		try
		{
			//creating a statement variable to fire a sql query using createStatement() constructor

			st= con.createStatement();
		
			//firing the query and storing the obtained result iin the result set rst 

			res=st.executeUpdate("update account set balance="+balance+" where name='"+name+"'");
			
			//closing connection 
			
			closeConnection();
		}
		catch(Exception e)
		{
			
		}
		return res;
	}
	//method t update the others tuple with new balance 
	public int updateothersBalance(int account_no,int balance)
	{
		//creating a connection variable and getting connection 

		con=getConnection();
		int res=0;
		try
		{
			//creating a statement variable to fire a sql query using createStatement() constructor

			st= con.createStatement();

			//firing the query and storing the obtained result iin the result set rst 

			res=st.executeUpdate("update account set balance="+balance+" where account_no="+account_no+"");
			
			//closing the connection
			closeConnection();
		}
		catch(Exception e)
		{
			
		}
		return res;
	}
	
	public void closeConnection()
	{
		try {
			//closing the statement 
			st.close();
			//closing connection
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}
		
}
