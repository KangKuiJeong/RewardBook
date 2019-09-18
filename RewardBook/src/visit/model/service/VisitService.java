package visit.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import visit.model.dao.VisitDao;

public class VisitService {
	
	private VisitDao vDao = new VisitDao();
	
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

}
