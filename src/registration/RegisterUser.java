package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import querySet.QuerySet;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email,password;
		String name=request.getParameter("name");
		 email=request.getParameter("email");
		 password=request.getParameter("password");
		long  contact =Long.parseLong(request.getParameter("contact"));
		String  dob=(request.getParameter("dob"));
		int usertype=Integer.parseInt(request.getParameter("usertype"));
		
		QuerySet qs=new QuerySet();
	// TODO Auto-generated method stub
			try
			{
			if(qs.isEmailAvail(email) || qs.isPhoneAvail(contact))
			{
				ServletContext context=getServletContext();
				context.setAttribute("regFail",true);
				RequestDispatcher rd=request.getRequestDispatcher("/signup.jsp");
				rd.forward(request, response);
				return;
			}
			String url="jdbc:mysql://localhost:3306/Metro";
			String uname="root";
			String pass="root";
			String query="insert into user(name,email,contact,dob,password,user_type) values(?,?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1,name);
			st.setString(2,email);
			st.setLong(3,contact);
			st.setString(4,dob);
			
			st.setString(5, password);
			st.setInt(6, usertype);
			st.executeUpdate();
			String query1="select *from user where email=? and contact=?";
			
			UserRegDao user=new UserRegDao();
			st=con.prepareStatement(query1);
			st.setString(1, email);
			st.setLong(2, contact);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				user.setUsrid(rs.getInt("usrid"));
				user.setName(rs.getString("name"));
				user.setEmailId(rs.getString("email"));
				user.setDob(rs.getLong("dob"));
				user.setPassword(rs.getString("password"));
				user.setMobileNo(rs.getLong("contact"));
				user.setUsertype(rs.getInt("user_type"));
				
			}
				HttpSession session=request.getSession();
				session.setAttribute("user", user);
				ServletContext context=getServletContext();
				context.setAttribute("bool",false);
				RequestDispatcher rd=request.getRequestDispatcher("/profile.jsp");
				rd.forward(request, response);
			
			}
			catch (Exception e)
			{
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				System.out.print(e);
			}
	
	
	}

}
