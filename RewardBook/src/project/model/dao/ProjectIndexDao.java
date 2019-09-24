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
		
		String query = "select p_no, p_title, TO_NUMBER((SYSDATE - p_sdate) * (24 * 60 * 60)) as time " + 
						"from (select * from project order by p_sdate desc) " +
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
		
		String query = "select p_no, p_title, TO_NUMBER((p_edate - sysdate) * (24 * 60 * 60)) as time " + 
						"from (select * from project WHERE SYSDATE < P_EDATE order by p_edate asc ) " + 
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
