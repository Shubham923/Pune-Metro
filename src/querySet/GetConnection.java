package querySet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

	public Connection CreateConnection()  
	{
	Connection con=null;
	String url="jdbc:mysql://localhost:3306/Metro";
	String uname="root";
	String pass="root";
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager.getConnection(url, uname, pass);
	}catch(Exception e)
	{
		
		e.printStackTrace();
	}
	return con;
	}
	
}
