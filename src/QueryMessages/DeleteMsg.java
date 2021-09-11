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

/**
 * Servlet implementation class DeleteMsg
 */
@WebServlet("/DeleteMsg")
public class DeleteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num="";		
		
		
		if(request.getParameter("bt")!=null)
			num=request.getParameter("bt");
		QuerySet qs=new QuerySet();
		try {
			qs.deleteMsg(Integer.parseInt(num));
			RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			e.printStackTrace();
		}
		
		System.out.println(num);
	}

}
