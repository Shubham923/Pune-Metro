

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

import querySet.QuerySet;

/**
 * Servlet implementation class MaintananceServ
 */
@WebServlet("/MaintananceServ")
public class MaintananceServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaintananceServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
		String lineno="",status="",msg="",finalMsg="";
		if(request.getParameter("radio")!=null)
		{
		lineno=request.getParameter("radio");
		msg=request.getParameter("msg");
		
		if(lineno.equals("line1"))
			finalMsg="THE LINE 1(PCMC TO SWARGATE) IS UNDER MAINTANANCE.INCONVENIANCE IS REGERETTED!!";
		else
			finalMsg="THE LINE 2(VANAZ TO RAMWADI) IS UNDER MAINTANANCE.INCONVENIANCE IS REGERETTED!!";

			finalMsg=finalMsg+"	"+msg;
		
			//System.out.println(finalMsg);
			
		PrintWriter out=response.getWriter();
		int linenoInt=lineno.equals("line1")?1:2;
		
		QuerySet qs=new QuerySet();
		try {
			qs.SetLineStatus(linenoInt);
			qs.Annoucements(finalMsg,linenoInt);
			ServletContext context=getServletContext();
			context.setAttribute("maint", true);

			RequestDispatcher rd=request.getRequestDispatcher("/maintanance.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		}
		
		if(request.getParameter("status")!=null)
		{
	    status=request.getParameter("status");
	    
	    if(status.equals("1"))
	    {
	    	QuerySet qs=new QuerySet();
			try {
				qs.SetLinesWorking(Integer.parseInt("1"));
				ServletContext context=getServletContext();
				context.setAttribute("maint", true);
				RequestDispatcher rd=request.getRequestDispatcher("/maintanance.jsp");
			
				rd.forward(request, response);
			} catch (SQLException e) {
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    else  if(status.equals("2"))
	    {
	    	QuerySet qs=new QuerySet();
			try {
				qs.SetLinesWorking(Integer.parseInt("2"));
				ServletContext context=getServletContext();
				context.setAttribute("maint", true);
				RequestDispatcher rd=request.getRequestDispatcher("/maintanance.jsp");
			
				rd.forward(request, response);
			 }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    	
	    
	    
		}
		
		
	
		
	}

}
