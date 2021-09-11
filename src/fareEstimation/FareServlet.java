package fareEstimation;

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
 * Servlet implementation class FareServlet
 */
@WebServlet("/FareServlet")
public class FareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FareServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String src=request.getParameter("src");
		String dest=request.getParameter("dest");
		QuerySet qs=new QuerySet();
		String srcName="",destName="";
		try {
			srcName = qs.GetStationFromId(Integer.parseInt(src));
			 destName=qs.GetStationFromId(Integer.parseInt(dest));
		} catch (NumberFormatException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println(srcName+destName);
		
		request.setAttribute("source", srcName);
		request.setAttribute("destination", destName);
		GetFare gt=new GetFare();
		try {
			request.setAttribute("cost", gt.GetTicketFare(Integer.parseInt(src), Integer.parseInt(dest)));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(src+dest);
		
		
		FindStation fs=new FindStation();
		try {
			String stations[]=fs.GetFare(Integer.parseInt(src), Integer.parseInt(dest));
			request.setAttribute("stations", stations);
			for(String st:stations)
			{
				System.out.println(st);
			}
			RequestDispatcher rd=request.getRequestDispatcher("fare1.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
			rd1.forward(request,response);
			e.printStackTrace();
		}
		
	}

}
