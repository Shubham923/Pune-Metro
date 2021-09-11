package verification;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * Servlet implementation class passReceipt
 */
@WebServlet("/passReceipt")
public class passReceipt extends HttpServlet {
	public final static long leftLimit = 1;
	public final static  long rightLimit = 1;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passReceipt() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
		 
			HttpSession session=request.getSession();
			UserRegDao user=(UserRegDao)session.getAttribute("user");	
			ResultSet rs=null;
			//System.out.println("hi");
		 String path="/home/shubham/Downloads/Receipt.pdf";
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
			
			//String query="select stats.st_id,name,tkt_cnt,revenue from stats,Metro_Station where stats.st_id=Metro_Station.st_id";	   
			String query="select passId, issueDate, validity, cost, passType, name from PassInfo, user where user.usrid=? and user.usrid=PassInfo.usrid";
			PreparedStatement st=null;
			try {
				st = con.prepareStatement(query);
				st.setInt(1, user.getUsrid());
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				 rs=st.executeQuery();
				 rs.next();
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
	        Font font = new Font(FontFamily.HELVETICA, 17, Font.BOLD);
	        Font italic = new Font(FontFamily.TIMES_ROMAN,12,Font.ITALIC);
	        Font normal = new Font(FontFamily.TIMES_ROMAN,12,Font.NORMAL);        
	        
	        
	        String collegeName = "PUNE METRO RAIL PROJECT\n\n";
	        String collegeAddress = "HEADQUARTER AT PUNE INSTITUTE OF COMPUTER TECHNOLOGY, DHANKAWADI, PUNE, MAHARASHTRA 411043\n"
	        		+"Pass Receipt";
	        
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
	        String applicationId = "Receipt Number : "+5000;
	        Chunk c = new Chunk(applicationId,normal);
	        Paragraph para = new Paragraph(c);
	        PdfPCell cell1 = new PdfPCell(para);
	        cell1.setColspan(4);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell1);
	        
	        
	        cell = new PdfPCell(new Phrase("User Details",font));
	        cell.setColspan(4);
	        table.addCell(cell);
	        
	        table.addCell("Pass ID ");
	        try {
				table.addCell(rs.getInt(1)+"");
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
	        table.addCell("Name  ");
	        table.addCell(user.getName());
	        table.addCell("Email ID  ");
	        table.addCell(user.getEmailId()+"");
	        table.addCell("Contact No.  ");
	        table.addCell(user.getMobileNo()+"");
	      //  cell = new PdfPCell(new Phrase("Pass Details",font));
	       // cell.setColspan(4);
	      //  table.addCell(cell);
	        try {
				document.add(table);
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        
	        PdfPTable table2  = new PdfPTable(3);
	        table2.setWidthPercentage(110);
	        
	        Date d=new Date();
	        table2 = new PdfPTable(4);
	        table2.setWidthPercentage(110);
	        cell = new PdfPCell(new Phrase("Pass Details: ",font));
	        cell.setColspan(4);
	        table2.addCell(cell);
	       
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Pass Type"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
			try {
				cell.addElement(new Phrase(rs.getString(5)+""));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        table2.addCell(cell);
	        
	        
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Cost (INR)"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        try {
				cell.addElement(new Phrase(rs.getInt(4)+""));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        table2.addCell(cell);
	        
	        
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Pass Issue Date"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        try {
				cell.addElement(new Phrase(rs.getDate(2)+""));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        table2.addCell(cell);
	        
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Pass Valid Upto"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        try {
				cell.addElement(new Phrase(rs.getDate(3)+""));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        table2.addCell(cell);
	        
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);
	        cell.addElement(new Phrase("Receipt Date and Time"));
	        table2.addCell(cell);
	        cell = new PdfPCell();
	        cell.setColspan(3);
	        cell.addElement(new Phrase(d+""));
	        table2.addCell(cell);
	        
	        
	        
//	        cell = new PdfPCell();
//	        cell.setColspan(1);
//	        cell.addElement(new Phrase("Time Period (In Days)"));
//	        table2.addCell(cell);
//	        cell = new PdfPCell();
//	        cell.setColspan(3);
//	        cell.addElement(new Phrase("7"));
//	        table2.addCell(cell);
	        
	        
	        cell = new PdfPCell(new Phrase("Disclaimer",font));
	        cell.setColspan(4);
	        table2.addCell(cell);
	        try {
				cell = new PdfPCell(new Paragraph("\nThis is system generated receipt. All dates are in YYYY-MM-DD format. This acknowledgement is valid only upto "+ rs.getDate(3) +". This document is digitally signed by Administrator.\n"));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        cell.setColspan(4);
	        table2.addCell(cell);
	        try {
				document.add(table2);
				
				ServletContext context=getServletContext();
				context.setAttribute("pdf1",true);
				RequestDispatcher rd=request.getRequestDispatcher("/pass.jsp");
				rd.forward(request, response);
				
				
				//write here
			} catch (DocumentException e) {
				RequestDispatcher rd1=request.getRequestDispatcher("/error.html");
				rd1.forward(request,response);
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        document.close();

		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	}

}
