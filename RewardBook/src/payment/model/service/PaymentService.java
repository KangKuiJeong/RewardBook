package payment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;

public class PaymentService {
	PaymentDao pDao = new PaymentDao();
	
	public int deletePaymemt(String p_no) {
		Connection conn = getConnection();
		int result = pDao.deletePayment(conn, p_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertPaymemt(String p_no) {
		Connection conn = getConnection();
		int result = pDao.insertPayment(conn, p_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Payment> listPayment() {
		Connection conn = getConnection();
		ArrayList<Payment> list = pDao.listPayment(conn);
		
		return list;
	}

	public int updatePaymemt(String p_no) {
		Connection conn = getConnection();
		int result = pDao.updatePayment(conn, p_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
