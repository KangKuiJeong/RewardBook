package memo.model.dao;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import memo.model.vo.Memo;
import project.model.vo.Project;

public class MemoDao {

	public MemoDao() {}
	public ArrayList<Memo> listMEMO(Connection conn, String u_no) {
		ArrayList<Memo> list = new ArrayList<Memo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =
				" select m.p_no, m.m_no, m.u_no, m.m_text, "
				+ "m.M_DATE, p.p_category , p.p_story, " +
				"p.p_img, p.p_nprice, p.p_tprice, p.p_sdate, "
				+"p.p_edate, u.u_name, p.p_title, to_number(round(p.p_edate - p_sdate)) as r_date " +
				" from project p " + 
				" join memo m on p.p_no = m.p_no " + 
				" join users u on p.u_no = u.u_no " +
				" where m.u_no = ?";

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Memo memo = new Memo();
			
				memo.setP_no(rset.getString("p_no"));
				memo.setM_no(rset.getString("m_no"));
				memo.setU_no(rset.getString("u_no"));
				memo.setM_text(rset.getString("m_text"));
				memo.setM_date(rset.getDate("m_date"));
				memo.setP_category(rset.getString("p_category"));
				memo.setP_story(rset.getString("p_story"));
				memo.setP_img(rset.getString("p_img"));
				memo.setP_nprice(rset.getInt("p_nprice"));
				memo.setP_tprice(rset.getInt("p_tprice"));
				memo.setP_sdate(rset.getDate("p_sdate"));
				memo.setP_edate(rset.getDate("p_edate"));
				memo.setU_name(rset.getString("u_name"));
				memo.setP_title(rset.getString("p_title"));
				memo.setP_rdate(rset.getInt("r_date"));
				list.add(memo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} 
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

	public Memo selectMemo(Connection conn, String p_no, String u_no) {
		Memo memo = new Memo();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String query = "select * from memo where p_no = ? and u_no = ? ";

		try {
			
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, p_no);
			pstmt.setString(2, u_no);
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
	public int deleteMemo(Connection conn, String p_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from memo where p_no = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);		
		
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}		
		
		return result;
	}


	public int countMemo(Connection conn,String u_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " select count(p_no) from memo where u_no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, u_no);
			
			rset = pstmt.executeQuery();
	
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		
			close(rset);
			close(pstmt);
		}

	return 	result;

	}
	public ArrayList<Memo> listmMEMO(Connection conn, String p_no, String u_no) {
		ArrayList<Memo> list = new ArrayList<Memo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =
				" select * from memo where p_no = ? and u_no = ?";

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			pstmt.setString(2, u_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Memo memo = new Memo();
			
				memo.setP_no(rset.getString("p_no"));
				memo.setM_no(rset.getString("m_no"));
				memo.setU_no(rset.getString("u_no"));
				memo.setM_text(rset.getString("m_text"));
				memo.setM_date(rset.getDate("m_date"));
			
				list.add(memo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} 



}
