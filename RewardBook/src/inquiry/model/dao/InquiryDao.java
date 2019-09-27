package inquiry.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sound.midi.Synthesizer;

import inquiry.model.vo.Inquiry;

public class InquiryDao {
	
	public int deleteInquiry(Connection conn, String inq_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertInquiry(Connection conn, String inq_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateInquiry(Connection conn, String inq_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Inquiry> listInquiry(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Inquiry> selectNewInquiry(Connection conn) {
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT iq_no, iq_title, u_name, iq_date FROM Inquiry JOIN USERS USING (u_no) WHERE iq_category = 'INQUIRY' AND iq_oc='N' ORDER BY iq_no DESC";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Inquiry inquiry = new Inquiry();
				
				inquiry.setIq_no(rset.getString("iq_no"));
				inquiry.setIq_title(rset.getString("iq_title"));
				inquiry.setU_name(rset.getString("u_name"));
				inquiry.setIq_date(rset.getDate("iq_date"));
				
				list.add(inquiry);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public ArrayList<Inquiry> pageSelect(Connection conn, int start, int limit, String check1, String check2, String check3, String check4, String select1, String text1) {

		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "where iq_category = 'INQUIRY'";

		if (check1.equals("true") || check2.equals("true")) {
			check += " and (a_no is ";
			if (check1.equals("true")) {
				check += "not null";
				if (check2.equals("true")) {
					check += " or a_no is null";
				}
			} else {
				check += "null";
			}
			check += ")";
		}
		
		if (check3.equals("true") || check4.equals("true")) {
			check += " and (iq_oc = ";
			if (check3.equals("true")) {
				check += "'Y'";
				if (check4.equals("true")) {
					check += " or iq_oc = 'N'";
				}
			} else {
				check += "'N'";
			}
			check += ")";
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "iq_no "; break;
				case "등록인": check += "u_name "; break;
				case "제목": check += "iq_title "; break;
				case "답변인": check += "a_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select * from (select rownum rnum, iq_no, u_name, iq_title, iq_date, iq_oc, a_name, iq_rdate from Inquiry join users using(u_no) left outer join admin using(a_no) " + check + " order by iq_date) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, (start - 1) * limit + 1);
			pstmt.setInt(2, start * limit);
			
			rest = pstmt.executeQuery();
			
			while (rest.next()) {
				
				Inquiry inquiry = new Inquiry();
				
				inquiry.setIq_no(rest.getString("iq_no"));
				inquiry.setU_name(rest.getString("u_name"));
				inquiry.setIq_title(rest.getString("iq_title"));
				inquiry.setIq_date(rest.getDate("iq_date"));
				inquiry.setIq_oc(rest.getString("iq_oc"));
				inquiry.setA_name(rest.getString("a_name"));
				inquiry.setIq_rdate(rest.getDate("iq_rdate"));
				
				list.add(inquiry);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
		
	}

	public int pageCount(Connection conn, String check1, String check2, String check3, String check4, String select1, String text1) {

		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;

		String check = "where iq_category = 'INQUIRY'";

		if (check1.equals("true") || check2.equals("true")) {
			check += " and (a_no is ";
			if (check1.equals("true")) {
				check += "not null";
				if (check2.equals("true")) {
					check += " or a_no is null";
				}
			} else {
				check += "null";
			}
			check += ")";
		}
		
		if (check3.equals("true") || check4.equals("true")) {
			check += " and (iq_oc = ";
			if (check3.equals("true")) {
				check += "'Y'";
				if (check4.equals("true")) {
					check += " or iq_oc = 'N'";
				}
			} else {
				check += "'N'";
			}
			check += ")";
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "iq_no "; break;
				case "등록인": check += "u_name "; break;
				case "제목": check += "iq_title "; break;
				case "답변인": check += "a_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select count(*) counts from (select rownum rnum, iq_no, u_name, iq_title, iq_date, iq_oc, a_name, iq_rdate from Inquiry join users using(u_no) left outer join admin using(a_no) " + check + " order by iq_date)";
		
		try {

			stmt = conn.createStatement();
			
			rest = stmt.executeQuery(query);
			
			if (rest.next()) {
				result = rest.getInt("counts");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(stmt);
		}
		
		return result;
		
	}

	public ArrayList<Inquiry> pageSelect_D(Connection conn, int start, int limit, String check1, String check2, String check3, String check4, String select1, String text1) {

		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;

		String check = "where iq_category = 'DECLARE'";

		if (check1.equals("true") || check2.equals("true")) {
			check += " and (a_no is ";
			if (check1.equals("true")) {
				check += "not null";
				if (check2.equals("true")) {
					check += " or a_no is null";
				}
			} else {
				check += "null";
			}
			check += ")";
		}
		
		if (check3.equals("true") || check4.equals("true")) {
			check += " and (iq_oc = ";
			if (check3.equals("true")) {
				check += "'Y'";
				if (check4.equals("true")) {
					check += " or iq_oc = 'N'";
				}
			} else {
				check += "'N'";
			}
			check += ")";
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "iq_no "; break;
				case "등록인": check += "u_name "; break;
				case "제목": check += "iq_title "; break;
				case "답변인": check += "a_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select * from (select rownum rnum, iq_no, u_name, iq_title, iq_date, iq_oc, a_name, iq_rdate from inquiry join users using(u_no) left outer join admin using(a_no) " + check + " order by iq_date) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, (start - 1) * limit + 1);
			pstmt.setInt(2, start * limit);
			
			rest = pstmt.executeQuery();
			
			while (rest.next()) {
				
				Inquiry inquiry = new Inquiry();
				
				inquiry.setIq_no(rest.getString("iq_no"));
				inquiry.setU_name(rest.getString("u_name"));
				inquiry.setIq_title(rest.getString("iq_title"));
				inquiry.setIq_date(rest.getDate("iq_date"));
				inquiry.setIq_oc(rest.getString("iq_oc"));
				inquiry.setA_name(rest.getString("a_name"));
				inquiry.setIq_rdate(rest.getDate("iq_rdate"));
				
				list.add(inquiry);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
		
	}

	public int pageCount_D(Connection conn, String check1, String check2, String check3, String check4, String select1, String text1) {

		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;

		String check = "where iq_category = 'DECLARE'";

		if (check1.equals("true") || check2.equals("true")) {
			check += " and (a_no is ";
			if (check1.equals("true")) {
				check += "not null";
				if (check2.equals("true")) {
					check += " or a_no is null";
				}
			} else {
				check += "null";
			}
			check += ")";
		}
		
		if (check3.equals("true") || check4.equals("true")) {
			check += " and (iq_oc = ";
			if (check3.equals("true")) {
				check += "'Y'";
				if (check4.equals("true")) {
					check += " or iq_oc = 'N'";
				}
			} else {
				check += "'N'";
			}
			check += ")";
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "iq_no "; break;
				case "등록인": check += "u_name "; break;
				case "제목": check += "iq_title "; break;
				case "답변인": check += "a_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select count(*) counts from (select rownum rnum, iq_no, u_name, iq_title, iq_date, iq_oc, a_name, iq_rdate from Inquiry join users using(u_no) left outer join admin using(a_no) " + check + " order by iq_date)";
		
		try {

			stmt = conn.createStatement();
			
			rest = stmt.executeQuery(query);
			
			if (rest.next()) {
				result = rest.getInt("counts");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(stmt);
		}
		
		return result;
		
	}

	public Inquiry detailInquiry(Connection conn, String iq_no) {
		
		Inquiry inquiry = null;
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select iq_no, u_name, iq_title, iq_text, iq_dcategory, iq_date, iq_reply, iq_rdate, a_name from inquiry join users using(u_no) left outer join admin using(a_no) where iq_no=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, iq_no);
			
			rest = pstmt.executeQuery();
			
			if (rest.next()) {
				
				inquiry = new Inquiry();
				
				inquiry.setIq_no(rest.getString("iq_no"));
				inquiry.setU_name(rest.getString("u_name"));
				inquiry.setIq_title(rest.getString("iq_title"));
				inquiry.setIq_text(rest.getString("iq_text"));
				inquiry.setIq_dcategory(rest.getString("iq_dcategory"));
				inquiry.setIq_date(rest.getDate("iq_date"));
				inquiry.setIq_reply(rest.getString("iq_reply"));
				inquiry.setIq_rdate(rest.getDate("iq_rdate"));
				inquiry.setA_name(rest.getString("a_name"));
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return inquiry;
		
	}

	public int replyInquiry_A(Connection conn, String no, String ano, String reply) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update inquiry set iq_reply=?, a_no=?, iq_rdate=sysdate where iq_no=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, reply);
			pstmt.setString(2, ano);
			pstmt.setString(3, no);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateOC(Connection conn, String no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update inquiry set iq_oc='Y' where iq_no=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
