package inquiry.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import inquiry.model.vo.Oto;

public class OtoDao {

	public OtoDao() {}
	
	//내가 문의한 글 보기 DAO
	public ArrayList<Oto> selectSendlist(Connection conn, String u_no) {
		
		ArrayList<Oto> list = new ArrayList<Oto>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from oto o join users u on o.u_no_answer = u.u_no where o.u_no = ? order by rownum desc";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Oto oto = new Oto();
				
				oto.setOto_no(rset.getString("oto_no"));
				oto.setU_no(rset.getString("u_no"));
				oto.setU_no_answer(rset.getString("u_no_answer"));
				oto.setOto_qtitle(rset.getString("oto_qtitle"));
				oto.setOto_qtext(rset.getString("oto_qtext"));
				oto.setOto_qdate(rset.getDate("oto_qdate"));
				oto.setOto_yn(rset.getString("oto_yn"));
				oto.setOto_atext(rset.getString("oto_atext"));
				oto.setOto_atitle(rset.getString("oto_atitle"));
				oto.setOto_adate(rset.getDate("oto_adate"));
				oto.setOto_makerName(rset.getString("u_name"));
				
				list.add(oto);
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	//내게 문의한 글 보기 DAO
	public ArrayList<Oto> selectReceiveSendList(Connection conn, String u_no) {
		
ArrayList<Oto> list = new ArrayList<Oto>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from oto o join users u on o.u_no = u.u_no where u_no_answer = ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Oto oto = new Oto();
				
				oto.setOto_no(rset.getString("oto_no"));
				oto.setU_no(rset.getString("u_no"));
				oto.setU_no_answer(rset.getString("u_no_answer"));
				oto.setOto_qtitle(rset.getString("oto_qtitle"));
				oto.setOto_qtext(rset.getString("oto_qtext"));
				oto.setOto_qdate(rset.getDate("oto_qdate"));
				oto.setOto_yn(rset.getString("oto_yn"));
				oto.setOto_atext(rset.getString("oto_atext"));
				oto.setOto_atitle(rset.getString("oto_atitle"));
				oto.setOto_adate(rset.getDate("oto_adate"));
				oto.setOto_makerName(rset.getString("u_name"));
				
				list.add(oto);
				
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
