package review.model.service;

import review.model.dao.ReviewDao;
import review.model.vo.Review;

import java.sql.*;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

public class ReviewService {

	private ReviewDao rvDao = new ReviewDao();
	
	public int deleteReview(String rv_no) {
		Connection conn = getConnection();
		int result = rvDao.deleteReview(conn, rv_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertReview(String rv_no) {
		Connection conn = getConnection();
		int result = rvDao.insertReview(conn, rv_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Review> listReview() {
		Connection conn = getConnection();
		ArrayList<Review> list = rvDao.listReview(conn);
		
		return list;
	}

	public int updateReview(String rv_no) {
		Connection conn = getConnection();
		int result = rvDao.updateReview(conn, rv_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int ReviewCount(String uNo) {
		Connection conn = getConnection();
		int result = rvDao.ReviewCount(conn, uNo);
		close(conn);
		return result;
	}

	public ArrayList<Review> reviewList(String p_no) {
		Connection conn = getConnection();
		ArrayList<Review> list = rvDao.reviewList(conn, p_no);
		close(conn);
		return list;
	}

	
	//리뷰 등록 
	public int reviewInsert(String u_no, String p_no, String rv_title, String rv_text, int rv_grade) {
		Connection conn = getConnection();
		int result = rvDao.reviewInsert(conn, u_no, p_no, rv_title, rv_text, rv_grade);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Review selectReview(String p_no, String u_no) {
		Connection conn = getConnection();
		Review review = rvDao.selectReview(conn, u_no, p_no);
		
		close(conn);
		
		return review;
	}

	public int reviewUpdate(String u_no, String p_no, String rv_title, String rv_text, int rv_grade) {
		Connection conn = getConnection();
		int result = rvDao.reviewUpdate(conn, u_no, p_no, rv_title, rv_text, rv_grade);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int reviewDelete(String u_no, String p_no) {
		Connection conn = getConnection();
		int result = rvDao.reviewDelete(conn, u_no, p_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}
