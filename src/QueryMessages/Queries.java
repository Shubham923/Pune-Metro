package QueryMessages;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import querySet.QuerySet;
import verification.SendReply;

/**
 * Servlet implementation class Queries
 */
@WebServlet("/Queries")
public class Queries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Queries() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String msg=request.getParameter("message");
		//SendReply sr=new SendReply();
		System.out.println(name);
		System.out.println(email);
		System.out.println(msg);
		
		
		QuerySet qs=new QuerySet();
		try {
			qs.SendQueryMessage(name, email, msg);
			//sr.SendEmail(msg, email);
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			e.printStackTrace();
		}
	}

}
