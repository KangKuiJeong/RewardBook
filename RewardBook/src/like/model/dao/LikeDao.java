package like.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.model.vo.Project;

public class LikeDao {

	
	//프로젝트 좋아요 목록 조회
	public ArrayList<Project> myprojectList(Connection conn, String uNo) {
		ArrayList<Project> list = new ArrayList<Project>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = "select to_number(round(p_edate - p_sdate)),u_name, p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return from project join users using(u_no) where p_no in (select p_no from project_like where u_no = ?)";
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, uNo);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Project project = new Project();
	            
	            project.setU_name(rset.getString("U_NAME"));
	            project.setP_no(rset.getString("P_NO"));
	            project.setU_no(rset.getString("U_NO"));
	            project.setP_title(rset.getString("P_TITLE"));
	            project.setP_category(rset.getString("P_CATEGORY"));
	            project.setP_story(rset.getString("P_STORY"));
	            project.setP_img(rset.getString("P_IMG"));
	            project.setP_info(rset.getString("P_INFO"));
	            project.setP_nprice(rset.getInt("P_NPRICE"));
	            project.setP_tprice(rset.getInt("P_TPRICE"));
	            project.setP_sdate(rset.getDate("P_SDATE"));
	            project.setP_edate(rset.getDate("P_EDATE"));
	            project.setP_secondary(rset.getString("P_SECONDARY"));
	            project.setP_ddate(rset.getDate("P_DDATE"));
	            project.setP_count(rset.getInt("P_COUNT"));
	            project.setP_permission(rset.getString("P_PERMISSION"));
	            project.setP_pdate(rset.getDate("P_PDATE"));
	            project.setP_return(rset.getString("P_RETURN"));
	            project.setP_rdate(rset.getInt(1));
	            
	            list.add(project);
	            
	         }
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return list;
	   }

}
