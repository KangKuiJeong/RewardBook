package inquiry.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import inquiry.model.vo.Inquiry;

public class InquiryClientDao {

	public InquiryClientDao() {}

	//회원용 관리자 문의 글 보기 용 DAO
	public ArrayList<Inquiry> selectlist(Connection conn, String u_no) {
		
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from inquiry where u_no = ? order by to_number(iq_no) desc";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Inquiry inq = new Inquiry();
				
				inq.setIq_no(rset.getString("IQ_NO"));
				inq.setU_no(rset.getString("U_NO"));
				inq.setIq_title(rset.getString("IQ_TITLE"));
				inq.setIq_text(rset.getString("IQ_TEXT"));
				inq.setIq_category(rset.getString("IQ_CATEGORY"));
				inq.setIq_date(rset.getDate("IQ_DATE"));
				inq.setIq_oc(rset.getString("IQ_OC"));
				inq.setIq_reply(rset.getString("IQ_REPLY"));
				inq.setIq_rdate(rset.getDate("IQ_RDATE"));
				inq.setA_no(rset.getString("a_no"));
							
				list.add(inq);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//회원용 관리자 문의 글 등록용 DAO
	public int insertInquiry(Connection conn, Inquiry inq) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into inquiry values ("
				+"TO_CHAR(SEQ_IQ_NO.nextval), ?, ?, ?, null, default, null, sysdate, default, null, sysdate, null)";
		
		try {
			pstmt = conn.prepareStatement(query);


			pstmt.setString(1, inq.getU_no());
			pstmt.setString(2, inq.getIq_title());
			pstmt.setString(3, inq.getIq_text());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}
	
	
}
