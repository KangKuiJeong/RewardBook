package inquiry.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import inquiry.model.dao.InquiryDao;
import inquiry.model.vo.Inquiry;
import project.model.vo.Project;

public class InquiryService {
	
	private InquiryDao iqDao = new InquiryDao();
	
	public int deleteInquery(String inq_no) {
		Connection conn = getConnection();
		int result = iqDao.deleteInquiry(conn, inq_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertInquery(String inq_no) {
		Connection conn = getConnection();
		int result = iqDao.insertInquiry(conn, inq_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateInquery(String inq_no) {
		Connection conn = getConnection();
		int result = iqDao.updateInquiry(conn, inq_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Inquiry> listInquery() {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqDao.listInquiry(conn);
		
		return list;
	}

	public ArrayList<Inquiry> pageSelect(int start, int limit, String check1, String check2, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqDao.pageSelect(conn, start, limit, check1, check2, select1, text1);
		return list;
	}

	public int pageCount(String check1, String check2, String select1, String text1) {
		Connection conn = getConnection();
		int result = iqDao.pageCount(conn, check1, check2, select1, text1);
		return result;
	}

	
}
