package registration;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class changePass
 */
@WebServlet("/changePass")
public class changePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		QuerySet qs=new QuerySet();
		HttpSession session=request.getSession();
		UserRegDao user=(UserRegDao)session.getAttribute("user");
		if(pass1.equals(pass2))
		{
			try {
				qs.ResetPassword(user.getUsrid(),pass1);
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				e.printStackTrace();
			}
			
		}
		else
		{
			ServletContext context=getServletContext();
			context.setAttribute("changePass", true);
			RequestDispatcher rd=request.getRequestDispatcher("settings.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
