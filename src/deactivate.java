import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registration.UserRegDao;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/deactivate")
public class deactivate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
			
	// TODO Auto-generated method stub
			try
			{
				int usrid=0;
				HttpSession  session=request.getSession();
				UserRegDao user=(UserRegDao)session.getAttribute("user");
				usrid=user.getUsrid();
				String name=user.getName();
				String email=user.getEmailId();
				long contact=user.getMobileNo();
				String password=user.getPassord();

				String url="jdbc:mysql://localhost:3306/Metro";
				String uname="root";
				String pass="root";
				
				//System.out.println("insert into inactive_user values("+usrid+","+name+","+email+","+contact+","+dob+","+password+")");
				int cardid=0,passid=0;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(url, uname, pass);
				String query="select cardid from Smart_card where usrid="+usrid;
				PreparedStatement st=con.prepareStatement(query);
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					cardid=rs.getInt(1);
				}
				 query="select passId from PassInfo where usrid="+usrid;
				st=con.prepareStatement(query);
				rs=st.executeQuery();
				while(rs.next())
				{
					passid=rs.getInt(1);
				}
				System.out.println(password);
				
				
				query=" delete from user_history where cardid=(select cardid from Smart_card where usrid=?)";
				st=con.prepareStatement(query);
				st.setInt(1, usrid);
				st.executeUpdate();
				
				query="delete from Smart_card where usrid="+usrid;
				st=con.prepareStatement(query);
				st.executeUpdate();
				query="delete from PassInfo where usrid="+usrid;
				st=con.prepareStatement(query);
				st.executeUpdate();
				query="delete from user where usrid="+usrid;
				st=con.prepareStatement(query);
				st.executeUpdate();
				query="insert into inactive_user values("+usrid+",?,?,"+contact+",?,"+cardid+","+passid+")";
				st=con.prepareStatement(query);
				st.setString(1, name);
				st.setString(2, email);
				st.setString(3, password);
				st.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
			    rd.forward(request, response);

			
			
			
			}
			catch (Exception e)
			{
				System.out.println("executed");
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				System.out.print(e);
			}
	
	
	}

}

