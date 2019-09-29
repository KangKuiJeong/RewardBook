package Stats.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import Stats.model.dao.StatsDao;
import member.model.vo.Member;

public class StatsService {
	
	private StatsDao sDao = new StatsDao();
	
	public void insertVisit(String date) {
		Connection conn = getConnection();
		int result = sDao.insertVisit(conn, date);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	public void updateVisit(String date) {
		Connection conn = getConnection();
		sDao.updateVisit(conn, date);
		close(conn);
	}

	public int checkVisit(String date) {
		Connection conn = getConnection();
		int result = sDao.checkVisit(conn, date);
		close(conn);
		return result;
	}

	public int getVisitCount(String date) {
		Connection conn = getConnection();
		int result = sDao.getVisitCount(conn, date);
		close(conn);
		return result;
	}

	public int getUserCount(String date) {
		Connection conn = getConnection();
		int result = sDao.getUserCount(conn, date);
		close(conn);
		return result;
	}
}
