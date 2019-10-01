package board.notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import board.notice.model.vo.Notice;

public class NoticeDao {

	public int deleteNotice(Connection conn, String nt_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from notice where nt_no = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nt_no);		
		
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}		
		
		return result;
	
	}

	public int insertNotice(Connection conn, Notice notice,String nt_img, String nt_ntevent) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into notice values ("
				+"TO_CHAR(SEQ_NT_NO.nextval), "
				+ "?, ?, ?, sysdate, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNt_title());
			pstmt.setString(2, notice.getNt_text());
			pstmt.setString(3, nt_img);
			pstmt.setString(4, "Y");
			pstmt.setString(5, nt_ntevent);
			pstmt.setString(6, notice.getA_no());
		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateNotice(Connection conn, Notice notice, String nt_ntevent) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update notice set nt_title = ?, "
				+ "nt_text = ?, nt_date = sysdate, "
				+ "nt_img = ?, nt_oc = ?, nt_type = ? "
				+ "where nt_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, notice.getNt_title() );
			pstmt.setString(2, notice.getNt_text());
			pstmt.setString(3, notice.getNt_img());
			pstmt.setString(4, "Y");
			pstmt.setString(5, nt_ntevent);
			pstmt.setString(6, notice.getNt_no() );		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public Notice selectNotice(Connection conn, String nt_no) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where nt_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nt_no);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				notice = new Notice();
				
			notice.setNt_no(rset.getString("nt_no"));
			notice.setNt_title(rset.getString("nt_title"));
			notice.setNt_text(rset.getString("nt_text"));
			notice.setNt_img(rset.getString("nt_img"));
			notice.setNt_date(rset.getDate("nt_date"));
			notice.setNt_oc(rset.getString("nt_oc"));
			notice.setNt_type(rset.getString("nt_type"));
			notice.setA_no(rset.getString("a_no"));
			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return notice;
	}

	public ArrayList<Notice> listNotice(Connection conn, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from ( "
				+ "select rownum rnum, nt_no, nt_title, "
				+ "nt_text, nt_img, nt_date, nt_oc, nt_type, a_no from (select * from notice order by nt_date desc)) "
				+ "where rnum >= ? and rnum <= ?";

		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Notice notice = new Notice();
				
				notice.setNt_no(rset.getString("nt_no"));
				notice.setNt_title(rset.getString("nt_title"));
				notice.setNt_text(rset.getString("nt_text"));
				notice.setNt_img(rset.getString("nt_img"));
				notice.setNt_date(rset.getDate("nt_date"));
				notice.setNt_oc(rset.getString("nt_oc"));
				notice.setNt_type(rset.getString("nt_type"));
				notice.setA_no(rset.getString("a_no"));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Notice> SearchNT(Connection conn,String searchbt, String nt_search) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		try {
			
			if(nt_search.equals("tc")) {		
				 query = "select * from notice " 
								+ "where nt_title like '%' || ? || '%' or nt_text like '%' || ? || '%' ";
				 pstmt = conn.prepareStatement(query);
				pstmt.setString(1, searchbt);
				pstmt.setString(2, searchbt);
				
			}else if(nt_search.equals("t")) {
				query = "select * from notice " 
						+ "where nt_title like '%' || ? || '%' ";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, searchbt);
				
			}else {
				 query = "select * from notice " 
						+ "where nt_text like '%' || ? || '%' ";
				 pstmt = conn.prepareStatement(query);
				 pstmt.setString(1, searchbt);
				 
			}
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNt_no(rset.getString("nt_no"));
				notice.setNt_title(rset.getString("nt_title"));
				notice.setNt_text(rset.getString("nt_text"));
				notice.setNt_img(rset.getString("nt_img"));
				notice.setNt_date(rset.getDate("nt_date"));
				notice.setNt_oc(rset.getString("nt_oc"));
				notice.setNt_type(rset.getString("nt_type"));
				notice.setA_no(rset.getString("a_no"));
			
				list.add(notice);
			
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
