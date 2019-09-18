package project.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import project.model.dao.ProjectNewsDao;
import project.model.vo.ProjectNews;

public class ProjectNewsService {
	private ProjectNewsDao pnDao = new ProjectNewsDao();
	
	public int deleteProjectNews(String pn_no) {
		Connection conn = getConnection();
		int result = pnDao.deleteProjectNews(conn, pn_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertProjectNews(String pn_no) {
		Connection conn = getConnection();
		int result = pnDao.insertProjectNews(conn, pn_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ProjectNews detailProjectNews(String pn_no) {
		Connection conn = getConnection();
		ProjectNews projectNews = pnDao.selectProjectNews(pn_no);
		
		return projectNews;
	}

	public ArrayList<ProjectNews> listProjectNews() {
		Connection conn = getConnection();
		ArrayList<ProjectNews> list = pnDao.listProjectNews(conn);
		
		return list;
	}

	public int updateProjectNews(String pn_no) {
		Connection conn = getConnection();
		int result = pnDao.updateProjectNews(conn, pn_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
