package smartcard;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import querySet.QuerySet;
import registration.UserRegDao;

/**
 * Servlet implementation class IssuePass
 */
@WebServlet("/IssuePass")
public class IssuePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssuePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("hdnbt12"));
		
		System.out.println(request.getParameter("hdnbt6"));
		
		System.out.println(request.getParameter("hdnbt3"));
		String num="";
		boolean bool;
		if(request.getParameter("hdnbt12")!=null)
			num=request.getParameter("hdnbt12");
		if(request.getParameter("hdnbt6")!=null)
			num=request.getParameter("hdnbt6");
		if(request.getParameter("hdnbt3")!=null)
			num=request.getParameter("hdnbt3");
		
		HttpSession session=request.getSession();
		UserRegDao user=(UserRegDao)session.getAttribute("user");
		QuerySet qs=new QuerySet();
		try {
			
			
			bool=qs.checkPass(user,Integer.parseInt(num));
			if(!bool)
			{
				System.out.println("Executed"+num+user.getUsrid());
				qs.Buy_a_Pass(user,Integer.parseInt(num));
				
				RequestDispatcher rd =request.getRequestDispatcher("pass.jsp");
				rd.forward(request, response);
				
			}
			
			else
			{
				
				//already bought a pass
				
				
			}
			
			
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			e.printStackTrace();
		}
		
	}
	
}
