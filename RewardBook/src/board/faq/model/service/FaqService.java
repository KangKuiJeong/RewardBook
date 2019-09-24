package board.faq.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.faq.model.dao.FaqDao;
import board.faq.model.vo.Faq;

public class FaqService {

	private FaqDao fDao = new FaqDao();

	public FaqService() {}
	public int deleteFAQ(String faq_no) {
		Connection conn = getConnection();
		int result = fDao.deleteFAQ(conn, faq_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateFAQ(Faq faq) {
		Connection conn = getConnection();
		int result = fDao.updateFAQ(conn, faq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int insertFAQ(Faq faq, String faq_oc) {
		Connection conn = getConnection();
		int result = fDao.insertFAQ(conn, faq, faq_oc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Faq> listFAQ(){
		Connection conn = getConnection();
		ArrayList<Faq> list = fDao.listFAQ(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Faq> SearchFAQ1(String searchbt, String faq_search){
		Connection conn = getConnection();
		ArrayList<Faq> list = fDao.searchFAQ1(conn, searchbt, faq_search);
		close(conn);
		return list;
	}
}
