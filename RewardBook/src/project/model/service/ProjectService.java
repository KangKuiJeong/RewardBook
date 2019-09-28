package project.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import project.model.dao.ProjectDao;
import project.model.vo.Project;

public class ProjectService {
	ProjectDao pDao = new ProjectDao();
	
	public int deleteProject(String p_no) {
		Connection conn = getConnection();
		int result = pDao.deleteProject(conn, p_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Project selectProject(String p_no) {
		Connection conn = getConnection();
		Project project = pDao.selectProject(conn, p_no);
		close(conn);
		
		return project;
	}

	public int insertProject(Project project) {
		Connection conn = getConnection();
		int result = pDao.insertProject(conn, project);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Project> listProject() {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.listProject(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Project> listPermission(String permission) {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.listPermission(conn, permission);
		
		return list;
	}

	public int updateProject(Project project) {
		Connection conn = getConnection();
		int result = pDao.updateProject(conn, project);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int countProject() {
		Connection conn = getConnection();
		int result = pDao.countProject(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int personCount(String p_no) {
		Connection conn = getConnection();
		int result = pDao.personCount(conn, p_no);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Project> selectNewProject() {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.selectNewProject(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Project> pageSelect(int start, int limit, String check1, String check2, String check3, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.pageSelect(conn, start, limit, check1, check2, check3, select1, text1);
		close(conn);
		
		return list;
	}

	public int pageCount(String check1, String check2, String check3, String select1, String text1) {
		Connection conn = getConnection();
		int result = pDao.pageCount(conn, check1, check2, check3, select1, text1);
		close(conn);
		
		return result;
	}

	public Project detailProject(String p_no) {
		Connection conn = getConnection();
		Project project = pDao.detailProject(conn, p_no);
		close(conn);
		
		return project;
	}

	public ArrayList<Project> pageSelect_P(int start, int limit, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.pageSelect_P(conn, start, limit, select1, text1);
		close(conn);
		
		return list;
	}

	public int pageCount_P(String select1, String text1) {
		Connection conn = getConnection();
		int result = pDao.pageCount_P(conn, select1, text1);
		close(conn);
		
		return result;
	}

	public int permissionAccept(String no) {
		Connection conn = getConnection();
		int result = pDao.permissionAccept(conn, no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int permissionReturn(String no, String return_str) {
		Connection conn = getConnection();
		int result = pDao.permissionReturn(conn, no, return_str);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int getCurrentSequence() {
		Connection conn = getConnection();
		int result = pDao.getCurrentSequence(conn);
		close(conn);
		
		return result;
	}

	public void updateOC(String p_no) {
		Connection conn = getConnection();
		int result = pDao.updateOC(conn, p_no);
		if (result > 0) {
			commit(conn);
		} else {
			commit(conn);
		}
		close(conn);
	}

	public ArrayList<Project> listProject(String category) {
		Connection conn = getConnection();
		ArrayList<Project> list = pDao.listProject(conn, category);
		close(conn);
		
		return list;
	}
	
}
