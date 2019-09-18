package admin.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import admin.model.vo.Admin;

public class AdminDao {

	// 로그인처리용 Dao
	public Admin loginCheck(Connection conn, String userId, String userPwd) {
		
		Admin admin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from admin "
				+ "where a_id = ? and a_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				admin = new Admin();
				
				admin.setaNo(rset.getString("A_NO"));
				admin.setaId(rset.getString("A_ID"));
				admin.setaName(rset.getString("A_NAME"));
				admin.setaPw(rset.getString("A_PW"));
				admin.setJoinDate(rset.getDate("A_JOIN_DATE"));
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		return admin;
	}

}
