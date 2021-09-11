package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;

import registration.UserRegDao;


public class LoginDao {
	String query="select *from user where email=? and password=?";
	String url="jdbc:mysql://localhost:3306/Metro";
	String username="root";
	String pass="root";
	UserRegDao user=new UserRegDao();
	public UserRegDao check(String emailId,String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url, username, pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,emailId);
		st.setString(2,password );
		ResultSet rs=st.executeQuery();

		
		if(rs.next())
		{
			user.setUsrid(rs.getInt("usrid"));
			user.setName(rs.getString("name"));
			user.setEmailId(rs.getString("email"));
			user.setDob(rs.getLong("dob"));
			user.setPassword(rs.getString("password"));
			user.setMobileNo(rs.getLong("contact"));
			user.setUsertype(rs.getInt("user_type"));
			System.out.println(rs.getString(1));
			return user;
		}
		
		return null;
		
	}

}
