package verification;

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

import querySet.QuerySet;
import registration.UserRegDao;

/**
 * Servlet implementation class OtpVerification
 */
@WebServlet("/OtpVerification")
public class OtpVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int enteredOtp=Integer.parseInt(request.getParameter("EnteredOtp"));
		ServletContext context=getServletContext();  
		int generatedOtp=(Integer)context.getAttribute("otp");  
		HttpSession session=request.getSession();
		UserRegDao user=(UserRegDao)session.getAttribute("user");
		PrintWriter out=response.getWriter();
		System.out.println(enteredOtp+"" +generatedOtp);
		
		if(enteredOtp==generatedOtp)
		{
			QuerySet qs=new QuerySet();
			
			try {
				qs.IssueSmartCard(user.getUsrid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("/ex-smartcard1.jsp");
			rd.forward(request, response);
			
		}
		else
		{
			
			context.setAttribute("bool",true);  
			
			RequestDispatcher rd=request.getRequestDispatcher("/ex-smartcard.jsp");
			rd.forward(request, response);
			
		}
		
	}

}
