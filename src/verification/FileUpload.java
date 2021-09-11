package verification;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import querySet.QuerySet;
import registration.UserRegDao;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	public final static long leftLimit = 1;
	public final static  long rightLimit = 1;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 
			HttpSession session=request.getSession();
			UserRegDao user=(UserRegDao)session.getAttribute("user");	
			ResultSet rs=null;
		 
		 String path="/home/shubham/Downloads/first.pdf";
			QuerySet qs=new QuerySet();
			String url="jdbc:mysql://localhost:3306/Metro";
			String uname="root";
			String pass="root";
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Connection con=null;
			try {
				con = DriverManager.getConnection(url, uname, pass);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			String query="select stats.st_id,name,tkt_cnt,revenue from stats,Metro_Station where stats.st_id=Metro_Station.st_id";	   
			PreparedStatement st=null;
			try {
				st = con.prepareStatement(query);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				 rs=st.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			Document document = new Document();
	        try {
				PdfWriter.getInstance(document, new FileOutputStream(path));
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        document.open();
	        Font font = new Font(FontFamily.HELVETICA, 18, Font.BOLD);
	        Font italic = new Font(FontFamily.TIMES_ROMAN,12,Font.ITALIC);
	        Font normal = new Font(FontFamily.TIMES_ROMAN,12,Font.NORMAL);        
	        
	        
	        String collegeName = "PUNE METRO RAIL PROJECT\n\n";
	        String collegeAddress = "HEADQUARTER AT PUNE INSTITUTE OF COMPUTER TECHNOLOGY, DHANKAWADI, PUNE, MAHARASHTRA 411043\n"+
	        				"WEEKLY REPORT";
	        
	        Chunk para1 = new Chunk(collegeName, font);
	        Chunk para2 = new Chunk(collegeAddress, italic);
	        Paragraph comb=new Paragraph(); 
	        comb.add(new Chunk(para1));
	        comb.add(new Chunk(para2)); 
	        
	        PdfPTable table = new PdfPTable(2);
	        table.setWidthPercentage(110);
	        
	        PdfPCell cell = new PdfPCell(comb);
	        cell.setColspan(4);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell);
	        

	        long generatedLong = leftLimit + (long) (Math.random() * (rightLimit - leftLimit));
	        String applicationId = "Application ID : "+1000;
	        Chunk c = new Chunk(applicationId,normal);
	        Paragraph para = new Paragraph(c);
	        PdfPCell cell1 = new PdfPCell(para);
	        cell1.setColspan(4);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell1);
	        
	        
	        cell = new PdfPCell(new Phrase("Personal Details",font));
	        cell.setColspan(4);
	        table.addCell(cell);
	   
	        table.addCell("EMPLOYEE ID :: ");
	        table.addCell("ADMIN101");
	        table.addCell("Admin Name ");
	        table.addCell(user.getName());
	        table.addCell("Email ID ");
	        table.addCell(user.getEmailId()+"");
	        table.addCell("Contact No.");
	        table.addCell(user.getMobileNo()+"");
	        cell = new PdfPCell(new Phrase("Revenue Generated Since Last Week",font));
	        cell.setColspan(4);
	        table.addCell(cell);
	        try {
				document.add(table);
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        
	        PdfPTable table2  = new PdfPTable(3);
	        table2.setWidthPercentage(110);
	        table2.addCell("STATION NAME");
	        table2.addCell("NO. OF TICKTES ISSUED");
	        table2.addCell("REVENUE GENERATED");
	        try {
				while(rs.next() )
				{
					if(rs.getInt("tkt_cnt")!=0)
					{
				cell = new PdfPCell(new Phrase(rs.getString("name")));
			
		        cell.setColspan(1);
		        table2.addCell(cell);
		        cell = new PdfPCell(new Phrase(rs.getInt("tkt_cnt")+""));
		        cell.setColspan(1);
		        table2.addCell(cell);
		        cell = new PdfPCell(new Phrase(rs.getInt("revenue")+""));
		        cell.setColspan(1);
		        table2.addCell(cell);
		        
					
					
					}
				
		        }
				document.add(table2);
	        }catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        Date d=new Date();
	        table2 = new PdfPTable(4);
	        table2.setWidthPercentage(110);
	        cell = new PdfPCell(new Phrase(": ",font));
	        cell.setColspan(4);
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Report Date and Time"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        cell.addElement(new Phrase(d+""));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Time Period (In Days)"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        cell.addElement(new Phrase("7"));
	        table2.addCell(cell);
	        cell = new PdfPCell(new Phrase("Disclaimer",font));
	        cell.setColspan(4);
	        table2.addCell(cell);
	        cell = new PdfPCell(new Paragraph("This is system generated portable document format report. All dates are in YYYY-MM-DD format. Use for official use only. This document is digitally signed by " + user.getName()));
	        cell.setColspan(4);
	        table2.addCell(cell);
	        try {
				document.add(table2);
				
				ServletContext context=getServletContext();
				context.setAttribute("revpdf",true);
				RequestDispatcher rd=request.getRequestDispatcher("/fileUpload.jsp");
				rd.forward(request, response);
				
				
				
			} catch (DocumentException e) {
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        document.close();

		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	}

}
