package inquiry.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import inquiry.model.vo.Inquiry;
import project.model.vo.Project;

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

	public ArrayList<Inquiry> pageSelect(Connection conn, int start, int limit, String check1, String check2, String select1, String text1) {

		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "";

		if (check1.equals("true") || check2.equals("true")) {
			check += "where iq_oc == ";
			if (check1.equals("true")) {
				check += "'Y'";
				if (check2.equals("true")) {
					check += "or iq_oc == 'N'";
				}
			} else {
				check += "'N'";
			}
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
		
		String query = "select * from (select rownum rnum, iq_no, u_name, iq_title, iq_date, iq_oc, a_name, iq_rdate from Inquiry join users using(u_no) join admin using(a_no) " + check + " order by iq_date) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, start + limit - 1);
			
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
				
				System.out.println(inquiry);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
		
	}

	public int pageCount(Connection conn, String check1, String check2, String select1, String text1) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
