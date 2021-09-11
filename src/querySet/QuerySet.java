package querySet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import registration.UserRegDao;

public class QuerySet {
	
	Connection con=null;
	GetConnection gc=new GetConnection();
	PreparedStatement st = null;
	public void registerUser(String name,String email,String password,long contact,long dob) throws SQLException 
	{
		String query="insert into user(name,email,contact,dob,validity,passType,password) values(?,?,?,?,?,?,?)";
		con=gc.CreateConnection();
		
		st=con.prepareStatement(query);
		st.setString(1,name);
		st.setString(2,email);
		st.setLong(3,contact);
		st.setLong(4,dob);
		st.setLong(5,20180707);
		st.setString(6,"");
		st.setString(7, password);
		String query1="select *from user";
		st.executeUpdate();
		ResultSet rs=st.executeQuery(query1);
		while(rs.next())
		{
			String display=rs.getInt(1)+"	"+rs.getString(2)+"		"+rs.getString(3)+"		"+rs.getDate(4)+"		"+rs.getLong(5)+"	"+rs.getDate(6)+"		"+rs.getString(7)+"		"+rs.getString(8);
			System.out.println(display);
		}
	}
	
	
//==================================================================================================================================================
//To check whether entered credentials are valid or not
	public UserRegDao check(String emailId,String password) throws ClassNotFoundException, SQLException
	{
		UserRegDao user=new UserRegDao();
		con=gc.CreateConnection();
		String query="select *from user where email=? and password=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,emailId);
		st.setString(2,password );
		ResultSet rs=st.executeQuery();

		if(rs.next())
		{
			user.setName(rs.getString("name"));
			user.setEmailId(rs.getString("email"));
			user.setDob(rs.getLong("dob"));
			user.setPassType(rs.getString("passType"));
			user.setPassword(rs.getString("password"));
			user.setValidity(rs.getLong("validity"));
			user.setMobileNo(rs.getLong("contact"));
			System.out.println(rs.getString(1));
			return user;
		}
		
		return null;
		
	}
//	=====================================================================================================================
	//get all staion value in drop down menu
	public ResultSet GetStations(int lineno) throws SQLException
	{
		  String query="select name ,Metro_Station.st_id from Metro_Station,Route_track where Route_track.st_id=Metro_Station.st_id ";
	      Connection con=null;
          GetConnection gc=new GetConnection();
          con=gc.CreateConnection();
          PreparedStatement st=con.prepareStatement(query);
          ResultSet rs=st.executeQuery();
		
		return rs;
		
		
	}
	
	//==================================================================================================================
	
	public String GetStationFromId(int st_id) throws SQLException
	{
		String query="select name from Metro_Station where st_id=?";
	      Connection con=null;
        GetConnection gc=new GetConnection();
        con=gc.CreateConnection();
        PreparedStatement st=con.prepareStatement(query);
        st.setInt(1, st_id);;
        ResultSet rs=st.executeQuery();
        rs.next();
        String station=rs.getString("name");
        
        return station;
		
	}
	
	//======================================================================================================================
	
	//updatin pass info
	public boolean checkPass(UserRegDao user,int num) throws SQLException
	{
		
		String query="select usrid from PassInfo where usrid=?";
	    Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    PreparedStatement st=con.prepareStatement(query);
	    st.setInt(1,user.getUsrid());
		ResultSet rs=st.executeQuery();
		
		if(rs.next())
		{
			System.out.println(rs.getInt(1));
			return true;
		}
		return false;
		
	}
	//==============================================================================================================================
	
	public void Buy_a_Pass(UserRegDao user,int num) throws SQLException
	{
		String query=" insert into PassInfo(issueDate,validity,usrid,cost,passType) values(CURDATE(),DATE_ADD(CURDATE(), INTERVAL ? MONTH),?,?,?)";
			
		
		  String type="";
		  int cost=0;
		  if(num==3)
		  {
			  type="Basic-Pass";
			  cost=300;
		  }
		  else if(num==6)
		  {
			  
			  type="Gold-Pass";
			  cost=600;

		  }
		  else if(num==12)
		  {
			  
			  type="Premium-Pass";
			  cost=800;

		  }
		  Connection con=null;
		  GetConnection gc=new GetConnection();
		  con=gc.CreateConnection();
		  PreparedStatement st=con.prepareStatement(query);
     
		  

		st.setInt(1, num);

		st.setInt(2, user.getUsrid());
		
		st.setInt(3, cost);
		
		st.setString(4, type);
		st.executeUpdate();
	}
	
