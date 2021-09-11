package verification;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

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
 * Servlet implementation class IssueSmartCard
 */
@WebServlet("/IssueSmartCard")
public class IssueSmartCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueSmartCard() {
        super();
        // TODO Auto-generated constructor stub
    }

    public int GenerateOtp()
    {
    	
    	Random rand=new Random();
    	
    	int otp=rand.nextInt(100);
    	return otp;
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int otp;
		HttpSession session=request.getSession();
		UserRegDao user=(UserRegDao)session.getAttribute("user");
		//SendSms se=new SendSms();
		QuerySet qs=new QuerySet();
		try {
			//qs.IssueSmartCard(user.getUsrid());
			//se.SendOtp( user.getMobileNo()+"");
			
			otp=GenerateOtp();
			//request.setAttribute("otp",otp);
				ServletContext context=getServletContext();  
				context.setAttribute("otp",otp);  
			SendEmail se=new SendEmail();
			if(se.SendEmail(user.getEmailId(),otp)==1)
			{
			RequestDispatcher rd=request.getRequestDispatcher("/OTP.jsp");
			rd.forward(request,response);
			}
			else
			{
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			//problem code
			e.printStackTrace();
		}
		
	}

}
