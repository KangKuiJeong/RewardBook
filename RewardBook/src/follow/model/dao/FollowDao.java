package follow.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import follow.model.vo.Follow;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class FollowDao {
	
	

	//팔로우 전체 갯수 조회 리턴
	public int getlistCount(Connection conn, String uNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from users where u_no in (select u_no_fr from follow where u_no_f = ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	//팔로워 목록 조회 리턴
	public ArrayList<Member> getfollowerList(Connection conn, String uNo) {
ArrayList<Member> result = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select u_no, u_name from users where u_no in (select u_no_fr from follow where u_no_f = ?) order by u_name";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setuNo(rset.getString(1));
				member.setName(rset.getString(2));
				
				result.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	

	//팔로잉 목록 조회 리턴
	public ArrayList<Member> getfollowingList(Connection conn, String uNo) {
		ArrayList<Member> result = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select u_no, u_name from users where u_no in (select u_no_f from follow where u_no_fr = ?) order by u_name";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setuNo(rset.getString(1));
				member.setName(rset.getString(2));
				
				result.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	
	

}
