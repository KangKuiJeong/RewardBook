package memo.model.dao;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import memo.model.vo.Memo;

public class MemoDao {

	public MemoDao() {}
	
	public int updateMemo(Connection conn, Memo memo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE memo SET "		
				+ "m_text= ? "
				+ "WHERE p_no= ? and u_no= ? ";
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, memo.getM_text());	
			pstmt.setString(2, memo.getP_no());
			pstmt.setString(3, memo.getU_no());
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}

	public int insertMemo(Connection conn, Memo memo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into memo values ("
				+"TO_CHAR(SEQ_MEMO_NO.nextval) , ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, memo.getP_no());
			pstmt.setString(2, memo.getU_no());
			pstmt.setString(3, memo.getM_text());
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}

	public Memo selectMemo(Connection conn, String p_no) {
		Memo memo = new Memo();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String query = "select * from memo where p_no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, p_no);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				memo.setM_no(rset.getString("m_no"));
				memo.setP_no(rset.getString("p_no"));
				memo.setU_no(rset.getString("u_no"));
				memo.setM_text(rset.getString("m_text"));
				memo.setM_date(rset.getDate("m_date"));

			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return memo;
	}











}
