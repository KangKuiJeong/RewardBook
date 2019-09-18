package board.faq.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import admin.model.vo.Admin;
import board.faq.model.vo.Faq;

public class FaqDao {

	public FaqDao() {}
	
	
	public int deleteFAQ(Connection conn, String faq_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from faq where faq_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, faq_no);		
		
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}		
		
		return result;
	}

	public ArrayList<Faq> listFAQ(Connection conn) {
		ArrayList<Faq> list = new ArrayList<Faq>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq " + 
				"order by to_number(faq_no) asc ";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Faq faq = new Faq();
				
				faq.setfaq_no(rset.getString("faq_no"));
				faq.setA_no(rset.getString("a_no"));
				faq.setfaq_title(rset.getString("faq_title"));
				faq.setFaq_text(rset.getString("faq_text"));
				faq.setfaq_date(rset.getDate("faq_date"));
				faq.setFaq_oc(rset.getString("faq_oc")); //공개여부
				list.add(faq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int updateFAQ(Connection conn, Faq faq) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query =  "UPDATE faq SET "
				+ "faq_title= ?, faq_text= ? "
				+ "WHERE faq_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, faq.getfaq_title());
			pstmt.setString(2, faq.getFaq_text());
			pstmt.setString(3, faq.getfaq_no());		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertFAQ(Connection conn, Faq faq) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into faq values ("
				+"TO_CHAR(SEQ_FAQ_NO.nextval) , ?, ?, ?, sysdate,  ?)";
		
		try {
			pstmt = conn.prepareStatement(query);


			pstmt.setString(1, faq.getA_no());
			pstmt.setString(2, faq.getfaq_title());
			pstmt.setString(3, faq.getFaq_text());
			pstmt.setString(4, "Y");
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Faq> searchFAQ1(Connection conn, String faq_search,String searchbt) {
		ArrayList<Faq> list = new ArrayList<Faq>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		try {
			
			
			if(faq_search.equals("tc")) {
				 query = "select * from faq " 
								+ "where faq_title like '%' || ? || '%' or faq_text like '%' || ? || '%' ";
				 pstmt = conn.prepareStatement(query);
				pstmt.setString(1, searchbt);
				pstmt.setString(2, searchbt);
					
			}else if(faq_search.equals("t")) {
				query = "select * from faq " 
						+ "where faq_title like '%' || ? || '%' ";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, searchbt);
				
			}else {
				 query = "select * from faq " 
						+ "where faq_text like '%' || ? || '%' ";
				 pstmt = conn.prepareStatement(query);
				 pstmt.setString(1, searchbt);
				 
			}
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				Faq faq = new Faq();
				
				faq.setfaq_no(rset.getString("faq_no"));
				faq.setA_no(rset.getString("a_no"));
				faq.setfaq_title(rset.getString("faq_title"));
				faq.setFaq_text(rset.getString("faq_text"));
				faq.setfaq_date(rset.getDate("faq_date"));
				faq.setFaq_oc(rset.getString("faq_oc")); //공개여부
				list.add(faq);
				
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
