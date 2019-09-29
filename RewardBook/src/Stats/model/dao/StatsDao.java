package Stats.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class StatsDao {

	public int insertVisit(Connection conn, String date) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "insert into visit values(?, 1)";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public void updateVisit(Connection conn, String date) {
		
		PreparedStatement pstmt = null;
		
		String query = "update visit set v_value = v_value + 1 where v_date = ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
	}
	
	public int checkVisit(Connection conn, String date) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select * from visit where v_date = ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return result;
		
	}

	public int getVisitCount(Connection conn, String date) {
		
		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;
		
		String query = "select nvl(sum(v_value), 0) total from visit where v_date like '" + date + "%'";
		
		try {
			
			stmt = conn.createStatement();
			rest = stmt.executeQuery(query);
			if(rest.next()) {
				result = rest.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(stmt);
		}
		
		return result;
		
	}

	public int getUserCount(Connection conn, String date) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select nvl(count(*), 0) total from users where u_join_date > TO_DATE(?,'YYYYMMDD')";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				result = rest.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return result;
		
	}
	
}
