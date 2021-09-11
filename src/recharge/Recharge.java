package recharge;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
import registration.UserRegDao;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/Recharge")
public class Recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		long  Amt=Long.parseLong(request.getParameter("Amt"));
			
	// TODO Auto-generated method stub
		if(Amt>0 && Amt<1000)
		{
			try
			{
				int usrid=0;
				HttpSession  session=request.getSession();
				UserRegDao user=(UserRegDao)session.getAttribute("user");
				usrid=user.getUsrid();
				String url="jdbc:mysql://localhost:3306/Metro";
				String uname="root";
				String pass="root";
				String query="update Smart_card set balance=balance+"+Amt+",last_rec=curtime(),validity=DATE_ADD(curdate(),INTERVAL 1 YEAR) where usrid="+usrid;				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(url, uname, pass);
				PreparedStatement st=con.prepareStatement(query);
				st.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("/congrats.jsp");
			    rd.forward(request, response);

			
			
			
			}
			catch (Exception e)
			{
				
				System.out.print(e);
			}
		}
		else
		{
			ServletContext context=getServletContext();
			context.setAttribute("rechargeFail", true);
			RequestDispatcher rd1=request.getRequestDispatcher("/recharge.jsp");
		    rd1.forward(request, response);

		
		
		}
	
	
	}

}
