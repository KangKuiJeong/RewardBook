package review.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.model.vo.Project;
import review.model.vo.Review;

public class ReviewDao {

	public int deleteReview(Connection conn, String rv_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertReview(Connection conn, String rv_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Review> listReview(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateReview(Connection conn, String rv_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//리뷰 갯 수 조회
	public int ReviewCount(Connection conn, String uNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from review where p_no in (select p_no from project where u_no = ?)";
		
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

	
	//리뷰 목록 조회
	public ArrayList<Review> reviewList(Connection conn, String p_no) {
		ArrayList<Review> list = new ArrayList<Review>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = "select trunc(sysdate - rv_date), u_profile, rv_no, p_no, u_no, u_name, rv_title, rv_text, rv_date, rv_grade, rv_img from review join users using (u_no) where p_no = ?";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, p_no);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Review review = new Review();
	            
	            review.setRv_no(rset.getString("rv_no"));
	            review.setP_no(rset.getString("p_no"));
	            review.setU_no(rset.getString("u_no"));
	            review.setU_name(rset.getString("u_name"));
	            review.setRv_title(rset.getString("rv_title"));
	            review.setRv_text(rset.getString("rv_text"));
	            review.setRv_date(rset.getDate("rv_date"));
	            review.setRv_grade(rset.getInt("rv_grade"));
	            review.setRv_img(rset.getString("rv_img"));
	            review.setRv_after(rset.getInt(1));
	            review.setU_profile(rset.getString(2));
	            
	            
	            list.add(review);
	            
	         }
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return list;
	}

	
	//리뷰 등록
	public int reviewInsert(Connection conn, String u_no, String p_no, String rv_title, String rv_text, int rv_grade) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "insert into review values(seq_rv_no.nextval, ?, ?, ?, ?, sysdate, ?, '')";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, p_no);
			pstmt.setString(2, u_no);
			pstmt.setString(3, rv_title);
			pstmt.setString(4, rv_text);
			pstmt.setInt(5, rv_grade);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Review selectReview(Connection conn, String u_no, String p_no) {
		Review review = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from review where u_no = ? and p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			pstmt.setString(2, p_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review.setRv_no(rset.getString("rv_no"));
				review.setP_no(rset.getString("p_no"));
				review.setU_no(rset.getString("u_no"));
				review.setRv_title(rset.getString("rv_title"));
				review.setRv_text(rset.getString("rv_text"));
				review.setRv_grade(rset.getInt("rv_grade"));
				review.setRv_date(rset.getDate("rv_date"));
				review.setRv_img(rset.getString("rv_img"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return review;
	}

	public int reviewUpdate(Connection conn, String u_no, String p_no, String rv_title, String rv_text, int rv_grade) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update review set rv_title = ?, rv_text = ?, rv_date = sysdate , rv_grade = ? where u_no = ? and p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, rv_title);
			pstmt.setString(2, rv_text);
			pstmt.setInt(3, rv_grade);
			pstmt.setString(4, u_no);
			pstmt.setString(5, p_no);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int reviewDelete(Connection conn, String u_no, String p_no) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "delete from review where p_no = ? and u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, p_no);
			pstmt.setString(2, u_no);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
