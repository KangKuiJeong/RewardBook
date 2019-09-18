package project.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import project.model.dao.LikeProjectDao;
import project.model.vo.LikeProject;

public class LikeProjectService {
	
	private LikeProjectDao lpDao = new LikeProjectDao();
	
	public int deleteLikeProject(String m_no) {
		Connection conn = getConnection();
		int result = lpDao.deleteLikeProject(conn, m_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	public int InsertLikeProject(String m_no) {
		Connection conn = getConnection();
		int result = lpDao.insertLikeProject(conn, m_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<LikeProject> listLikeProject() {
		Connection conn = getConnection();
		ArrayList<LikeProject> list = lpDao.listLikeProject(conn);
		
		return list;
	}

}
