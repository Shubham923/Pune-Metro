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
 * Servlet implementation class Reply
 */
@WebServlet("/Reply")
public class Reply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reply=request.getParameter("reply");
		SendReply sr=new SendReply();

		QuerySet qs=new QuerySet();
		try {
			qs.sendReply(reply,request.getParameter("email"));
			sr.SendEmail(reply, request.getParameter("email"));
			RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
