package fareEstimation;
import java.sql.SQLException;

import querySet.QuerySet;

public class GetFare {

	public int GetTicketFare(int st_id1,int st_id2) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
	QuerySet qs=new QuerySet();
	 return qs.GetTicketFare(st_id1, st_id2);
	}

}
