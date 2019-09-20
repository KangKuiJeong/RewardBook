package follow.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import follow.model.dao.FollowDao;
import follow.model.vo.Follow;
import member.model.vo.Member;

public class FollowService {
	
	private FollowDao fdao = new FollowDao();





	//팔로우 전체 갯수 조회 리턴
	public int getlistCount(String uNo) {
		Connection conn = getConnection();
		int result = fdao.getlistCount(conn, uNo);
		close(conn);
		return result;
	}


	
	//팔로워 목록 조회 리턴
	public ArrayList<Member> followerList(String uNo) {
		Connection conn = getConnection();
		ArrayList<Member> result = fdao.getfollowerList(conn, uNo);
		close(conn);
		return result;
	}


	//팔로잉 목록 조회 리턴
	public ArrayList<Member> followingList(String uNo) {
		Connection conn = getConnection();
		ArrayList<Member> result = fdao.getfollowingList(conn, uNo);
		close(conn);
		return result;
	}



	//팔로우 중인지 조회
	public int followFind(String u_no, String login_no) {
		Connection conn = getConnection();
		int result = fdao.getfollowFind(conn, u_no, login_no);
		close(conn);
		return result;
	}


	
	//팔로잉 추가
	public int followInsert(String u_no_f, String u_no_fr) {
		Connection conn = getConnection();
		int result = fdao.getfollowInsert(conn, u_no_f, u_no_fr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	//팔로우 취소 
	public int followDelete(String u_no_f, String u_no_fr) {
		Connection conn = getConnection();
		int result = fdao.getfollowDelete(conn, u_no_f, u_no_fr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}






	



	










	
	
	
	

}
