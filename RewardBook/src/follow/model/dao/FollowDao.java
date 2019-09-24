package follow.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;

public class FollowDao {
	
	

	//팔로워 전체 갯수 조회 리턴
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
		
		String query = "select u_no, u_name, u_profile from users where u_no in (select u_no_fr from follow where u_no_f = ?) order by u_name";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setuNo(rset.getString(1));
				member.setName(rset.getString(2));
				member.setProfileImg(rset.getString(3));
				
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
		
		String query = "select u_no, u_name, u_profile from users where u_no in (select u_no_f from follow where u_no_fr = ?) order by u_name";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setuNo(rset.getString(1));
				member.setName(rset.getString(2));
				member.setProfileImg(rset.getString(3));
				
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
	

	
	//팔로우 중인지 조회
	public int getfollowFind(Connection conn, String u_no, String login_no) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from follow where u_no_f = ? and u_no_fr = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, u_no);
			pstmt.setString(2, login_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	
	//팔로잉 추가
	public int getfollowInsert(Connection conn, String u_no_f, String u_no_fr) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "insert into follow values (?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, u_no_f);
			pstmt.setString(2, u_no_fr);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	
	//팔로우 취소
	public int getfollowDelete(Connection conn, String u_no_f, String u_no_fr) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "delete from follow where u_no_f = ? and u_no_fr = ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, u_no_f);
			pstmt.setString(2, u_no_fr);
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	

}
