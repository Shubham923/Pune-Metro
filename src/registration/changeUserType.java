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
 * Servlet implementation class changeUserType
 */
@WebServlet("/changeUserType")
public class changeUserType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeUserType() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	HttpSession session=request.getSession();
	UserRegDao user=(UserRegDao)session.getAttribute("user");
		QuerySet qs=new QuerySet();
		try {
			qs.changeUserType(user);
			ServletContext context=getServletContext();
			context.setAttribute("userType", true);
			RequestDispatcher rd=request.getRequestDispatcher("/settings.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