	//================================================================================================================================
	//getting pass info
	
	public ResultSet GetPassInfo(int id) throws SQLException
	{
		String query="select *from PassInfo where usrid=?";
		
		  Connection con=null;
		  GetConnection gc=new GetConnection();
		  con=gc.CreateConnection();
		  PreparedStatement st=con.prepareStatement(query);
		  st.setInt(1, id);
		  
		  ResultSet rs=st.executeQuery();
		
		 return rs;

		
	}
	
	//==================================================================================================================================
	//reset Password
	
	public void ResetPassword(int id,String pass) throws SQLException
	{

		String query="update user set password=? where usrid=?";
		System.out.println(pass+id);
		  Connection con=null;
		  GetConnection gc=new GetConnection();
		  con=gc.CreateConnection();
		  PreparedStatement st=con.prepareStatement(query);
		  
		  st.setString(1, pass);
		  st.setInt(2, id);
		  
		  st.executeUpdate();
		
	}
	//====================================================================================================================================
	//already bought a Smart Card?

	public boolean checkSmartCard(UserRegDao user) throws SQLException
	{
		
		String query="select usrid from Smart_card where usrid=?";
	    Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    PreparedStatement st=con.prepareStatement(query);
	    st.setInt(1,user.getUsrid());
		ResultSet rs=st.executeQuery();
		
		if(rs.next())
		{
			return true;
		}
		return false;
		
	}
	
	
	public void IssueSmartCard(int id) throws SQLException
	{
		

		String query="insert into Smart_card(balance,usrid) values(0,?)";
	    Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    PreparedStatement st=con.prepareStatement(query);
	    st.setInt(1,id);
		st.executeUpdate();
	}
	//===================================================================================================================================
	public int GetTicketFare(int st_id1,int st_id2) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String query="select *from Route_track where st_id=?";
		String query1="select *from Tickets where routeId=?";
		int i=0,cost=0;
		String[] stations=new String[40];
		Connection con=null;
		GetConnection gc =new GetConnection();
		con=gc.CreateConnection();
		PreparedStatement st=con.prepareStatement(query);
		int line1=0,line2=0;
		System.out.println("Enter Source and Destination");
		Scanner sc=new Scanner(System.in);
		
