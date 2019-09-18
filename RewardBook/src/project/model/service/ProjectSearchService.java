package project.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import project.model.dao.ProjectSearchDao;
import project.model.vo.Project;

public class ProjectSearchService {
	
	public ProjectSearchService() {}
	
	ProjectSearchDao psdao = new ProjectSearchDao();
	
	//프로젝트 검색용 Service
		public ArrayList<Project> searchProject(String searchText) {
			
			Connection conn = getConnection();
			ArrayList<Project> result = psdao.searchProject(conn, searchText);
			
			return result;
		}

		public int countProject() {
			
			Connection conn = getConnection();
			int result = psdao.countProject(conn);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
			
		}
}
