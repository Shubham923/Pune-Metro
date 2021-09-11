package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registration.UserRegDao;

/**
 * Servlet implementation class Logins
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int count=0;
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		PrintWriter out=response.getWriter();
		
		
		LoginDao dao=new LoginDao();
		UserRegDao user=new UserRegDao();
		try {
			user=dao.check(email, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			e.printStackTrace();
		}
		if(user!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("user",user);
			ServletContext context=getServletContext();
			context.setAttribute("bool",false);
		//	out.print(user.getName());
			if(user.getUsrid()==999)
			{
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			    rd.forward(request, response);
			}
			else
			{
			RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
		    rd.forward(request, response);
			}
		}
		else
		{

			 ServletContext context=getServletContext();
	         context.setAttribute("loginFailed", true);
			RequestDispatcher rd=request.getRequestDispatcher("userloginnew.jsp");
		    rd.forward(request, response);
		}
		
//		if(count>0)
//		{
//			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
//			rd.forward(request, response);
//		}
//		else
//		{
//			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
//			rd.forward(request, response);
//			
//		}
//		
//		
		
//		HttpSession session=request.getSession();
//		session.setAttribute( "email",email);
		
		
		
		
	}

}
