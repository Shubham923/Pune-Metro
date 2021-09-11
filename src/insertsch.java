import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class insertsch
{
	public static void main(String arg[]) throws ClassNotFoundException, SQLException
	{
		int time=50000,cnt=0;
		int dir=1;
		String query="insert into station1(sch_time,dir) values(?,?)";
		String url="jdbc:mysql://localhost:3306/Metro";
		String username="root";
		String pass="root";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url, username, pass);
		PreparedStatement st=con.prepareStatement(query);
		for(int i=0;i<12;i++)
			{
			for(int j=0;j<9;j++)
			{
				
				st.setInt(1,time);
				st.setInt(2,dir);
				st.executeUpdate();
				cnt=cnt+1;
				if(cnt%6==0)
				{
				time=time+5000;
				}
				else
				{
					time=time+1000;
				}
				if(cnt<9)
				{
					dir=1;
				}
				else if(cnt>=9 && cnt<99)
				{
					dir=1;
				}
				else
				{
					dir=0;
				}
			}
			
		}
		
		

	}
}