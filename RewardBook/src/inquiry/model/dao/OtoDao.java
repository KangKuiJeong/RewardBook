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
		String query = "select * from oto o join users u on o.u_no_answer = u.u_no where o.u_no = ? order by oto_no desc";
		
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
		String query = "select * from oto o join users u on o.u_no = u.u_no where u_no_answer = ? order by oto_no desc";
		
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
	
	// 문의글 등록용 DAO
	public int insertOto(Connection conn, Oto oto) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into oto values ("
				+"TO_CHAR(SEQ_OTO_NO.nextval), ?, ?, ?, ?, sysdate, ?, NULL, NULL, NULL)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, oto.getU_no());
			pstmt.setString(2, oto.getU_no_answer());
			pstmt.setString(3, oto.getOto_qtitle());
			pstmt.setString(4, oto.getOto_qtext());
			pstmt.setString(5, oto.getOto_yn());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}
	
	//내가 문의한 글 상세보기 DAO
	public Oto detailView(Connection conn, String oto_no) {
		
		Oto oto = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from oto o join users u on o.u_no_answer = u.u_no where oto_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oto_no);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				oto = new Oto();
				
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
				
			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return oto;
		
	}
	
	//내게 문의한 글 상세보기 DAO
	public Oto detailReceiveView(Connection conn, String oto_no) {
		
		Oto oto = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from oto o join users u on o.u_no = u.u_no where oto_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oto_no);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				oto = new Oto();
				
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
				
			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return oto;
		
	}
	
}
