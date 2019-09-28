package project.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.model.vo.ProjectNews;

public class ProjectNewsDao {

	public int deleteProjectNews(Connection conn, String pn_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertProjectNews(Connection conn, ProjectNews pn) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into project_news values ("
				+"TO_CHAR(SEQ_PN_NO.nextval) , ?, ?, ?, sysdate,  default)";
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, pn.getP_no());
			pstmt.setString(2, pn.getPn_title());
			pstmt.setString(3, pn.getPn_text());
	
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		return result;
	}

	public ProjectNews selectProjectNews(String pn_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<ProjectNews> listProjectNews(Connection conn, String p_no) {
		ArrayList<ProjectNews> list = new ArrayList<ProjectNews>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from  project_news pn " + 
				"join project p on p.p_no = pn.p_no " + 
				"where p.p_no = ? order by pn.pn_date desc ";

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProjectNews pn= new ProjectNews();
				
				pn.setPn_no(rset.getString("pn_no"));
				pn.setPn_title(rset.getString("pn_title"));
				pn.setPn_text(rset.getString("pn_text"));
				pn.setPn_date(rset.getString("pn_date"));
				pn.setP_no(rset.getString("p_no"));

				
				list.add(pn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateProjectNews(Connection conn, String pn_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
