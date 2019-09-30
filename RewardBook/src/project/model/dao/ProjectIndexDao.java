package project.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import project.model.vo.Project;

public class ProjectIndexDao {
	
	//인덱스용 최근등록된 프로젝트 DAO
	public ArrayList<Project> recentTop5(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select p_no, p_title, TO_NUMBER((SYSDATE - p_sdate) * (24 * 60 * 60)) as time, p_permission, p_img " + 
						"from (select * from project where p_permission = 'Y' order by p_sdate desc) " +
						"where rownum >=1 and rownum <= 5 " +
						"order by time asc";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setTime(rset.getInt("time"));
				project.setP_permission(rset.getString("p_permission"));
				project.setP_img(rset.getString("p_img"));
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
	
	//인덱스 프로젝트 마감임박 DAO
	public ArrayList<Project> endTop5(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select p_no, p_title, TO_NUMBER((p_edate - sysdate) * (24 * 60 * 60)) as time, p_permission, p_img " + 
						"from (select * from project WHERE SYSDATE < P_EDATE and p_permission = 'Y' "
						+ "order by p_edate asc ) " + 
						"where rownum >=1 and rownum <= 5 " + 
						" order by time asc";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setTime(rset.getInt("time"));
				project.setP_permission(rset.getString("p_permission"));
				project.setP_img(rset.getString("p_img"));
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
	
	//인덱스 조회수 top5 DAO
	public ArrayList<Project> hitTop5(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
						"from (select * from project order by p_count desc) " + 
						"where rownum >= 1 and rownum <=5 and p_permission = 'Y'";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				
				project.setP_title(rset.getString("p_title"));
				project.setP_category(rset.getString("p_category"));
				project.setP_nprice(rset.getInt("p_nprice"));
				project.setP_tprice(rset.getInt("p_tprice"));
				project.setP_count(rset.getInt("p_count"));
				project.setP_no(rset.getString("p_no"));
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

	//인덱스 라이크 top5 DAO
	public ArrayList<Project> likeTop5(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
				"from(select p.p_title, p.p_no, count(*) as 좋아요수,  p.P_NPRICE, p.P_tPRICE, p.p_category, p.p_permission " + 
						"from project p " + 
						"join project_like pl on p.p_no = pl.p_no " + 
						"group by p.p_title, p.p_no, p.P_NPRICE, p.P_TPRICE, p.p_category, p_permission " + 
						"having p_permission = 'Y' " + 
						"order by 3 desc, 2 asc) " + 
						"where rownum >= 1 and rownum <=5";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setP_category(rset.getString("p_category"));
				project.setP_nprice(rset.getInt("p_nprice"));
				project.setP_tprice(rset.getInt("p_tprice"));
				project.setP_count(rset.getInt("좋아요수"));
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
	
	//인덱스 it new top3 DAO
	public ArrayList<Project> itTop3(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
						"from(select * " + 
						"from(select * " + 
						"from project " + 
						"where p_category = 'tech' and p_permission = 'Y') " + 
						"order by to_number(p_no) desc) " + 
						"where rownum >=1 and rownum <= 3";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setP_category(rset.getString("p_category"));
				project.setP_nprice(rset.getInt("p_nprice"));
				project.setP_tprice(rset.getInt("p_tprice"));
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
	
	//인덱스 beauty top3 DAO
	public ArrayList<Project> BeautyTop3(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
						"from(select * " + 
						"from(select * " + 
						"from project " + 
						"where p_category = 'beauty' and p_permission = 'Y') " + 
						"order by to_number(p_no) desc) " + 
						"where rownum >=1 and rownum <= 3";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setP_category(rset.getString("p_category"));
				project.setP_nprice(rset.getInt("p_nprice"));
				project.setP_tprice(rset.getInt("p_tprice"));
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
	
	//인덱스 fashion top3 DAO
	public ArrayList<Project> FashionTop3(Connection conn) {
		
		ArrayList<Project> list = new ArrayList<Project>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
						"from(select * " + 
						"from(select * " + 
						"from project " + 
						"where p_category = 'fashion' and p_permission = 'Y') " + 
						"order by to_number(p_no) desc) " + 
						"where rownum >=1 and rownum <= 3";
		

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Project project = new Project();
				project.setP_no(rset.getString("p_no"));
				project.setP_title(rset.getString("p_title"));
				project.setP_category(rset.getString("p_category"));
				project.setP_nprice(rset.getInt("p_nprice"));
				project.setP_tprice(rset.getInt("p_tprice"));
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

}
