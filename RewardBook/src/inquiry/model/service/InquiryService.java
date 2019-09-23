package inquiry.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import inquiry.model.dao.InquiryDao;
import inquiry.model.vo.Inquiry;

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

	public ArrayList<Inquiry> selectNewInquiry() {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqDao.selectNewInquiry(conn);
		return list;
	}

	public ArrayList<Inquiry> pageSelect(int start, int limit, String check1, String check2, String check3, String check4, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqDao.pageSelect(conn, start, limit, check1, check2, check3, check4, select1, text1);
		return list;
	}

	public int pageCount(String check1, String check2, String check3, String check4, String select1, String text1) {
		Connection conn = getConnection();
		int result = iqDao.pageCount(conn, check1, check2, check3, check4, select1, text1);
		return result;
	}

	public ArrayList<Inquiry> pageSelect_D(int start, int limit, String check1, String check2, String check3, String check4, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqDao.pageSelect_D(conn, start, limit, check1, check2, check3, check4, select1, text1);
		return list;
	}

	public int pageCount_D(String check1, String check2, String check3, String check4, String select1, String text1) {
		Connection conn = getConnection();
		int result = iqDao.pageCount_D(conn, check1, check2, check3, check4, select1, text1);
		return result;
	}

	public Inquiry detailInquiry(String iq_no) {
		
		Connection conn = getConnection();
		Inquiry result = iqDao.detailInquiry(conn, iq_no);
		close(conn);
		
		return result;
		
	}

	public int replyInquiry_A(String no, String ano, String reply) {
		
		Connection conn = getConnection();
		
		int result = iqDao.replyInquiry_A(conn, no, ano, reply);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public void updateOC(String no) {
		
		Connection conn = getConnection();
		
		int result = iqDao.updateOC(conn, no);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
	}

}
