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

	public ArrayList<Payment> listPayment() {
		Connection conn = getConnection();
		ArrayList<Payment> list = pDao.listPayment(conn);
		close(conn);
		
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

	public Payment selectPayment(String u_no) {
		Connection conn = getConnection();
		Payment payment = pDao.selectPayment(conn, u_no);
		close(conn);
		
		return payment;
	}

	public int insertPayment(Payment pay) {
		Connection conn = getConnection();
		int result = pDao.insertPayment(conn, pay);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Payment> selectPay() {
		Connection conn = getConnection();
		ArrayList<Payment> payment = pDao.selectPay(conn);
		close(conn);
		
		return payment;
	}

	//결제가 성공했을때 pm_success를 y로 바꾸는 메소드
	public int SuccessPay(String pm_no) {
		Connection conn = getConnection();
		int result = pDao.insertPayment(conn, pm_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
