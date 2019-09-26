package project.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import project.model.vo.Project;

public class ProjectSearchDao {

	public ProjectSearchDao() {}
	
	//프로젝트 검색용 DAO
		public ArrayList<Project> searchProject(Connection conn, String searchText) {
			
			ArrayList<Project> project = new ArrayList<Project>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from project where p_title like '%' || ? || '%' and p_permission = 'Y' ";
			
			try {
				
				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, searchText);		
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Project pro = new Project();
					
					pro.setP_no(rset.getString("p_no"));
					pro.setU_no(rset.getString("u_no"));
					pro.setP_title(rset.getString("p_title"));
					pro.setP_category(rset.getString("p_category"));
					pro.setP_story(rset.getString("p_story"));
					pro.setP_info(rset.getString("p_info"));
					pro.setP_nprice(rset.getInt("p_nprice"));
					pro.setP_tprice(rset.getInt("p_tprice"));
					pro.setP_sdate(rset.getDate("p_sdate"));
					pro.setP_edate(rset.getDate("p_edate"));
					pro.setP_secondary(rset.getString("p_secondary"));
					pro.setP_ddate(rset.getDate("p_ddate"));
					pro.setP_count(rset.getInt("p_count"));
					pro.setP_permission(rset.getString("p_permission"));
					pro.setP_pdate(rset.getDate("p_pdate"));
					pro.setP_return(rset.getString("p_return"));

					project.add(pro);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
				close(rset);
				close(pstmt);
			}
			
			return project;
			
		}

		public int countProject(Connection conn) {
			
			int result = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from project";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					result = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			
			return result;
			
		}
}
