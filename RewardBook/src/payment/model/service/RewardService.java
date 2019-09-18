package payment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import payment.model.dao.RewardDao;
import payment.model.vo.Reward;

import static common.JDBCTemplate.*;

public class RewardService {
	
	private RewardDao rDao = new RewardDao();
	
	public int deleteReward(String r_no) {
		Connection conn = getConnection();
		int result = rDao.deleteReward(conn, r_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertReward() {
		Connection conn = getConnection();
		int result = rDao.insertReward(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Reward> listReward() {
		Connection conn = getConnection();
		ArrayList<Reward> list = rDao.listReward(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reward> listReward(String p_no) {
		Connection conn = getConnection();
		ArrayList<Reward> list = rDao.listReward(conn, p_no);
		
		close(conn);
		
		return list;
	}

	public int updateReward(String r_no) {
		Connection conn = getConnection();
		int result = rDao.updateReward(conn, r_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