		st.setInt(1, st_id1);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			line1=rs.getInt("lineno");
			System.out.println(line1);
			
		}
		
		st.setInt(1, st_id2);
		rs=st.executeQuery();
		if(rs.next())
		{
			line2=rs.getInt("lineno");
			System.out.println(line2);
			
		}
		if(line1==line2)
		{

			int  price=st_id1*100+st_id2;
			st=con.prepareStatement(query1);
			st.setInt(1, price);
			rs=st.executeQuery();
			if(rs.next())
			{
				System.out.println(rs.getInt("ticketPrice"));
				cost=rs.getInt("ticketPrice");
			}
		}
		else
		{
	
			int cost1=0,cost2=0;
			if(st_id1 < st_id2 && st_id1<=21)				//Up direction
			{
				st.close();
				rs.close();
				st=con.prepareStatement(query1);
				st.setInt(1, (st_id1*100+21));
				System.out.println((st_id1*100+21));
				rs=st.executeQuery();
				if(rs.next())
				{
					cost1=rs.getInt("ticketPrice");
				}
				st=con.prepareStatement(query1);
				st.setInt(1, st_id2*100+21);
				rs=st.executeQuery();
				if(rs.next())
				{
					cost2=rs.getInt("ticketPrice");
				}
				
				cost=cost1+cost2;
			}
			
			
			if(st_id1 < st_id2 && st_id1>21)				//Up direction
			{
				i=0;
				st.close();
				rs.close();
				st=con.prepareStatement(query1);
				st.setInt(1, (st_id1*100+21));
				System.out.println((st_id1*100+21));
				rs=st.executeQuery();
				if(rs.next())
				{
					cost1=rs.getInt("ticketPrice");
				}
				st=con.prepareStatement(query1);
				st.setInt(1, st_id2*100+21);
				rs=st.executeQuery();
				if(rs.next())
				{
					cost2=rs.getInt("ticketPrice");
				}
				
				cost=cost1+cost2;
				
				
				
				
			}
			
			
			else	if(st_id1 > st_id2 && st_id1>21)			//Up direction
			{
				i=0;
				st.close();
				rs.close();
				st=con.prepareStatement(query1);
				st.setInt(1, (st_id1*100+21));
				System.out.println((st_id1*100+21));
				rs=st.executeQuery();
				if(rs.next())
				{
					cost1=rs.getInt("ticketPrice");
				}
				st=con.prepareStatement(query1);
				st.setInt(1, st_id2*100+21);
				rs=st.executeQuery();
				if(rs.next())
				{
					cost2=rs.getInt("ticketPrice");
				}
				
				cost=cost1+cost2;
				
							
			}
			
		}
	

		return cost;
	}
	
	
	//=================================================================================================================================
	
	//Send a Query Message....
	public void SendQueryMessage(String name,String email,String msg) throws SQLException
	{
		
		String query="insert into Messages(name,email,msg) values(?,?,?)";
	    Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    PreparedStatement st=con.prepareStatement(query);
	    st.setString(1,name);
	    st.setString(2, email);
	    st.setString(3, msg);
		st.executeUpdate();
	}
	
	
	//===================================================================================================================================
	
	//see mesgs
	public ResultSet ReceiveQueryMessage() throws SQLException
	{
		
		String query="select *from Messages";
	    Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    PreparedStatement st=con.prepareStatement(query);
	   
		ResultSet rs=st.executeQuery();
		return rs;
		
	}
	
	//======================================================================================================================================
	//PROCEDURE FUNCTION FOR UPDATING BALANCE
	
	public void updateBalance(int cost,int card_id,int from) throws SQLException				//this is procedure
	{
		Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    	
	    String query = "{CALL UpdateBalance(?,?,?)}";
	    CallableStatement stmt = con.prepareCall(query);
	    stmt.setInt(1,cost);
	    stmt.setInt(2,card_id);
	    stmt.setInt(3,from);
	    stmt.executeUpdate();
		
	}
	
	//=======================================================================================================================================
	//CODE FOR REPLY FROM ADMIN
	
	public void sendReply(String reply,String email) throws SQLException
	{
		Connection con=null;
	    GetConnection gc=new GetConnection();
	    con=gc.CreateConnection();
	    String query="update Messages set reply=? where email=?";
	    PreparedStatement st=con.prepareStatement(query);
	    st.setString(1, reply);
	    st.setString(2, email);
	    st.executeUpdate();
		
		
	}
	//=========================================================================================================================================
	//GET WORKING STATIONS FROM LINE NO STATUS.
	
	public ResultSet GetWorkingStations() throws SQLException
	{
		  String query="select  Metro_Station.name,Metro_Station.st_id from Metro_Station,Metro_line,Route_track where status=1 and Metro_line.Lineno=Route_track.lineno and Metro_Station.st_id=Route_track.st_id";
;
	      Connection con=null;
          GetConnection gc=new GetConnection();
          con=gc.CreateConnection();
          PreparedStatement st=con.prepareStatement(query);
          ResultSet rs=st.executeQuery();
		
		return rs;
		
		
	}
	
	
	public void SetLineStatus(int lineno) throws SQLException
	{
		 String query="update Metro_line set status=0 where Lineno="+lineno;
		 
			   Connection con=null;
			   GetConnection gc=new GetConnection();
			   con=gc.CreateConnection();
			   PreparedStatement st=con.prepareStatement(query);
			   st.executeUpdate();
		
	}
	
	
	public void SetLinesWorking(int lineno) throws SQLException
	{
		 String query="update Metro_line set status=1 where Lineno=?";
		 String query1="delete from Maintanance where lineno=?";
		 Connection con=null;
		   GetConnection gc=new GetConnection();
		   con=gc.CreateConnection();
		   PreparedStatement st=con.prepareStatement(query);
		   st.setInt(1, lineno);
		   st.executeUpdate();
		   st=con.prepareStatement(query1);
		   st.setInt(1, lineno);
		   st.executeUpdate();

	}
	
	
	public String IsWorking() throws SQLException
	{
		String query="select Lineno from Metro_line where status=0";
		String s1="*LINE 1 IS UNDER MAINTANANCE.INCONVENIANCE IS REGRETTED!! ";
		String s2="*LINE 2 IS UNDER MAINTANANACE.INCONVENIANCE IS REGRETTED!! ";
		String s3="BOTH LINES ARE UNDER MAINTANANACE.INCONVENIANCE IS REGRETTED";
		String [] line=new String[2];
		int i=0;
		 Connection con=null;
		   GetConnection gc=new GetConnection();
		   con=gc.CreateConnection();
		   PreparedStatement st=con.prepareStatement(query);
		   ResultSet rs=st.executeQuery();
		   if(!rs.next())
			   return null;
		   else
			   rs.previous();
		   while(rs.next())
		   {
		   line[i]=rs.getString("Lineno");
		   System.out.println(line[i]);
		   i++;
		   }
		 //  System.out.println(line.length);
		   if(i>1)
			   return s3;
		   if(line[0].equals("1"))
			   return s1;
		   else if(line[0].equals("2"))
			   return s2;
		   else  return null;
	}
	
	public void Annoucements(String msg,int lineno) throws SQLException
	{
		 String query="insert into Maintanance values(curdate(),?,?,?)";
		 
		 Connection con=null;
		 GetConnection gc=new GetConnection();
		 con=gc.CreateConnection();
		 PreparedStatement st=con.prepareStatement(query);
		 st.setString(1, msg);
		 st.setInt(2, 1);
		 st.setInt(3, lineno);
		 st.executeUpdate();

	}
	
	public boolean checkStatus(int lineno) throws SQLException
	{
 String query="select *from Maintanance where lineno=? and status=1";
		 
		 Connection con=null;
		 GetConnection gc=new GetConnection();
		 con=gc.CreateConnection();
		 PreparedStatement st=con.prepareStatement(query);
		 st.setInt(1,lineno);
		 ResultSet rs=st.executeQuery();
		 if(rs.next())
			 return true;
		 
		 return false;
		
	}
	
	
	public boolean IsMaintanance() throws SQLException
	{
		
		 String query="select *from Maintanance where status=1";
		 
		 Connection con=null;
		 GetConnection gc=new GetConnection();
		 con=gc.CreateConnection();
		 PreparedStatement st=con.prepareStatement(query);
		 
		 ResultSet rs=st.executeQuery();
		 if(rs.next())
			 return true;
		return false;
		
		
	}
