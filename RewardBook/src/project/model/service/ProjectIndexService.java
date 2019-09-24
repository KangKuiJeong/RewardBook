package project.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import project.model.dao.ProjectIndexDao;
import project.model.vo.Project;

public class ProjectIndexService {
	
	ProjectIndexDao pidao = new ProjectIndexDao();
	
	public ArrayList<Project> recentTop5() {
		// 인덱스 최근 등록된 프로젝트용 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.recentTop5(conn);
		close(conn);
		return list;
	}

	public ArrayList<Project> endTop5() {
		// 인덱스 마감 임박용 프로젝트 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.endTop5(conn);
		close(conn);
		return list;
	}

}
