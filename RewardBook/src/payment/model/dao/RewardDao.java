package payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import payment.model.vo.Reward;
import static common.JDBCTemplate.*;

public class RewardDao {

	public int deleteReward(Connection conn, String r_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertReward(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Reward> listReward(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Reward> listReward(Connection conn, String p_no) {
		ArrayList<Reward> list = new ArrayList<Reward>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from reward where p_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reward reward = new Reward();
				
				reward.setR_no(rset.getString("R_NO"));
				reward.setP_no(rset.getString("P_NO"));
				reward.setR_amount(rset.getString("R_AMOUNT"));
				reward.setR_name(rset.getString("R_NAME"));
				reward.setR_detail(rset.getString("R_DETAIL"));
				reward.setR_price(rset.getInt("R_PRICE"));
				
				list.add(reward);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	public int updateReward(Connection conn, String r_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
