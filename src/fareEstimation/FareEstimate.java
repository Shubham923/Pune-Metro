package fareEstimation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FareEstimate
 */
@WebServlet("/FareEstimate")
public class FareEstimate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FareEstimate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Hi there");
		
		String source=request.getParameter("Source");
		String destination=request.getParameter("Destination");
		String concat=source.concat(destination);
		
		int route_id=Integer.parseInt(concat);
		
		PrintWriter out=response.getWriter();
		
			
		
		
		
	}

}
