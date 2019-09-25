package payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import payment.model.vo.Payment;
import static common.JDBCTemplate.*;

public class PaymentDao {

	public int deletePayment(Connection conn, String p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Payment> listPayment(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updatePayment(Connection conn, String p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Payment selectPayment(Connection conn, String u_no) {
		Payment payment = new Payment();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from payment where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				payment.setPm_no(rset.getString("PM_NO"));
				payment.setU_no(rset.getString("U_NO"));
				payment.setP_no(rset.getString("P_NO"));
				payment.setR_no(rset.getString("R_NO"));
				payment.setPm_option(rset.getString("PM_OPTION"));
				payment.setPm_price(rset.getInt("PM_PRICE"));
				payment.setPm_price_plus(rset.getInt("PM_PRICE_PLUS"));
				payment.setPm_mileage(rset.getInt("PM_MILEAGE"));
				payment.setPm_quantity(rset.getString("PM_QUANTITY"));
				payment.setPm_nopen(rset.getString("PM_NOPEN"));
				payment.setPm_popen(rset.getString("PM_POPEN"));
				payment.setPm_oid(rset.getString("PM_OID"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return payment;
	}

	public int insertPayment(Connection conn, Payment pay) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		if(pay.getPm_nopen() != "N" && pay.getPm_popen() == "N") {
			query = "insert into payment values(TO_CHAR(SEQ_PM_NO.nextval), ?, ?, ?, null, ?, ?,default, ?, default, ?, ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, pay.getU_no());
				pstmt.setString(2, pay.getP_no());
				pstmt.setString(3, pay.getR_no());
				pstmt.setInt(4, pay.getPm_price());
				pstmt.setInt(5, pay.getPm_price_plus());
				pstmt.setString(6, pay.getPm_quantity());
				pstmt.setString(7, pay.getPm_popen());
				pstmt.setString(8, pay.getPm_oid());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		}else if(pay.getPm_popen() != "N" && pay.getPm_nopen() == "N") {
			query = "insert into payment values(TO_CHAR(SEQ_PM_NO.nextval), ?, ?, ?, null, ?, ?,default, ?, ?, default, ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, pay.getU_no());
				pstmt.setString(2, pay.getP_no());
				pstmt.setString(3, pay.getR_no());
				pstmt.setInt(4, pay.getPm_price());
				pstmt.setInt(5, pay.getPm_price_plus());
				pstmt.setString(6, pay.getPm_quantity());
				pstmt.setString(7, pay.getPm_nopen());
				pstmt.setString(8, pay.getPm_oid());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		}else if(pay.getPm_popen() == "N" && pay.getPm_nopen() == "N"){
			query = "insert into payment values(TO_CHAR(SEQ_PM_NO.nextval), ?, ?, ?, null, ?, ?,default, ?, ?, ?, ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, pay.getU_no());
				pstmt.setString(2, pay.getP_no());
				pstmt.setString(3, pay.getR_no());
				pstmt.setInt(4, pay.getPm_price());
				pstmt.setInt(5, pay.getPm_price_plus());
				pstmt.setString(6, pay.getPm_quantity());
				pstmt.setString(7, pay.getPm_nopen());
				pstmt.setString(8, pay.getPm_popen());
				pstmt.setString(9, pay.getPm_oid());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		}
		
		
		
		return result;
	}

}
