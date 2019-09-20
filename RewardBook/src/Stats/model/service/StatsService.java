package Stats.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import Stats.model.dao.StatsDao;
import member.model.vo.Member;

public class StatsService {
	
	private StatsDao vDao = new StatsDao();
	
	public int insertVisit(java.sql.Date date, int count) {
		Connection conn = getConnection();
		int result = vDao.insertVisit(conn, date, count);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateVisit(int count) {
		Connection conn = getConnection();
		int result = vDao.updateVisit(conn, count);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int joinCount(int count) {
		Connection conn = getConnection();
		int result = vDao.joinCount(conn, count);
		close(conn);
		return result;
	}
}
