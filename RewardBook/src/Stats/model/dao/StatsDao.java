package Stats.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import member.model.vo.Member;

public class StatsDao {

	public int insertVisit(Connection conn, java.sql.Date date, int count) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateVisit(Connection conn, int count) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int joinCount(Connection conn, int count) {
		int result=0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from users ";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {		
				result = rset.getInt("count");

				
			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
		
		
	}
}
