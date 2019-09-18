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






	
	
	
	

}
