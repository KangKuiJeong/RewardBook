package inquiry.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.faq.model.vo.Faq;
import inquiry.model.dao.InquiryClientDao;
import inquiry.model.vo.Inquiry;

public class InquiryClientService {

	public InquiryClientService() {}
	
	InquiryClientDao iqcDao = new InquiryClientDao();
	
	//회원용 관리자 문의 글 조회
	public ArrayList<Inquiry> selectList(String u_no) {
		
		Connection conn = getConnection();
		ArrayList<Inquiry> list = iqcDao.selectlist(conn, u_no);
		close(conn);
		return list;
		
	}
	
	//관리자 문의 글 등록용 
	public int insertInquiry(Inquiry inq) {
		
		Connection conn = getConnection();
		int result = iqcDao.insertInquiry(conn, inq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
