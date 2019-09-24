package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MypageDao;
import project.model.vo.Project;

public class MypageService {
	MypageDao mdao = new MypageDao();

	
	//내 프로젝트 목록 조회
	public ArrayList<Project> myprojectList(String uNo) {
		Connection conn = getConnection();
		ArrayList<Project> list = mdao.myprojectList(conn, uNo);
		close(conn);
		return list;
	}
	
	
	//유저 프로젝트 목록 조회
	public ArrayList<Project> userPList(String uNo) {
		Connection conn = getConnection();
		ArrayList<Project> list = mdao.userPList(conn, uNo);
		close(conn);
		return list;
	}


	//후원한 프로젝트 목록 조회
	public ArrayList<Project> payprojectList(String uNo) {
		Connection conn = getConnection();
		ArrayList<Project> list = mdao.payprojectList(conn, uNo);
		close(conn);
		return list;
	}
	
	

}
