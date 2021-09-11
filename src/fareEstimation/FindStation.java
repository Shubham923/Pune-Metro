package fareEstimation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import querySet.GetConnection;

public class FindStation {

	public String [] GetFare(int st_id1,int st_id2) throws ClassNotFoundException, SQLException {
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
		System.out.println("Entet Source and Destination");
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
		
		
		
	//	======================================================================================================
		if(line1==line2)
		{
			String query3="select distinct(name) from Metro_Station,Route_track where  Metro_Station.st_id  between ? and ? and Metro_Station.st_id=Route_track.st_id or Metro_Station.st_id  between ? and ? and  Metro_Station.st_id=Route_track.st_id ";

			int  price=st_id1*100+st_id2;
			st=con.prepareStatement(query1);
			st.setInt(1, price);
			rs=st.executeQuery();
			if(rs.next())
			{
				System.out.println(rs.getInt("ticketPrice"));
			}
			
			while(rs.next())
			{
				stations[i]=rs.getString("name");
				i++;
			}
			
			st=con.prepareStatement(query3);
			if(st_id1<st_id2)
			{
				st.setInt(1, st_id1);
				st.setInt(2, st_id2);
				st.setInt(4, st_id1);
				st.setInt(3, st_id2);
				rs=st.executeQuery();
			
			
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}
			}
			
			else
			{
				st.setInt(1, st_id1);
				st.setInt(2, st_id2);
				
				st.setInt(4, st_id1);
				st.setInt(3, st_id2);
				rs=st.executeQuery();
				rs.last();
				
				while(rs.previous())
				{
					stations[i]=rs.getString("name");
					i++;
				}
				
			}
			
		}
		else
		{
			i=0;
			String q="select name from AllRoutes,Metro_Station where srno between   (select srno from AllRoutes where AllRoutes.st_id=? and routeNo=? ) and (select srno from AllRoutes where AllRoutes.st_id=? and routeNo=?) and Metro_Station.st_id=AllRoutes.st_id "; 
			
			if(st_id1>=11 && st_id1<=21 && st_id2>=33)		//1 st conditon  up
			{
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id1);
				st.setInt(2, 3);
				
				st.setInt(3,st_id2);
				st.setInt(4, 3);
				rs=st.executeQuery();
			
				
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}				
			}
			else if(st_id1<=24 && st_id1>=21 && st_id2>=33 )	//route 2  up
			{
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id2);
				st.setInt(2, 6);
				
				st.setInt(3,st_id1);
				st.setInt(4, 6);
				rs=st.executeQuery();
			
				rs.last();
				while(rs.previous())
				{
					stations[i]=rs.getString("name");
					i++;
				}					
					
					
			}
			
			else if(st_id2>=25 && st_id1<=21 && st_id2<=32)		//route 4  up
			{
				
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id1);
				st.setInt(2, 4);
				
				st.setInt(3,st_id2);
				st.setInt(4, 4);
				rs=st.executeQuery();
			
				
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}			
				
			
			}
			
			else if(st_id1>=25 && st_id1<=32 && st_id2<=24 && st_id2>=21)  //route 3 up
			{
				
			
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id1);
				st.setInt(2, 5);
				
				st.setInt(3,st_id2);
				st.setInt(4, 5);
				rs=st.executeQuery();
			
				
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}							
				
			}
			else if(st_id1<=24 && st_id1>=21 && st_id2>=25 && st_id2<=32) //route 3 down
			{
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id2);
				st.setInt(2, 5);
				
				st.setInt(3,st_id1);
				st.setInt(4, 5);
				rs=st.executeQuery();
				rs.last();
				
				while(rs.previous())
				{
					stations[i]=rs.getString("name");
					i++;
				}			
				
			
			}
			else if(st_id1<=39 && st_id1>=33 && st_id2<=21 && st_id2>=11 ) //route 1 down
			{
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id2);
				st.setInt(2, 3);
				
				st.setInt(3,st_id1);
				st.setInt(4, 3);
				rs=st.executeQuery();
			
				
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}				
				
			}
			
			else if(st_id1>=25 && st_id1<=32 && st_id2>=11 && st_id2<=21) //route 4 down
			{
				
				System.out.println("somehow");
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id2);
				st.setInt(2, 4);
				
				st.setInt(3,st_id1);
				st.setInt(4, 4);
				rs=st.executeQuery();
			
				rs.last();
				while(rs.previous())
				{
					stations[i]=rs.getString("name");
					i++;
				}				
				
			}
			else if(st_id2<=24 && st_id2>=21 && st_id1>=33 )	//route 2  down
			{
				st.close();
				rs.close();
				st=con.prepareStatement(q);
				
				st.setInt(1,st_id1);
				st.setInt(2, 6);
				
				st.setInt(3,st_id2);
				st.setInt(4, 6);
				rs=st.executeQuery();
			
				
				while(rs.next())
				{
					stations[i]=rs.getString("name");
					i++;
				}					
					
					
			}
			
			
			
			
			
	
			

	}
		return stations;

}
}
