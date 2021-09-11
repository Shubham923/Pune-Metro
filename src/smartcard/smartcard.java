package smartcard;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fareEstimation.FindStation;
import querySet.QuerySet;
import registration.UserRegDao;
import verification.SendTransactionDet;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/SmartCard")
public class smartcard extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	int card_id;
	int from,to;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		UserRegDao user=(UserRegDao)session.getAttribute("user");
		try
		{	
			QuerySet qs1=new QuerySet();
			card_id=Integer.parseInt(request.getParameter("card"));
			from=Integer.parseInt(request.getParameter("Source"));
			to=Integer.parseInt(request.getParameter("Destination"));
			String src=qs1.GetStationFromId(from);
			String dest=qs1.GetStationFromId(to);
			int cost1=qs1.GetTicketFare(from, to);
			System.out.println(card_id);
		


	
	
	// TODO Auto-generated method stub
	
	
			int routeid=(from*100)+to;
	
			String url="jdbc:mysql://localhost:3306/Metro";
			String uname="root";
			String pass="root";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, uname, pass);
			String query="select ticketPrice from Tickets where routeId="+routeid;
	
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs=st.executeQuery(query);
			int cost=0;
		while(rs.next())
		{
			//System.out.println(rs.getInt(1));
			cost=rs.getInt(1);
			System.out.println(cost);
		}

			QuerySet qs=new QuerySet();
			qs.updateBalance(cost, card_id, from);
			FindStation fs=new FindStation();
			String stations[]=fs.GetFare(from, to);
			request.setAttribute("stations", stations);
			request.setAttribute("source", src);
			request.setAttribute("destination", dest);
			request.setAttribute("cost", cost1);
			SendTransactionDet std=new SendTransactionDet();
			std.SendEmail(user,src,dest,cost1);
			RequestDispatcher rd=request.getRequestDispatcher("/fare1.jsp");
			rd.forward(request, response);

		}
			
			catch (Exception e)
			{
				
				System.out.print(e);
				out.println(e);
				
				RequestDispatcher rd=request.getRequestDispatcher("/NoBalanceError.jsp");
				rd.forward(request, response);
			}
	
	
	}

}
