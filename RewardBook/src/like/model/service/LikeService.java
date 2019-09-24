package like.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import like.model.dao.LikeDao;
import project.model.vo.Project;

public class LikeService {
	
	
	LikeDao ldao = new LikeDao();

	
	//프로젝트 좋아요 목록 조회
	public ArrayList<Project> likeprojectList(String uNo) {
		Connection conn = getConnection();
	      ArrayList<Project> list = ldao.myprojectList(conn, uNo);
	      close(conn);
	      return list;
	}


	//프로젝트 좋아요 갯수 조회
	public int LikeProjectListCount(String p_no) {
		Connection conn = getConnection();
		int listCount = ldao.LikeProjectListCount(conn, p_no);
		close(conn);
		return listCount;
	}


	//프로젝트 좋아요 확인
	public int LikeProjectFind(String uNo, String p_no) {
		Connection conn = getConnection();
		int like_pfind = ldao.LikeProjectFind(conn, uNo, p_no);
		close(conn);
		return like_pfind;
		
	}


	//프로젝트 좋아요 추가
	public int LikeProjectInsert(String p_no, String uNo) {
		Connection conn = getConnection();
		int result = ldao.LikeProjectInsert(conn, p_no, uNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	
	//프로젝트 좋아요 삭제
	public int LikeProjectDelete(String p_no, String uNo) {
		Connection conn = getConnection();
		int result = ldao.LikeProjectDelete(conn, p_no, uNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	

}