//============================================================================================================================================	
	public int gerCardid(int usrid) throws SQLException 
	{
		
 String query="select cardid from user,Smart_card where user.usrid=? and user.usrid=Smart_card.usrid";
		 
		 Connection con=null;
		 GetConnection gc=new GetConnection();
		 con=gc.CreateConnection();
		 PreparedStatement st=con.prepareStatement(query);
		 st.setInt(1, usrid);
		 ResultSet rs=st.executeQuery();
		 if(rs.next())
			 return rs.getInt("cardid");
		 
		 return 0;
		
	}
	//=========================================================================================================================================
	
	public int getBalance(int usrid) throws SQLException 
	{
		
		 String query="select balance from user,Smart_card where user.usrid=? and user.usrid=Smart_card.usrid"; 
		 Connection con=null;
		 GetConnection gc=new GetConnection();
		 con=gc.CreateConnection();
		 PreparedStatement st=con.prepareStatement(query);
		 st.setInt(1, usrid);
		 ResultSet rs=st.executeQuery();
		 rs.next();
		 return rs.getInt("balance");
	}
	//================================================================================================
		//code to check if email and phone already exist
		
		public boolean isEmailAvail(String email) throws SQLException
		{
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			String query="select *from user where email=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		
		//============================================================================================
		
		public boolean isPhoneAvail(Long contact) throws SQLException
		{
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			String query="select *from user where contact=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setLong(1, contact);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public void deleteMsg(int num) throws SQLException
		{
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			String query="delete from Messages where msgId=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1,num);
			st.executeUpdate();
		
		}
		
		//================================================================================================================
		//change user type
		
		public void changeUserType(UserRegDao user) throws SQLException
		{
			
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			int type=0;
			String query="select  user_type from user where usrid=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1,user.getUsrid());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				if(rs.getInt("user_type")==1)
					type=2;
				else if(rs.getInt("user_type")==2)
					type=1;
				
				
			}
			System.out.println(type);
			String query1="update user set user_type=? where usrid=?";
		    st=con.prepareStatement(query1);
		    st.setInt(1, type);
		    st.setInt(2, user.getUsrid());
		    st.executeUpdate();

			
			
		}
		
		
		public int getUserType(UserRegDao user) throws SQLException
		{
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			String query="select user_type from user where usrid=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1,user.getUsrid());
			ResultSet rs=st.executeQuery();
			if(rs.next())
				return rs.getInt("user_type");
			
			return 0;
		}
		
		public ResultSet getPieChartInfo() throws SQLException
		{
			
			
			Connection con=null;
			GetConnection gc=new GetConnection();
			con=gc.CreateConnection();
			String query="select name,revenue from Metro_Station,stats where Metro_Station.st_id=stats.st_id";
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			
			return rs;
			
		}
		
		
		

}



