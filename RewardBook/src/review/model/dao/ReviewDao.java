package review.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	
}
