package project.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import project.model.vo.Project;

public class ProjectDao {
	
	public ArrayList<Project> selectList(Connection conn){
		ArrayList<Project> list = new ArrayList<Project>();
		
		
		return list;
	}

	public int deleteProject(Connection conn, String p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Project selectProject(Connection conn, String p_no) {
		Project project = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		

		String query = "select to_number(round(p_sdate - p_edate)), p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return from project where p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				project = new Project();
				
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
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return project;
	}

	public int insertProject(Connection conn, String p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Project> listProject(Connection conn) {
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select to_number(round(p_edate - p_sdate)), p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return from project";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList<Project> listPermission(Connection conn, String permission) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateProject(Connection conn, String p_no) {
		// TODO Auto-generated method stub
		return 0;
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

	public int personCount(Connection conn, String p_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from payment where p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	

	public ArrayList<Project> selectNewProject(Connection conn) {
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT p_no, p_title, u_name, p_sdate FROM PROJECT JOIN USERS USING (u_no) WHERE P_PERMISSION = 'N' ORDER BY p_no DESC";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setU_name(rset.getString("u_name"));
				project.setP_sdate(rset.getDate("p_sdate"));
				
				list.add(project);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Project> pageSelect(Connection conn, int start, int limit, String check1, String check2, String check3, String select1, String text1) {

		ArrayList<Project> list = new ArrayList<Project>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "";

		if (check1.equals("true")) {
			check += "where p_permission = 'N'";
		}
		if (check2.equals("true") || check3.equals("true")) {
			if (check.length() > 0)
				check += " and ";
			check += "where p_secondary = ";
			if (check2.equals("true")) {
				check += "'N'";
				if (check3.equals("true")) {
					check += "or p_secondary = 'Y'";
				}
			} else {
				check += "'Y'";
			}
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "p_no "; break;
				case "카테고리": check += "p_category "; break;
				case "제목": check += "p_title "; break;
				case "메이커": check += "u_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select * from (select rownum rnum, p_no, u_name, p_title, p_sdate, p_secondary, p_count, p_permission, p_category from project join users using(u_no) " + check + " order by p_sdate) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, (start - 1) * limit + 1);
			pstmt.setInt(2, start * limit);
			
			rest = pstmt.executeQuery();
			
			while (rest.next()) {
				
				Project project = new Project();
				
				project.setP_no(rest.getString("p_no"));
				project.setU_name(rest.getString("u_name"));
				project.setP_title(rest.getString("p_title"));
				project.setP_sdate(rest.getDate("p_sdate"));
				project.setP_secondary(rest.getString("p_secondary"));
				project.setP_count(rest.getInt("p_count"));
				project.setP_permission(rest.getString("p_permission"));
				project.setP_category(rest.getString("p_category"));
				
				list.add(project);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
	}

	public int pageCount(Connection conn, String check1, String check2, String check3, String select1, String text1) {

		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;

		String check = "";

		if (check1.equals("true")) {
			check += "where p_permission = 'N'";
		}
		if (check2.equals("true") || check3.equals("true")) {
			if (check.length() > 0)
				check += " and ";
			check += "where p_secondary = ";
			if (check2.equals("true")) {
				check += "'N'";
				if (check3.equals("true")) {
					check += "or p_secondary = 'Y'";
				}
			} else {
				check += "'Y'";
			}
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "번호": check += "p_no "; break;
				case "카테고리": check += "p_category "; break;
				case "제목": check += "p_title "; break;
				case "메이커": check += "u_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select count(*) counts from (select * from (select rownum rnum, p_no, u_name, p_title, p_sdate, p_secondary, p_count, p_permission, p_category from project join users using(u_no) " + check + " order by p_sdate))";
		
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

	public Project detailProject(Connection conn, String p_no) {
		
		Project project = null;
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select * from project join users using(u_no) where p_no = ?"; 
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			rest = pstmt.executeQuery();
			
			if (rest.next()) {
				
				project = new Project();
				
				project.setP_no(rest.getString("p_no"));
				project.setU_name(rest.getString("u_name"));
				project.setP_title(rest.getString("p_title"));
				project.setP_category(rest.getString("p_category"));
				project.setP_story(rest.getString("p_story"));
				project.setP_info(rest.getString("p_info"));
				project.setP_nprice(rest.getInt("p_nprice"));
				project.setP_tprice(rest.getInt("p_tprice"));
				project.setP_sdate(rest.getDate("p_sdate"));
				project.setP_edate(rest.getDate("p_edate"));
				project.setP_secondary(rest.getString("p_secondary"));
				project.setP_ddate(rest.getDate("p_ddate"));
				project.setP_count(rest.getInt("p_count"));
				project.setP_permission(rest.getString("p_permission"));
				project.setP_pdate(rest.getDate("p_pdate"));
				project.setP_return(rest.getString("p_return"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return project;
	}

	public ArrayList<Project> pageSelect_P(Connection conn, int start, int limit, String select1, String text1) {

		ArrayList<Project> list = new ArrayList<Project>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "where p_permission = 'N'";

		if (text1 != "") {
			
			check += " and ";
			
			switch(select1) {
				case "번호": check += "p_no "; break;
				case "카테고리": check += "p_category "; break;
				case "제목": check += "p_title "; break;
				case "메이커": check += "u_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select * from (select rownum rnum, p_no, u_name, p_title, p_sdate, p_tprice, p_category from project join users using(u_no) " + check + " order by p_sdate) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, (start - 1) * limit + 1);
			pstmt.setInt(2, start * limit);
			
			rest = pstmt.executeQuery();
			
			while (rest.next()) {
				
				Project project = new Project();
				
				project.setP_no(rest.getString("p_no"));
				project.setU_name(rest.getString("u_name"));
				project.setP_title(rest.getString("p_title"));
				project.setP_sdate(rest.getDate("p_sdate"));
				project.setP_tprice(rest.getInt("p_tprice"));
				project.setP_category(rest.getString("p_category"));
				
				list.add(project);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
		
	}

	public int pageCount_P(Connection conn, String select1, String text1) {

		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;

		String check = "where p_permission = 'N'";

		if (text1 != "") {
			
			check += " and ";
			
			switch(select1) {
				case "번호": check += "p_no "; break;
				case "카테고리": check += "p_category "; break;
				case "제목": check += "p_title "; break;
				case "메이커": check += "u_name "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select count(*) counts from (select * from (select rownum rnum, p_no, u_name, p_title, p_sdate, p_tprice, p_category from project join users using(u_no) " + check + " order by p_sdate))";
		
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
	
	
}
