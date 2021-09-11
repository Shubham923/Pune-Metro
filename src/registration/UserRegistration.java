package registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class UserRegistration {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		try
		{
		String url="jdbc:mysql://localhost:3306/Metro";
		String uname="root";
		String password="test";
		String query="insert into user(name,email,contact,dob,password) values(?,?,?,?,?)";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url, uname, password);
		PreparedStatement st=con.prepareStatement(query);
		UserRegDao user=new UserRegDao();
		user.getInfo();
		st.setString(1,user.getName());
		st.setString(2,user.getEmailId());
		st.setLong(3,user.getDob());
		st.setLong(4,user.getMobileNo());
		st.setString(5, user.getPassord());
		
		String query1="select *from User";
		
		st.executeUpdate();
		
		
		ResultSet rs=st.executeQuery(query1);
		
		while(rs.next())
		{
			String display=rs.getInt(1)+"	"+rs.getString(2)+"		"+rs.getString(3)+"		"+rs.getDate(4)+"		"+rs.getLong(5)+"	"+rs.getDate(6)+"		"+rs.getString(7)+"		"+rs.getString(8);
			System.out.println(display);
		}
		}
		catch (Exception e)
		{
			
			System.out.print(e);
		}
	}

}
