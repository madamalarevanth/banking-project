package com.utilities;

import java.text.*;
import java.sql.*;

public class Bank_statement {
	 
	Connection con;
	ResultSet rs;
	Statement st;
	Transaction_operations trans =new Transaction_operations();
	
    
	private  int acc;
	private  int contact;
	private  String email ;
	private  String adress ;
	private  String acc_type ;
	private  int bal ;
	
	//getting user informartion
	public int userinfoelements(String name) throws SQLException
	{ 
		//creating a connection variable and getting connection 
		
		con =trans.getConnection();

	    //creating a statement variable to fire a sql query using createStatement() constructor

		st = con.createStatement();

		//sql query to obtain the information of others
		String strQuery1 = "select * from  account where name='"+name+"'";
	    
		//firing the query and storing the obtained result in the result set rs

	   rs = st.executeQuery(strQuery1);
	   
       while(rs.next())
       {
    	//getting all the information into variable and storing it   
    	   acc = rs.getInt("account_no");
    	
    	   contact =  rs.getInt("contact_no");

    	   email =  rs.getString("email_id");
    	
    	   adress =  rs.getString("adress");

    	   acc_type = rs.getString("acc_type");

    	   bal = rs.getInt("balance");

    	   
       }
 
       //closing connections
      
		con.close();

		return 1;
	}
	

	// getters and setters 
	public int getAcc() {
		return acc;
	}

	public void setAcc(int acc) {
		this.acc = acc;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getAcc_type() {
		return acc_type;
	}

	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}

	public int getBal() {
		return bal;
	}

	public void setBal(int bal) {
		this.bal = bal;
	}
	
	
 
}
