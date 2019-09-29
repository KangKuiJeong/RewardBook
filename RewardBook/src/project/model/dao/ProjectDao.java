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
		
		String query = "select to_number(round(p_edate - p_sdate)), p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return, u_name from project  join users using(u_no) where p_no = ? and p_permission = 'Y'";
		
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
				project.setU_name(rset.getString("U_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return project;
	}

	public int insertProject(Connection conn, Project project) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "insert into project values(TO_CHAR(SEQ_P_NO.nextval), ?, ?, ?, ?, ?, ?, default, ?, sysdate, ?, 'N', ?, default, 'N', null, null, default)";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, project.getU_no());
			pstmt.setString(2, project.getP_title());
			pstmt.setString(3, project.getP_category());
			pstmt.setString(4, project.getP_story());
			pstmt.setString(5, project.getP_img());
			pstmt.setString(6, project.getP_info());
			pstmt.setInt(7, project.getP_tprice());
			pstmt.setDate(8, project.getP_sdate());
			pstmt.setDate(9, project.getP_ddate());

			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Project> listProject(Connection conn) {
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select to_number(round(p_edate - p_sdate)), p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return, u_name from project join users using(u_no) where p_permission = 'Y'";
		
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
				project.setU_name(rset.getString("U_NAME"));
				
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
	
	public ArrayList<Project> listProject(Connection conn, String category) {
		ArrayList<Project> list = new ArrayList<Project>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select to_number(round(p_edate - p_sdate)), p_no, u_no, p_title, p_category, p_story, p_img, p_info, p_nprice, p_tprice, p_sdate, p_edate, p_secondary, p_ddate, p_count, p_permission, p_pdate, p_return, u_name from project join users using(u_no) where p_category = ? and p_permission = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
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
				project.setU_name(rset.getString("U_NAME"));
				
				list.add(project);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Project> listPermission(Connection conn, String permission) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateProject(Connection conn, Project project) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update project set p_title=?, p_category=?, p_tprice=?, p_edate=?, p_ddate=?, p_info=?";
		
		if (project.getP_story() != null)
			query += ", p_story=?";
		if (project.getP_img() != null)
			query += ", p_img=?";
		
		query += " where p_no=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, project.getP_title());
			pstmt.setString(2, project.getP_category());
			pstmt.setInt(3, project.getP_tprice());
			pstmt.setDate(4, project.getP_edate());
			pstmt.setDate(5, project.getP_ddate());
			pstmt.setString(6, project.getP_info());
			
			if (project.getP_story() != null && project.getP_img() != null) {
				pstmt.setString(7, project.getP_story());
				pstmt.setString(8, project.getP_img());
				pstmt.setString(9, project.getP_no());
			} else if (project.getP_story() != null) {
				pstmt.setString(7, project.getP_story());
				pstmt.setString(8, project.getP_no());
			} else if (project.getP_img() != null) {
				pstmt.setString(7, project.getP_img());
				pstmt.setString(8, project.getP_no());
			} else {
				pstmt.setString(7, project.getP_no());
			}
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
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
		
		String query = "SELECT p_no, p_title, u_name, p_sdate FROM PROJECT JOIN USERS USING (u_no) WHERE P_OC = 'N' ORDER BY p_no DESC";
		
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
				project.setP_img(rest.getString("p_img"));
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

	public int updateOC(Connection conn, String p_no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update project set p_oc = 'Y' where p_no = ?"; 
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Project> pageSelect_P(Connection conn, int start, int limit, String select1, String text1) {

		ArrayList<Project> list = new ArrayList<Project>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "where p_permission = 'N' and p_pdate is null and p_return is null";

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

	public int permissionAccept(Connection conn, String no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update project set p_permission='Y', p_pdate=sysdate, p_sdate=sysdate where p_no=?";
				
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int permissionReturn(Connection conn, String no, String return_str) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update project set p_permission='N', p_pdate=sysdate, p_return=? where p_no=?";
				
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, return_str);
			pstmt.setString(2, no);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getCurrentSequence(Connection conn) {
		
		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;
		
		String query = "SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_P_NO'";
		
		try {
			
			stmt = conn.createStatement();
			rest = stmt.executeQuery(query);
			
			if (rest.next()) {
				result = rest.getInt("LAST_NUMBER");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(stmt);
		}
		
		return result;
		
	}

	public ArrayList<Project> payList(Connection conn) {
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select p_no from project where p_edate < sysdate and p_nprice > p_tprice";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_no(rset.getString("P_NO"));
				
				list.add(project);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Project> searchKeyward(Connection conn, String keyward) {
		ArrayList<Project> list = new ArrayList<Project>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select p_title from project where p_title like ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  "%"+keyward+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_title(rset.getString("P_TITLE"));
				
				list.add(project);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int projectCount(Connection conn, String p_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update project set p_count = p_count + 1 where p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updatePayment(Connection conn, String p_no, int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update project set p_nprice = p_nprice + ? where p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, price);
			pstmt.setString(2, p_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
