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
	
}
