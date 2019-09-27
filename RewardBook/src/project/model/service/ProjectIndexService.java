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

	public ArrayList<Project> hitTop5() {
		// 인덱스 조회수 top5 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.hitTop5(conn);
		close(conn);
		return list;
	}

	public ArrayList<Project> likeTop5() {
		// 인덱스 like top5 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.likeTop5(conn);
		close(conn);
		return list;
	}

	public ArrayList<Project> itTop3() {
		// 인덱스 it new top3 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.itTop3(conn);
		close(conn);
		return list;
	}

	public ArrayList<Project> BeautyTop3() {
		// 인덱스 beauty new top3 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.BeautyTop3(conn);
		close(conn);
		return list;
	}


	public ArrayList<Project> FashionTop3() {
		// 인덱스 fashion new top3 service
		Connection conn = getConnection();
		ArrayList<Project> list = pidao.FashionTop3(conn);
		close(conn);
		return list;
	}

}
